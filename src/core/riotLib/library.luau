--!nocheck
--!nolint

local Functions = require("core/functions.luau")
local GetService = Functions.SecureService

local library = {
	Components = {},
	Assets = {
		["DefaultImage"] = "rbxassetid://134552883719543",
		["ShieldCheck"] = "rbxassetid://72905476505849",
		["Shield"] = "rbxassetid://125424227377940",
		["Archive"] = "rbxassetid://86530498402003",
		["Folder"] = "rbxassetid://134156031333431",
		["Bolt"] = "rbxassetid://99791134265440",
		["Globe"] = "rbxassetid://132856339478739",
		["Computer"] = "rbxassetid://136037119434947",
		["Settings"] = "rbxassetid://71732494649961",
	},
	Colors = {
		SystemDarkRed = Color3.fromRGB(104, 29, 29),
	},
}

local libData = {
	folder = "Riot",
	unloaded = false,
	localPlayer = nil,
	camera = nil,
	gui = nil,
	overlay = nil,
	dropdownFrames = {},

	notifSystem = {
		totalOffset = 0,
		notifications = nil,
		uIpadding = nil,
		notifInstances = {},
	},

	tabSystem = {
		tabInstances = {},
		tabIndex = 0,
		currentTab = nil,
		currentContent = nil,
	},

	KeyMap_Spec = {
		[Enum.UserInputType.MouseButton1] = "VK_LBUTTON",
		[Enum.UserInputType.MouseButton2] = "VK_RBUTTON",
		[Enum.UserInputType.MouseButton3] = "VK_MBUTTON",
		[Enum.KeyCode.Return] = "VK_RETURN",
		[Enum.KeyCode.CapsLock] = "VK_CAPITAL",
		[Enum.KeyCode.PageUp] = "VK_PRIOR",
		[Enum.KeyCode.PageDown] = "VK_NEXT",
		[Enum.KeyCode.Escape] = "VK_ESCAPE",
		[Enum.KeyCode.Backspace] = "VK_BACK",
		[Enum.KeyCode.Space] = "VK_SPACE",
	},
}

local services = {
	_players = GetService("Players"),
	_runService = GetService("RunService"),
	_userInputService = GetService("UserInputService"),
	_tweenService = GetService("TweenService"),
	_workspace = GetService("Workspace"),
}

local utilities = {
	tween = function(instance, tweenInfo, properties)
		return services._tweenService:Create(instance, tweenInfo, properties)
	end,

	callback = function(func, ...)
		local args = { ... }
		task.spawn(function()
			func(table.unpack(args))
		end)
	end,

	parseKeyCode = function(input)
		if libData.KeyMap_Spec[input] then
			return libData.KeyMap_Spec[input]
		end

		if input.Name then
			return "VK_" .. input.Name:upper()
		end

		return "VK_UNKNOWN"
	end,

	secureGui = function(properties)
		local gui = Functions.ProtectGui(Instance.new("ScreenGui"))

		for property, value in pairs(properties) do
			if property ~= "Parent" then
				pcall(function()
					gui[property] = value
				end)
			end
		end

		return gui
	end,

	mouseInFrame = function(frame)
		local mousePos = services._userInputService:GetMouseLocation()
		local framePos = frame.AbsolutePosition
		local frameSize = frame.AbsoluteSize

		return mousePos.X >= framePos.X
			and mousePos.X <= framePos.X + frameSize.X
			and mousePos.Y >= framePos.Y
			and mousePos.Y <= framePos.Y + frameSize.Y
	end,

	makeDraggable = function(frame, interactable)
		assert(frame, "Expected a base frame for makeDraggable")

		interactable = interactable or frame

		local dragging = false
		local dragStart, startPos, dragInput

		local function update(input)
			local delta = input.Position - dragStart
			frame.Position =
				UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		interactable.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
				dragging = true
				dragStart = input.Position
				startPos = frame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		interactable.InputChanged:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch
			then
				dragInput = input
			end
		end)

		services._userInputService.InputChanged:Connect(function(input)
			if dragging and input == dragInput and frame.Visible then
				update(input)
			end
		end)
	end,

	subParser = {
		None = function(input)
			return input
		end,

		Numeric = function(input)
			return input:gsub("%D", "")
		end,

		Alphabetic = function(input)
			return input:gsub("[^a-zA-Z ]", "")
		end,

		Alphanumeric = function(input)
			return input:gsub("[^a-zA-Z0-9]", "")
		end,

		FloatNumeric = function(input)
			return input
				:gsub("[^-%.%d]", "")
				:gsub("^(%-?)0+", "%1")
				:gsub("(%-?)%.", "%10.")
				:gsub("(%..*)%.", "%1")
				:gsub("(%-.)", "%1")
		end,

		Mathematic = function(input)
			input = input:gsub("[^%d%.%+%-%*/%^%%%(%)]", "")

			local function tokenize(exp)
				local tokens = {}
				local number = ""

				for char in exp:gmatch(".") do
					if char:match("[%d%.]") then
						number = number .. char
					else
						if number ~= "" then
							table.insert(tokens, number)
							number = ""
						end
						table.insert(tokens, char)
					end
				end
				if number ~= "" then
					table.insert(tokens, number)
				end

				return tokens
			end

			local precedence = { ["+"] = 1, ["-"] = 1, ["*"] = 2, ["/"] = 2, ["%"] = 2, ["^"] = 3 }

			local function toPostfix(tokens)
				local output, operators = {}, {}

				for _, token in ipairs(tokens) do
					if tonumber(token) then
						table.insert(output, token)
					elseif token == "(" then
						table.insert(operators, token)
					elseif token == ")" then
						while #operators > 0 and operators[#operators] ~= "(" do
							table.insert(output, table.remove(operators))
						end
						table.remove(operators)
					else
						while
							#operators > 0
							and precedence[operators[#operators]]
							and precedence[operators[#operators]] >= precedence[token]
						do
							table.insert(output, table.remove(operators))
						end
						table.insert(operators, token)
					end
				end

				while #operators > 0 do
					table.insert(output, table.remove(operators))
				end

				return output
			end

			local function evaluate(pTokens)
				local stack = {}

				for _, token in ipairs(pTokens) do
					if tonumber(token) then
						table.insert(stack, tonumber(token))
					else
						local b, a = table.remove(stack), table.remove(stack)
						if not a or not b then
							return input
						end
						if token == "+" then
							table.insert(stack, a + b)
						elseif token == "-" then
							table.insert(stack, a - b)
						elseif token == "*" then
							table.insert(stack, a * b)
						elseif token == "/" then
							table.insert(stack, a / b)
						elseif token == "%" then
							table.insert(stack, a % b)
						elseif token == "^" then
							table.insert(stack, a ^ b)
						end
					end
				end

				return tostring(stack[1] or input)
			end

			return evaluate(toPostfix(tokenize(input)))
		end,
	},
}

function CreateSection(Parent, Settings, Flag)
	local _section = { Settings = Settings }

	local section = Instance.new("Frame")
	section.Name = "Section"
	section.AutomaticSize = Enum.AutomaticSize.Y
	section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	section.BackgroundTransparency = 1
	section.BorderColor3 = Color3.fromRGB(0, 0, 0)
	section.BorderSizePixel = 0
	section.Size = UDim2.fromScale(1, 0)

	local leading = Instance.new("TextButton")
	leading.Name = "Leading"
	leading.AutoButtonColor = false
	leading.AutomaticSize = Enum.AutomaticSize.Y
	leading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	leading.BackgroundTransparency = 1
	leading.BorderColor3 = Color3.fromRGB(0, 0, 0)
	leading.BorderSizePixel = 0
	leading.LayoutOrder = -1
	leading.Selectable = false
	leading.Size = UDim2.fromScale(1, 0)
	leading.Text = ""

	local name = Instance.new("TextLabel")
	name.Name = "Name"
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	name.LayoutOrder = 1
	name.Position = UDim2.fromOffset(28, 0)
	name.RichText = true
	name.TextColor3 = Color3.fromRGB(225, 225, 225)
	name.TextSize = 20
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = leading

	local chevron = Instance.new("ImageButton")
	chevron.Name = "Chevron"
	chevron.AnchorPoint = Vector2.new(0, 0.5)
	chevron.AutoButtonColor = false
	chevron.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
	chevron.BackgroundTransparency = 1
	chevron.BorderColor3 = Color3.fromRGB(0, 0, 0)
	chevron.BorderSizePixel = 0
	chevron.Image = "rbxassetid://77136690433593"
	chevron.LayoutOrder = 1
	chevron.Position = UDim2.fromScale(0, 0.5)
	chevron.Selectable = false
	chevron.Active = false
	chevron.Interactable = false
	chevron.Size = UDim2.fromOffset(18, 18)
	chevron.Parent = leading

	leading.Parent = section

	local trailing = Instance.new("Frame")
	trailing.Name = "Trailing"
	trailing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	trailing.BackgroundTransparency = 1
	trailing.BorderColor3 = Color3.fromRGB(0, 0, 0)
	trailing.BorderSizePixel = 0
	trailing.ClipsDescendants = true
	trailing.Size = UDim2.fromScale(1, 0)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 10)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = trailing

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 12)
	uIPadding.Parent = trailing

	local folder = Instance.new("Folder")
	folder.Name = "Folder"

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.AnchorPoint = Vector2.new(0, 1)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new(0, -12, 1, 0)
	frame.Size = UDim2.new(0, 1, 1, 0)
	frame.Parent = folder

	folder.Parent = trailing

	trailing.Parent = section

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 10)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = section

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingBottom = UDim.new(0, 8)
	uIPadding1.PaddingTop = UDim.new(0, 8)
	uIPadding1.Parent = section

	section.Parent = Parent

	local function updateDisclosure(state)
		if state then
			local Components = {}
			local NewSizeY = 0

			for _, v in pairs(trailing:GetChildren()) do
				if v:IsA("GuiObject") and v.Visible then
					table.insert(Components, v)
					NewSizeY += v.AbsoluteSize.Y
				end
			end

			if #Components > 1 then
				NewSizeY += (#Components - 1) * uIListLayout.Padding.Offset
			end

			utilities
				.tween(trailing, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Size = UDim2.new(1, 0, 0, NewSizeY) })
				:Play()

			utilities.tween(chevron, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Rotation = -180 }):Play()
		else
			utilities
				.tween(trailing, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Size = UDim2.new(1, 0, 0, 0) })
				:Play()

			utilities.tween(chevron, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Rotation = 0 }):Play()
		end
	end

	leading.MouseButton1Click:Connect(function()
		_section.Settings.Opened = not _section.Settings.Opened
		updateDisclosure(_section.Settings.Opened)
	end)

	local function trackChild(child)
		if not child:IsA("GuiObject") then
			return
		end

		child:GetPropertyChangedSignal("Visible"):Connect(function()
			if _section.Settings.Opened then
				updateDisclosure(true)
			end
		end)
		child:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if _section.Settings.Opened then
				updateDisclosure(true)
			end
		end)
	end

	for _, child in pairs(trailing:GetChildren()) do
		trackChild(child)
	end

	trailing.ChildAdded:Connect(function(child)
		trackChild(child)
		if _section.Settings.Opened then
			updateDisclosure(true)
		end
	end)

	trailing.ChildRemoved:Connect(function()
		if _section.Settings.Opened then
			updateDisclosure(true)
		end
	end)

	function _section:UpdateSettings(Settings)
		if Settings.Visible ~= nil then
			_section.Settings.Visible = Settings.Visible
			section.Visible = Settings.Visible
		end

		if Settings.Opened ~= nil then
			_section.Settings.Opened = Settings.Opened
			updateDisclosure(Settings.Opened)
		end

		if Settings.Name then
			_section.Settings.Name = Settings.Name
			name.Text = Settings.Name
		end
	end

	if _section.Settings.Closed == nil then
		_section.Settings.Closed = true
	end
	_section:UpdateSettings(_section.Settings)

	if Flag then
		library.Components[Flag] = _section
	end

	_section.Content = trailing
	injectComponents(_section)
	return _section
end

function CreateButton(Parent, Settings, Flag)
	local _button = { Settings = Settings }

	assert(_button.Settings.Name and type(_button.Settings.Name) == "string", "Missing button name or wrong type")

	local button = Instance.new("Frame")
	button.AutomaticSize = Enum.AutomaticSize.Y
	button.BackgroundColor3 = _button.Settings.Color or Color3.fromRGB(30, 30, 30)
	button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Visible = _button.Settings.Visible == nil and true or _button.Settings.Visible
	button.Parent = Parent

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = button

	local button1 = Instance.new("TextButton")
	button1.AutoButtonColor = false
	button1.AutomaticSize = Enum.AutomaticSize.Y
	button1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button1.BackgroundTransparency = 1
	button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button1.BorderSizePixel = 0
	button1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	button1.RichText = true
	button1.Size = UDim2.new(1, 0, 0, 40)
	button1.Text = _button.Settings.Name
	button1.TextColor3 = Color3.fromRGB(156, 156, 156)
	button1.TextSize = 15
	button1.TextWrapped = true
	button1.TextXAlignment = Enum.TextXAlignment.Center

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 12)
	uIPadding.PaddingLeft = UDim.new(0, 15)
	uIPadding.PaddingRight = UDim.new(0, 15)
	uIPadding.PaddingTop = UDim.new(0, 12)
	uIPadding.Parent = button1

	button1.Parent = button

	function _button:UpdateSettings(Settings)
		if Settings.Name then
			_button.Settings.Name = Settings.Name
			button1.Text = Settings.Name
		end

		if Settings.Color then
			_button.Settings.Color = Settings.Color
			button.BackgroundColor3 = Settings.Color
		end

		if Settings.Callback then
			_button.Settings.Callback = Settings.Callback
		end

		if Settings.Visible ~= nil then
			_button.Settings.Visible = Settings.Visible
			button.Visible = Settings.Visible
		end

		return _button
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _button:Continue()
		divider.Visible = false
		return _button
	end
	function _button:End()
		divider.Visible = true
		return _button
	end

	local cb = function()
		if _button.Settings.Callback then
			utilities.callback(_button.Settings.Callback)
		end
	end

	button1.MouseButton1Click:Connect(cb)

	if Flag then
		library.Components[Flag] = _button
	end

	return _button:End()
end

function CreateToggle(Parent, Settings, Flag)
	local _toggle = { Settings = Settings, Type = "Toggle" }

	assert(_toggle.Settings.Name and type(_toggle.Settings.Name) == "string", "Missing name or wrong type")

	local toggle = Instance.new("Frame")
	toggle.AutomaticSize = Enum.AutomaticSize.Y
	toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Size = UDim2.fromScale(1, 0)
	toggle.Parent = Parent
	toggle.Visible = _toggle.Settings.Visible == nil and true or _toggle.Settings.Visible

	local info = Instance.new("Frame")
	info.AutomaticSize = Enum.AutomaticSize.Y
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.Size = UDim2.new(1, -50, 0, 33)

	local name = Instance.new("TextLabel")
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.RichText = true
	name.TextColor3 = Color3.fromRGB(225, 225, 225)
	name.TextSize = 16
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = info
	name.Text = _toggle.Settings.Name

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = info

	local description = Instance.new("TextLabel")
	description.AutomaticSize = Enum.AutomaticSize.XY
	description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	description.BackgroundTransparency = 1
	description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	description.BorderSizePixel = 0
	description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	description.LayoutOrder = 1
	description.RichText = true
	description.Text = _toggle.Settings.Description or ""
	description.TextColor3 = Color3.fromRGB(80, 80, 80)
	description.TextSize = 12
	description.TextWrapped = true
	description.TextXAlignment = Enum.TextXAlignment.Left
	description.Parent = info
	description.Visible = _toggle.Settings.Description and true or false

	info.Parent = toggle

	local toggle1 = Instance.new("ImageLabel")
	toggle1.AnchorPoint = Vector2.new(1, 0.5)
	toggle1.BackgroundColor3 = Color3.fromRGB(37, 37, 46)
	toggle1.BackgroundTransparency = 1
	toggle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle1.BorderSizePixel = 0
	toggle1.Image = "rbxassetid://86699956318312"
	toggle1.ImageColor3 = Color3.fromRGB(33, 36, 45)
	toggle1.Position = UDim2.fromScale(1, 0.5)
	toggle1.Size = UDim2.fromOffset(35, 10)

	local toggleUIPadding = Instance.new("UIPadding")
	toggleUIPadding.Name = "ToggleUIPadding"
	toggleUIPadding.PaddingBottom = UDim.new(0, 1)
	toggleUIPadding.PaddingLeft = UDim.new(0, -8)
	toggleUIPadding.PaddingTop = UDim.new(0, 1)
	toggleUIPadding.Parent = toggle1

	local head = Instance.new("ImageLabel")
	head.AnchorPoint = Vector2.new(1, 0.5)
	head.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
	head.BackgroundTransparency = 1
	head.BorderColor3 = Color3.fromRGB(0, 0, 0)
	head.BorderSizePixel = 0
	head.Image = "rbxassetid://83379579183005"
	head.ImageColor3 = Color3.fromRGB(156, 156, 156)
	head.Position = UDim2.fromScale(0.5, 0.5)
	head.Size = UDim2.fromOffset(14, 14)
	head.Parent = toggle1

	toggle1.Parent = toggle

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 8)
	uIPadding.PaddingTop = UDim.new(0, 8)
	uIPadding.Parent = toggle

	local interact = Instance.new("TextButton")
	interact.AutoButtonColor = false
	interact.BackgroundTransparency = 1
	interact.Size = UDim2.fromScale(1, 1)
	interact.Text = ""
	interact.Parent = toggle

	_toggle.Settings.State = _toggle.Settings.State or false

	local function toggleState()
		utilities
			.tween(head, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
				Position = UDim2.fromScale(_toggle.Settings.State and 1 or 0.5, 0.5),
				ImageColor3 = _toggle.Settings.State and Color3.fromRGB(138, 193, 227) or Color3.fromRGB(156, 156, 156),
			})
			:Play()

		if _toggle.Settings.Callback then
			utilities.callback(_toggle.Settings.Callback, _toggle, _toggle.Settings.State)
		end
	end

	interact.MouseButton1Click:Connect(function()
		_toggle.Settings.State = not _toggle.Settings.State

		toggleState()
	end)

	function _toggle:UpdateSettings(Settings)
		if Settings.Name then
			_toggle.Settings.Name = Settings.Name
			name.Text = Settings.Name
		end

		if Settings.Description ~= nil then
			_toggle.Settings.Description = Settings.Description
			description.Text = Settings.Description or ""
			description.Visible = Settings.Description and true or false
		end

		if Settings.State ~= nil then
			_toggle.Settings.State = Settings.State
			toggleState()
		end

		if Settings.Callback then
			_toggle.Settings.Callback = Settings.Callback
		end

		if Settings.Visible ~= nil then
			_toggle.Settings.Visible = Settings.Visible
			toggle.Visible = Settings.Visible
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _toggle:Continue()
		divider.Visible = false
		return _toggle
	end
	function _toggle:End()
		divider.Visible = true
		return _toggle
	end

	toggleState()

	if Flag then
		library.Components[Flag] = _toggle
	end

	_toggle.Content = Parent
	injectComponents(_toggle, "Colorpicker")
	return _toggle:End()
end

function CreateSlider(Parent, Settings, Flag)
	local _slider = { Settings = Settings, Type = "Slider" }

	assert(_slider.Settings.Name and type(_slider.Settings.Name) == "string", "Missing name or wrong type")
	assert(_slider.Settings.Value and type(_slider.Settings.Value) == "number", "Missing value or wrong type")
	assert(_slider.Settings.Minimum and type(_slider.Settings.Minimum) == "number", "Missing minimum or wrong type")
	assert(_slider.Settings.Maximum and type(_slider.Settings.Maximum) == "number", "Missing maximum or wrong type")
	assert(_slider.Settings.Minimum <= _slider.Settings.Maximum, "Minimum should be less than Maximum")
	assert(_slider.Settings.Maximum >= _slider.Settings.Minimum, "Maximum should be greater than Minimum")

	local slider = Instance.new("Frame")
	slider.AutomaticSize = Enum.AutomaticSize.Y
	slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider.BackgroundTransparency = 1
	slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider.BorderSizePixel = 0
	slider.Size = UDim2.fromScale(1, 0)
	slider.Visible = _slider.Settings.Visible == nil and true or _slider.Settings.Visible
	slider.Parent = Parent

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 8)
	uIPadding.PaddingTop = UDim.new(0, 8)
	uIPadding.Parent = slider

	local elementInfo = Instance.new("Frame")
	elementInfo.AutomaticSize = Enum.AutomaticSize.Y
	elementInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	elementInfo.BackgroundTransparency = 1
	elementInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	elementInfo.BorderSizePixel = 0
	elementInfo.Size = UDim2.fromScale(1, 0)

	local value = Instance.new("Frame")
	value.AnchorPoint = Vector2.new(1, 0.5)
	value.AutomaticSize = Enum.AutomaticSize.XY
	value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	value.BackgroundTransparency = 1
	value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	value.BorderSizePixel = 0
	value.LayoutOrder = 1
	value.Position = UDim2.fromScale(1, 0.5)

	local icon = Instance.new("ImageLabel")
	icon.AnchorPoint = Vector2.new(1, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.Image = "rbxassetid://82545477110166"
	icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
	icon.Position = UDim2.fromScale(1, 0.5)
	icon.Size = UDim2.fromOffset(20, 20)
	icon.Parent = value

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uIListLayout.Padding = UDim.new(0, 6)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = value

	local amount = Instance.new("TextLabel")
	amount.AnchorPoint = Vector2.new(0, 0.5)
	amount.AutomaticSize = Enum.AutomaticSize.XY
	amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	amount.BackgroundTransparency = 1
	amount.BorderColor3 = Color3.fromRGB(0, 0, 0)
	amount.BorderSizePixel = 0
	amount.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	amount.LayoutOrder = 1
	amount.Position = UDim2.fromScale(0, 0.5)
	amount.RichText = true
	amount.Text = "0"
	amount.TextColor3 = Color3.fromRGB(150, 150, 150)
	amount.TextSize = 16
	amount.TextWrapped = true
	amount.TextXAlignment = Enum.TextXAlignment.Left
	amount.Parent = value

	value.Parent = elementInfo

	local info = Instance.new("Frame")
	info.AutomaticSize = Enum.AutomaticSize.Y
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.Size = UDim2.new(1, -80, 0, 0)

	local name = Instance.new("TextLabel")
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.RichText = true
	name.Text = _slider.Settings.Name
	name.TextColor3 = Color3.fromRGB(225, 225, 225)
	name.TextSize = 16
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = info

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 5)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout1.Parent = info

	local description = Instance.new("TextLabel")
	description.AutomaticSize = Enum.AutomaticSize.XY
	description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	description.BackgroundTransparency = 1
	description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	description.BorderSizePixel = 0
	description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	description.LayoutOrder = 1
	description.RichText = true
	description.Text = _slider.Settings.Description or ""
	description.TextColor3 = Color3.fromRGB(80, 80, 80)
	description.TextSize = 12
	description.TextWrapped = true
	description.TextXAlignment = Enum.TextXAlignment.Left
	description.Parent = info
	description.Visible = _slider.Settings.Description and true or false

	info.Parent = elementInfo

	local uIListLayout2 = Instance.new("UIListLayout")
	uIListLayout2.Name = "UIListLayout"
	uIListLayout2.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout2.HorizontalFlex = Enum.UIFlexAlignment.Fill
	uIListLayout2.Padding = UDim.new(0, 5)
	uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout2.Parent = elementInfo

	elementInfo.Parent = slider

	local uIListLayout3 = Instance.new("UIListLayout")
	uIListLayout3.Name = "UIListLayout"
	uIListLayout3.Padding = UDim.new(0, 15)
	uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout3.Parent = slider

	local slider1 = Instance.new("TextButton")
	slider1.BackgroundColor3 = Color3.fromRGB(37, 37, 46)
	slider1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider1.BorderSizePixel = 0
	slider1.Size = UDim2.new(1, 0, 0, 10)
	slider1.Text = ""
	slider1.AutoButtonColor = false
	slider1.LayoutOrder = 1

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 15)
	uICorner.Parent = slider1

	local bar = Instance.new("Frame")
	bar.BackgroundColor3 = Color3.fromRGB(138, 193, 227)
	bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0, 0, 0, 10)

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 15)
	uICorner1.Parent = bar

	local clipcircle = Instance.new("ImageLabel")
	clipcircle.AnchorPoint = Vector2.new(0.5, 0.5)
	clipcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	clipcircle.BackgroundTransparency = 1
	clipcircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	clipcircle.BorderSizePixel = 0
	clipcircle.Image = "rbxassetid://127947626656649"
	clipcircle.ImageColor3 = Color3.fromRGB(20, 20, 20)
	clipcircle.Position = UDim2.fromScale(1, 0.5)
	clipcircle.Size = UDim2.fromOffset(26, 20)
	clipcircle.ZIndex = 2

	local circle = Instance.new("ImageLabel")
	circle.AnchorPoint = Vector2.new(0.5, 0.5)
	circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	circle.BackgroundTransparency = 1
	circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	circle.BorderSizePixel = 0
	circle.Image = "rbxassetid://98639906538385"
	circle.ImageColor3 = Color3.fromRGB(225, 225, 225)
	circle.Position = UDim2.fromScale(0.5, 0.5)
	circle.Size = UDim2.fromOffset(18, 18)
	circle.Parent = clipcircle

	clipcircle.Parent = slider1

	bar.Parent = slider1

	slider1.Parent = slider

	local function updateDisplay()
		local paddingLeft = 10
		local paddingRight = 10
		local sliderWidth = slider1.AbsoluteSize.X
		local usableWidth = sliderWidth - (paddingLeft + paddingRight)

		local min = _slider.Settings.Minimum
		local max = _slider.Settings.Maximum
		local value = _slider.Settings.Value or (min + max) / 2

		local alpha = (value - min) / (max - min)

		local circleRadius = clipcircle.AbsoluteSize.X / 2
		bar.Size = UDim2.new(0, usableWidth * alpha, 0, 10)
		clipcircle.Position = UDim2.new(0, paddingLeft + (usableWidth * alpha), 0.5, 0)

		local precise = tonumber(string.format("%." .. (_slider.Settings.Precision or 0) .. "f", value))
		local filtered = _slider.Settings.Filter and _slider.Settings.Filter(precise, min, max)
		amount.Text = filtered or precise
	end

	local function updateSlider(input)
		local paddingLeft = 10
		local paddingRight = 10
		local mousePosition = input.Position.X
		local halfWidth = circle.AbsoluteSize.X / 2
		local adjustedMousePosition = mousePosition - (halfWidth * 0.5)

		local barPositionX = slider1.AbsolutePosition.X + paddingLeft
		local barSizeX = slider1.AbsoluteSize.X - (paddingLeft + paddingRight)

		adjustedMousePosition = math.clamp(adjustedMousePosition - barPositionX, 0, barSizeX)

		local newValue = adjustedMousePosition / barSizeX
		newValue = _slider.Settings.Minimum + newValue * (_slider.Settings.Maximum - _slider.Settings.Minimum)

		local step = _slider.Settings.Step or 0
		_slider.Settings.Value = step > 0 and math.round(newValue / step) * step or newValue

		updateDisplay()

		if _slider.Settings.Callback then
			utilities.callback(_slider.Settings.Callback, _slider, _slider.Settings.Value)
		end
	end

	local dragging = false

	local inputBegan = function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			updateSlider(input)
			if _slider.Settings.inputChanged then
				utilities.callback(_slider.Settings.inputChanged, _slider, _slider.Settings.Value, dragging)
			end
		end
	end

	slider1.InputBegan:Connect(inputBegan)
	slider1.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
			if _slider.Settings.inputChanged then
				utilities.callback(_slider.Settings.inputChanged, _slider, _slider.Settings.Value, dragging)
			end
		end
	end)

	slider1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateDisplay)
	updateDisplay()

	services._userInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			updateSlider(input)
		end
	end)

	function _slider:UpdateSettings(Settings)
		if Settings.Visible ~= nil then
			_slider.Settings.Visible = Settings.Visible
			slider.Visible = Settings.Visible
		end

		if Settings.Name then
			_slider.Settings.Name = Settings.Name
			name.Text = Settings.Name
		end

		if Settings.Description ~= nil then
			_slider.Settings.Description = Settings.Description
			description.Text = Settings.Description or ""
			description.Visible = Settings.Description and true or false
		end

		if Settings.Minimum then
			_slider.Settings.Minimum = Settings.Minimum
		end

		if Settings.Maximum then
			_slider.Settings.Maximum = Settings.Maximum
		end

		if Settings.Step ~= nil then
			_slider.Settings.Step = Settings.Step
		end

		if Settings.Precision ~= nil then
			_slider.Settings.Precision = Settings.Precision
		end

		if Settings.Filter then
			_slider.Settings.Filter = Settings.Filter
		end

		if Settings.Callback then
			_slider.Settings.Callback = Settings.Callback
		end

		if Settings.inputChanged then
			_slider.Settings.inputChanged = Settings.inputChanged
		end

		if Settings.Value then
			local min = _slider.Settings.Minimum
			local max = _slider.Settings.Maximum
			local value = math.clamp(Settings.Value, min, max)
			local step = _slider.Settings.Step or 0
			if step > 0 then
				value = math.round(value / step) * step
			end
			_slider.Settings.Value = value

			task.defer(function()
				if slider1.AbsoluteSize.X == 0 then
					slider1:GetPropertyChangedSignal("AbsoluteSize"):Wait()
				end
				updateDisplay()

				if _slider.Settings.Callback then
					utilities.callback(_slider.Settings.Callback, _slider, _slider.Settings.Value)
				end
			end)
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _slider:Continue()
		divider.Visible = false
		return _slider
	end

	function _slider:End()
		divider.Visible = true
		return _slider
	end

	_slider:UpdateSettings(_slider.Settings)

	if Flag then
		library.Components[Flag] = _slider
	end

	return _slider:End()	
end

function CreateInput(Parent, Settings, Flag)
	local _input = { Settings = Settings, Type = "Input" }

	local input = Instance.new("Frame")
	input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	input.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input.BorderSizePixel = 0
	input.Size = UDim2.new(1, 0, 0, 40)
	input.Visible = _input.Settings.Visible == nil and true or _input.Settings.Visible
	input.Parent = Parent

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = input

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.Padding = UDim.new(0, 15)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = input

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingLeft = UDim.new(0, 15)
	uIPadding.Parent = input

	local inputBox = Instance.new("TextBox")
	inputBox.AnchorPoint = Vector2.new(0, 0.5)
	inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.BackgroundTransparency = 1
	inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	inputBox.BorderSizePixel = 0
	inputBox.ClearTextOnFocus = false
	inputBox.ClipsDescendants = true
	inputBox.CursorPosition = -1
	inputBox.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	inputBox.LayoutOrder = 1
	inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	inputBox.PlaceholderText = _input.Settings.Placeholder or "..."
	inputBox.Size = UDim2.new(1, -50, 1, 0)
	inputBox.Text = _input.Settings.Text or ""
	inputBox.TextColor3 = Color3.fromRGB(156, 156, 156)
	inputBox.TextSize = 15
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.Parent = input

	local icon = Instance.new("ImageLabel")
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.Image = "rbxassetid://98129527229953"
	icon.ImageColor3 = Color3.fromRGB(156, 156, 156)
	icon.Size = UDim2.fromOffset(20, 20)
	icon.Parent = input

	inputBox.FocusLost:Connect(function()
		if _input.Settings.CharacterSub == "Mathematic" then
			inputBox.Text = utilities.subParser[_input.Settings.CharacterSub](inputBox.Text)
		end

		if _input.Settings.Callback then
			utilities.callback(_input.Settings.Callback, _input, inputBox.Text)
		end
	end)

	inputBox:GetPropertyChangedSignal("Text"):Connect(function()
		if
			_input.Settings.CharacterSub
			and _input.Settings.CharacterSub ~= "Mathematic"
			and utilities.subParser[_input.Settings.CharacterSub]
		then
			inputBox.Text = utilities.subParser[_input.Settings.CharacterSub](inputBox.Text)
		elseif type(_input.Settings.CharacterSub) == "function" then
			inputBox.Text = _input.Settings.CharacterSub(inputBox.Text)
		end

		if _input.Settings.CharacterLimit then
			if string.len(inputBox.Text) > _input.Settings.CharacterLimit then
				inputBox.Text = string.sub(inputBox.Text, 1, _input.Settings.CharacterLimit)
			end
		end

		_input.Settings.Text = inputBox.Text
		if _input.Settings.onTextChanged then
			utilities.callback(_input.Settings.onTextChanged, _input, inputBox.Text)
		end
	end)

	function _input:UpdateSettings(Settings)
		if Settings.Text then
			_input.Settings.Text = Settings.Text
			inputBox.Text = Settings.Text

			if _input.Settings.Callback then
				utilities.callback(_input.Settings.Callback, _input, inputBox.Text)
			end
		end

		if Settings.Placeholder then
			_input.Settings.Placeholder = Settings.Placeholder
			inputBox.PlaceholderText = Settings.Placeholder
		end

		if Settings.Callback then
			_input.Settings.Callback = Settings.Callback
		end

		if Settings.onTextChanged then
			_input.Settings.onTextChanged = Settings.onTextChanged
		end

		if Settings.Visible ~= nil then
			_input.Settings.Visible = Settings.Visible
			input.Visible = Settings.Visible
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _input:Continue()
		divider.Visible = false
		return _input
	end
	function _input:End()
		divider.Visible = true
		return _input
	end

	_input:UpdateSettings(_input.Settings)

	if Flag then
		library.Components[Flag] = _input
	end
	return _input:End()
end

function CreateMultiInput(Parent, Settings, Flag)
	local _multiInput = { Settings = Settings, Type = "MultiInput" }

	local multiInput = Instance.new("Frame")
	multiInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	multiInput.BackgroundTransparency = 1
	multiInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	multiInput.BorderSizePixel = 0
	multiInput.Size = UDim2.new(1, 0, 0, 40)
	multiInput.Parent = Parent

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.HorizontalFlex = Enum.UIFlexAlignment.Fill
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = multiInput

	local data = {}

	for i, v in ipairs(_multiInput.Settings.Inputs) do
		local inputBox = Instance.new("TextBox")
		inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		inputBox.BorderSizePixel = 0
		inputBox.ClearTextOnFocus = false
		inputBox.ClipsDescendants = true
		inputBox.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
		inputBox.LayoutOrder = 1
		inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
		inputBox.PlaceholderText = v.Placeholder or "..."
		inputBox.Size = UDim2.fromScale(1, 1)
		inputBox.Text = v.Text or ""
		inputBox.TextColor3 = Color3.fromRGB(156, 156, 156)
		inputBox.TextSize = 15
		inputBox.TextXAlignment = Enum.TextXAlignment.Left
		inputBox.Parent = multiInput
		data[i] = {
			inputBox = inputBox,
		}

		local uIPadding = Instance.new("UIPadding")
		uIPadding.PaddingLeft = UDim.new(0, 10)
		uIPadding.PaddingRight = UDim.new(0, 10)
		uIPadding.Parent = inputBox

		local uICorner = Instance.new("UICorner")
		uICorner.CornerRadius = UDim.new(0, 5)
		uICorner.Parent = inputBox

		local parseMethod = v.CharacterSub or "None"

		inputBox.FocusLost:Connect(function()
			if _multiInput.Settings.Callback then
				utilities.callback(_multiInput.Settings.Callback, _multiInput, i, inputBox.Text)
			end
		end)

		inputBox:GetPropertyChangedSignal("Text"):Connect(function()
			if parseMethod and type(parseMethod) == "string" and utilities.subParser[parseMethod] then
				inputBox.Text = utilities.subParser[parseMethod](inputBox.Text)
			elseif parseMethod and type(parseMethod) == "function" then
				inputBox.Text = v.CharacterSub(inputBox.Text)
			end

			if v.CharacterLimit then
				if string.len(inputBox.Text) > v.CharacterLimit then
					inputBox.Text = string.sub(inputBox.Text, 1, v.CharacterLimit)
				end
			end

			v.Text = inputBox.Text

			if _multiInput.Settings.onTextChanged then
				utilities.callback(_multiInput.Settings.onTextChanged, _multiInput, i, inputBox.Text)
			end
		end)
	end

	function _multiInput:UpdateSettings(index, Settings)
		local input = _multiInput.Settings.Inputs[index]
		local entry = data[index]

		if input and entry then
			if Settings.Text ~= nil then
				input.Text = Settings.Text
				entry.inputBox.Text = Settings.Text

				if _multiInput.Settings.Callback then
					utilities.callback(_multiInput.Settings.Callback, _multiInput, index, Settings.Text)
				end
			end

			if Settings.Placeholder ~= nil then
				input.Placeholder = Settings.Placeholder
				entry.inputBox.PlaceholderText = Settings.Placeholder
			end
		end

		if Settings.Callback ~= nil then
			_multiInput.Settings.Callback = Settings.Callback
		end

		if Settings.onTextChanged ~= nil then
			_multiInput.Settings.onTextChanged = Settings.onTextChanged
		end

		if Settings.Visible ~= nil then
			_multiInput.Settings.Visible = Settings.Visible
			multiInput.Visible = Settings.Visible
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _multiInput:Continue()
		divider.Visible = false
		return _multiInput
	end
	function _multiInput:End()
		divider.Visible = true
		return _multiInput
	end

	for i, input in pairs(_multiInput.Settings.Inputs) do
		_multiInput:UpdateSettings(i, input)
	end

	if Flag then
		library.Components[Flag] = _multiInput
	end
	return _multiInput:End()
end

function CreateDropdown(Parent, Settings, Flag)
	local _dropdown = { Settings = Settings, Type = "Dropdown" }

	assert(_dropdown.Settings.Name and type(_dropdown.Settings.Name) == "string", "Missing name or wrong type")

	local dropdown = Instance.new("Frame")
	dropdown.AutomaticSize = Enum.AutomaticSize.Y
	dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dropdown.BackgroundTransparency = 1
	dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdown.BorderSizePixel = 0
	dropdown.Size = UDim2.fromScale(1, 0)
	dropdown.Parent = Parent

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 8)
	uIPadding.PaddingTop = UDim.new(0, 8)
	uIPadding.Parent = dropdown

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Padding = UDim.new(0, 15)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = dropdown

	local dropdown1 = Instance.new("TextButton")
	dropdown1.AutoButtonColor = false
	dropdown1.AutomaticSize = Enum.AutomaticSize.Y
	dropdown1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	dropdown1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdown1.BorderSizePixel = 0
	dropdown1.ClipsDescendants = true
	dropdown1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	dropdown1.LayoutOrder = 1
	dropdown1.Position = UDim2.fromScale(0, 0.16)
	dropdown1.Size = UDim2.new(1, 0, 0, 40)
	dropdown1.Text = ""
	dropdown1.TextColor3 = Color3.fromRGB(156, 156, 156)
	dropdown1.TextSize = 15
	dropdown1.TextXAlignment = Enum.TextXAlignment.Left
	dropdown1.TextYAlignment = Enum.TextYAlignment.Top

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.PaddingBottom = UDim.new(0, 10)
	uIPadding1.PaddingLeft = UDim.new(0, 15)
	uIPadding1.PaddingRight = UDim.new(0, 15)
	uIPadding1.PaddingTop = UDim.new(0, 10)
	uIPadding1.Parent = dropdown1

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = dropdown1

	local info = Instance.new("Frame")
	info.AutomaticSize = Enum.AutomaticSize.Y
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.Size = UDim2.fromScale(1, 0)

	local chevron = Instance.new("ImageLabel")
	chevron.AnchorPoint = Vector2.new(1, 0.5)
	chevron.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
	chevron.BackgroundTransparency = 1
	chevron.BorderColor3 = Color3.fromRGB(0, 0, 0)
	chevron.BorderSizePixel = 0
	chevron.Image = "rbxassetid://77136690433593"
	chevron.ImageColor3 = Color3.fromRGB(150, 150, 150)
	chevron.LayoutOrder = 1
	chevron.Position = UDim2.fromScale(1, 0.5)
	chevron.Size = UDim2.fromOffset(18, 18)
	chevron.Parent = info

	local name = Instance.new("TextLabel")
	name.AutomaticSize = Enum.AutomaticSize.Y
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.RichText = true
	name.Size = UDim2.new(1, -35, 0, 20)
	name.Text = "..."
	name.TextColor3 = Color3.fromRGB(156, 156, 156)
	name.TextSize = 15
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = info

	info.Parent = dropdown1

	dropdown1.Parent = dropdown

	local info1 = Instance.new("Frame")
	info1.AutomaticSize = Enum.AutomaticSize.Y
	info1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info1.BackgroundTransparency = 1
	info1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info1.BorderSizePixel = 0
	info1.Size = UDim2.new(1, 0, 0, 33)

	local name1 = Instance.new("TextLabel")
	name1.AutomaticSize = Enum.AutomaticSize.XY
	name1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name1.BackgroundTransparency = 1
	name1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name1.BorderSizePixel = 0
	name1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name1.RichText = true
	name1.Text = "Name"
	name1.TextColor3 = Color3.fromRGB(225, 225, 225)
	name1.TextSize = 16
	name1.TextWrapped = true
	name1.TextXAlignment = Enum.TextXAlignment.Left
	name1.Parent = info1

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Padding = UDim.new(0, 5)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout1.Parent = info1

	local description = Instance.new("TextLabel")
	description.AutomaticSize = Enum.AutomaticSize.XY
	description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	description.BackgroundTransparency = 1
	description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	description.BorderSizePixel = 0
	description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	description.LayoutOrder = 1
	description.RichText = true
	description.Text = "description"
	description.TextColor3 = Color3.fromRGB(80, 80, 80)
	description.TextSize = 12
	description.TextWrapped = true
	description.TextXAlignment = Enum.TextXAlignment.Left
	description.Parent = info1
	description.Visible = _dropdown.Settings.Description and true or false

	info1.Parent = dropdown

	local dropdownFrame = Instance.new("Frame")
	dropdownFrame.Name = "dropdownFrame"
	dropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	dropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdownFrame.BorderSizePixel = 0
	dropdownFrame.Size = UDim2.fromOffset(350, 150)

	local dropdownContent = Instance.new("ScrollingFrame")
	dropdownContent.Name = "dropdownContent"
	dropdownContent.Active = true
	dropdownContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
	dropdownContent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	dropdownContent.BackgroundTransparency = 1
	dropdownContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdownContent.BorderSizePixel = 0
	dropdownContent.CanvasSize = UDim2.new()
	dropdownContent.ScrollBarImageTransparency = 0.7
	dropdownContent.ScrollBarThickness = 3
	dropdownContent.Size = UDim2.fromScale(1, 1)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = dropdownContent

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingRight = UDim.new(0, 15)
	uIPadding.Parent = dropdownContent

	dropdownContent.Parent = dropdownFrame

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingBottom = UDim.new(0, 10)
	uIPadding1.PaddingLeft = UDim.new(0, 15)
	uIPadding1.PaddingTop = UDim.new(0, 3)
	uIPadding1.Parent = dropdownFrame

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = dropdownFrame

	local hovering = false
	local dropped = false
	local animating = false
	local selected = {}
	local options = {}
	local tweens = {
		Selected = Color3.fromRGB(225, 225, 225),
		Unselected = Color3.fromRGB(156, 156, 156),
	}
	table.insert(libData.dropdownFrames, dropdownFrame)

	local function parseSelection(sendCB)
		local selectedString = "..."

		local selectedNames = {}
		for _, idx in ipairs(selected) do
			local optionName = options[idx].Text
			table.insert(selectedNames, optionName)
		end

		if #selectedNames == 1 then
			selectedString = selectedNames[1]
		elseif #selectedNames > 1 then
			selectedString = table.concat(selectedNames, ", ")
		end

		name.Text = selectedString
		_dropdown.Settings.Value = selectedNames

		if sendCB and _dropdown.Settings.Callback then
			utilities.callback(_dropdown.Settings.Callback, _dropdown, selectedNames)
		end
	end

	local function updateSelection(index)
		local limit = _dropdown.Settings.Limit
		local minimum = _dropdown.Settings.Minimum or 0

		if table.find(selected, index) then
			if #selected - 1 < minimum then
				return
			end
			table.remove(selected, table.find(selected, index))
			utilities
				.tween(options[index], TweenInfo.new(0.1, Enum.EasingStyle.Sine), { TextColor3 = tweens.Unselected })
				:Play()
		else
			if limit and #selected >= limit then
				local removedIndex = table.remove(selected, 1)
				utilities
					.tween(
						options[removedIndex],
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ TextColor3 = tweens.Unselected }
					)
					:Play()
			end

			table.insert(selected, index)
			utilities
				.tween(options[index], TweenInfo.new(0.1, Enum.EasingStyle.Sine), { TextColor3 = tweens.Selected })
				:Play()
		end

		parseSelection(true)
	end

	local function parseOptions(ops)
		for i, v in ipairs(ops) do
			local button = Instance.new("TextButton")
			button.Name = "Button"
			button.AutoButtonColor = false
			button.AutomaticSize = Enum.AutomaticSize.Y
			button.BackgroundTransparency = 1
			button.BorderSizePixel = 0
			button.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			button.RichText = true
			button.Size = UDim2.fromScale(1, 0)
			button.Text = v
			button.TextColor3 = Color3.fromRGB(156, 156, 156)
			button.TextSize = 15
			button.TextWrapped = true
			button.TextXAlignment = Enum.TextXAlignment.Left
			button.Parent = dropdownContent
			button.LayoutOrder = i

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingBottom = UDim.new(0, 15)
			uIPadding.PaddingTop = UDim.new(0, 15)
			uIPadding.Parent = button

			button.MouseButton1Click:Connect(function()
				updateSelection(v)
			end)

			options[v] = button
		end
	end

	local function updateDropdownPosition()
		dropdownFrame.Position = UDim2.new(
			0,
			dropdown1.AbsolutePosition.X,
			0,
			dropdown1.AbsolutePosition.Y + (dropdown1.AbsoluteSize.Y * 2) + 25
		)
	end

	local function toggleDropdown()
		if animating then
			return
		end
		animating = true

		if dropped then
			utilities.tween(chevron, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Rotation = 0 }):Play()
			local t = utilities.tween(
				dropdownFrame,
				TweenInfo.new(0.1, Enum.EasingStyle.Sine),
				{ Size = UDim2.fromOffset(dropdown1.AbsoluteSize.X, 0) }
			)
			t:Play()
			t.Completed:Wait()
			dropdownFrame.Parent = nil
			dropped = false
		else
			utilities.tween(chevron, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Rotation = 180 }):Play()
			for _, frame in pairs(libData.dropdownFrames) do
				if frame == dropdownFrame then
					frame.Size = UDim2.fromOffset(dropdown1.AbsoluteSize.X, 0)
					frame.Parent = libData.gui
					utilities
						.tween(
							frame,
							TweenInfo.new(0.1, Enum.EasingStyle.Sine),
							{ Size = UDim2.fromOffset(dropdown1.AbsoluteSize.X, 150) }
						)
						:Play()
					updateDropdownPosition()
				else
					local t = utilities.tween(
						frame,
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ Size = UDim2.fromOffset(dropdown1.AbsoluteSize.X, 0) }
					)
					t.Completed:Connect(function()
						frame.Parent = nil
					end)
					t:Play()
				end
			end
			dropped = true
		end
		animating = false
	end

	dropdown1.MouseButton1Click:Connect(toggleDropdown)

	dropdown1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateDropdownPosition)
	dropdown1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateDropdownPosition)

	dropdownFrame.MouseEnter:Connect(function()
		hovering = true
	end)

	dropdownFrame.MouseLeave:Connect(function()
		hovering = false
	end)

	services._userInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not hovering and dropdownFrame.Parent then
			toggleDropdown()
		end
	end)

	function _dropdown:Insert(newOptions)
		parseOptions(newOptions)
	end

	function _dropdown:Remove(toRemove)
		for _, v in ipairs(toRemove) do
			for i = #_dropdown.Settings.Options, 1, -1 do
				if _dropdown.Settings.Options[i] == v then
					table.remove(_dropdown.Settings.Options, i)
				end
			end

			if options[v] then
				options[v]:Destroy()
				options[v] = nil
			end

			for i = #selected, 1, -1 do
				if selected[i] == v then
					table.remove(selected, i)
				end
			end
			parseSelection()
		end
	end

	function _dropdown:UpdateSettings(Settings)
		if Settings.Visible ~= nil then
			dropdown = Settings.Visible
		end

		if Settings.Name then
			_dropdown.Settings.Name = Settings.Name
			name1.Text = Settings.Name
		end

		if Settings.Description ~= nil then
			_dropdown.Settings.Description = Settings.Description
			description.Text = Settings.Description or ""
			description.Visible = Settings.Description and true or false
		end

		if Settings.Limit ~= nil then
			_dropdown.Settings.Limit = Settings.Limit
		end

		if Settings.Minimum then
			_dropdown.Settings.Minimum = Settings.Minimum
		end

		if Settings.Callback then
			_dropdown.Settings.Callback = Settings.Callback
		end

		if Settings.Options then
			_dropdown.Settings.Options = Settings.Options
			for _, v in pairs(options) do
				v:Destroy()
			end
			options = {}
			parseOptions(Settings.Options)
		end

		if Settings.Value ~= nil then
			if type(Settings.Value) == "string" then
				updateSelection(Settings.Value)
			elseif type(Settings.Value) == "table" then
				for _, v in pairs(Settings.Value) do
					updateSelection(v)
				end
			end
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _dropdown:Continue()
		divider.Visible = false
		return _dropdown
	end
	function _dropdown:End()
		divider.Visible = true
		return _dropdown
	end

	_dropdown:UpdateSettings(_dropdown.Settings)

	if Flag then
		library.Components[Flag] = _dropdown
	end
	return _dropdown:End()
end

function CreateColorpicker(Parent, Settings, Flag)
	local _colorpicker = { Settings = Settings, Type = "Colorpicker" }

	local colorpicker = Instance.new("Frame")
	colorpicker.Name = "Colorpicker"
	colorpicker.AutomaticSize = Enum.AutomaticSize.Y
	colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	colorpicker.BackgroundTransparency = 1
	colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
	colorpicker.BorderSizePixel = 0
	colorpicker.Size = UDim2.fromScale(1, 0)

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 8)
	uIPadding.PaddingTop = UDim.new(0, 8)
	uIPadding.Parent = colorpicker

	local elementInfo = Instance.new("Frame")
	elementInfo.Name = "ElementInfo"
	elementInfo.AutomaticSize = Enum.AutomaticSize.Y
	elementInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	elementInfo.BackgroundTransparency = 1
	elementInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	elementInfo.BorderSizePixel = 0
	elementInfo.Size = UDim2.fromScale(1, 0)

	local info = Instance.new("Frame")
	info.Name = "Info"
	info.AutomaticSize = Enum.AutomaticSize.Y
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.Size = UDim2.new(1, -80, 0, 0)

	local name = Instance.new("TextLabel")
	name.Name = "Name"
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.RichText = true
	name.Text = "Name"
	name.TextColor3 = Color3.fromRGB(225, 225, 225)
	name.TextSize = 16
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = info
	name.Visible = false

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = info

	local description = Instance.new("TextLabel")
	description.Name = "Description"
	description.AutomaticSize = Enum.AutomaticSize.XY
	description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	description.BackgroundTransparency = 1
	description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	description.BorderSizePixel = 0
	description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	description.LayoutOrder = 1
	description.RichText = true
	description.Text = "Description"
	description.TextColor3 = Color3.fromRGB(80, 80, 80)
	description.TextSize = 12
	description.TextWrapped = true
	description.TextXAlignment = Enum.TextXAlignment.Left
	description.Parent = info
	description.Visible = false

	info.Parent = elementInfo

	elementInfo.Parent = colorpicker

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 15)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = colorpicker

	local pickerColors = Instance.new("Frame")
	pickerColors.Name = "PickerColors"
	pickerColors.AutomaticSize = Enum.AutomaticSize.Y
	pickerColors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	pickerColors.BackgroundTransparency = 1
	pickerColors.BorderColor3 = Color3.fromRGB(0, 0, 0)
	pickerColors.BorderSizePixel = 0
	pickerColors.LayoutOrder = 1
	pickerColors.Size = UDim2.fromScale(1, 0)

	local suggestedColors = Instance.new("Frame")
	suggestedColors.Name = "SuggestedColors"
	suggestedColors.AutomaticSize = Enum.AutomaticSize.Y
	suggestedColors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	suggestedColors.BackgroundTransparency = 1
	suggestedColors.BorderColor3 = Color3.fromRGB(0, 0, 0)
	suggestedColors.BorderSizePixel = 0
	suggestedColors.Size = UDim2.fromScale(0.7, 0)

	local uIListLayout2 = Instance.new("UIListLayout")
	uIListLayout2.Name = "UIListLayout"
	uIListLayout2.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout2.Padding = UDim.new(0, 8)
	uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout2.Parent = suggestedColors

	suggestedColors.Parent = pickerColors

	local customColor = Instance.new("Frame")
	customColor.Name = "CustomColor"
	customColor.AnchorPoint = Vector2.new(1, 0)
	customColor.AutomaticSize = Enum.AutomaticSize.Y
	customColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	customColor.BackgroundTransparency = 1
	customColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	customColor.BorderSizePixel = 0
	customColor.Position = UDim2.fromScale(1, 0)
	customColor.Size = UDim2.fromScale(0.3, 0)

	local uIListLayout3 = Instance.new("UIListLayout")
	uIListLayout3.Name = "UIListLayout"
	uIListLayout3.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uIListLayout3.Padding = UDim.new(0, 8)
	uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout3.Parent = customColor

	local name1 = Instance.new("TextLabel")
	name1.Name = "Name"
	name1.AutomaticSize = Enum.AutomaticSize.XY
	name1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name1.BackgroundTransparency = 1
	name1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name1.BorderSizePixel = 0
	name1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name1.Text = "Custom"
	name1.TextColor3 = Color3.fromRGB(200, 200, 200)
	name1.TextSize = 13
	name1.TextWrapped = true
	name1.TextXAlignment = Enum.TextXAlignment.Left
	name1.Parent = customColor

	local customColor_Color = Instance.new("ImageButton")
	customColor_Color.Name = "SuggestionColor"
	customColor_Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	customColor_Color.BackgroundTransparency = 1
	customColor_Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
	customColor_Color.BorderSizePixel = 0
	customColor_Color.Image = "rbxassetid://79776444663640"
	customColor_Color.ImageColor3 = Color3.fromRGB(33, 182, 244)
	customColor_Color.LayoutOrder = 1
	customColor_Color.Size = UDim2.fromOffset(15, 15)

	local customColor_Transparency = Instance.new("ImageLabel")
	customColor_Transparency.Name = "Transparency"
	customColor_Transparency.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	customColor_Transparency.BackgroundTransparency = 1
	customColor_Transparency.BorderColor3 = Color3.fromRGB(0, 0, 0)
	customColor_Transparency.BorderSizePixel = 0
	customColor_Transparency.Image = "rbxassetid://101467502072089"
	customColor_Transparency.ImageTransparency = 1
	customColor_Transparency.Size = UDim2.fromScale(1, 1)
	customColor_Transparency.Parent = customColor_Color

	customColor_Color.Parent = customColor

	customColor.Parent = pickerColors

	pickerColors.Parent = colorpicker

	colorpicker.Parent = Parent

	--[[
	local colorpickerInput = Instance.new("Frame")
	colorpickerInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	colorpickerInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	colorpickerInput.BorderSizePixel = 0
	colorpickerInput.Size = UDim2.fromOffset(185, 40)
	colorpickerInput.Visible = false
	colorpickerInput.Parent = libData.gui

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = colorpickerInput

	local uIListLayoutCPInput = Instance.new("UIListLayout")
	uIListLayoutCPInput.Name = "UIListLayout"
	uIListLayoutCPInput.FillDirection = Enum.FillDirection.Horizontal
	uIListLayoutCPInput.Padding = UDim.new(0, 15)
	uIListLayoutCPInput.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayoutCPInput.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayoutCPInput.Parent = colorpickerInput

	local uIPaddingCPInput = Instance.new("UIPadding")
	uIPaddingCPInput.Name = "UIPadding"
	uIPaddingCPInput.PaddingLeft = UDim.new(0, 15)
	uIPaddingCPInput.Parent = colorpickerInput

	local inputBox = Instance.new("TextBox")
	inputBox.AnchorPoint = Vector2.new(0, 0.5)
	inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.BackgroundTransparency = 1
	inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	inputBox.BorderSizePixel = 0
	inputBox.ClearTextOnFocus = false
	inputBox.ClipsDescendants = true
	inputBox.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	inputBox.LayoutOrder = 1
	inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	inputBox.PlaceholderText = "R, G, B..."
	inputBox.Size = UDim2.new(1, -50, 1, 0)
	inputBox.Text = ""
	inputBox.TextColor3 = Color3.fromRGB(156, 156, 156)
	inputBox.TextSize = 15
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.Parent = colorpickerInput

	local icon = Instance.new("ImageLabel")
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.Image = "rbxassetid://88238578565569"
	icon.ImageColor3 = Color3.fromRGB(156, 156, 156)
	icon.Size = UDim2.fromOffset(20, 20)
	icon.Parent = colorpickerInput

	inputBox.AnchorPoint = Vector2.new(0, 0.5)
	inputBox.Position = UDim2.new(0, 0, 0.5, 0)

	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.Position = UDim2.new(0, 0, 0.5, 0)
	]]

	local CPcolorpickerInput = Instance.new("Frame")
	CPcolorpickerInput.Name = "ColorpickerInput"
	CPcolorpickerInput.AutomaticSize = Enum.AutomaticSize.X
	CPcolorpickerInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	CPcolorpickerInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CPcolorpickerInput.BorderSizePixel = 0
	CPcolorpickerInput.Position = UDim2.fromScale(0.272, 0.732)
	CPcolorpickerInput.Size = UDim2.fromOffset(0, 40)
	CPcolorpickerInput.Visible = false
	CPcolorpickerInput.Parent = libData.gui

	local CPuICorner = Instance.new("UICorner")
	CPuICorner.Name = "UICorner"
	CPuICorner.CornerRadius = UDim.new(0, 5)
	CPuICorner.Parent = CPcolorpickerInput

	local CPuIListLayout = Instance.new("UIListLayout")
	CPuIListLayout.Name = "UIListLayout"
	CPuIListLayout.FillDirection = Enum.FillDirection.Horizontal
	CPuIListLayout.Padding = UDim.new(0, 10)
	CPuIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	CPuIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	CPuIListLayout.Parent = CPcolorpickerInput

	local CPicon = Instance.new("ImageLabel")
	CPicon.Name = "Icon"
	CPicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CPicon.BackgroundTransparency = 1
	CPicon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CPicon.BorderSizePixel = 0
	CPicon.Image = "rbxassetid://88238578565569"
	CPicon.ImageColor3 = Color3.fromRGB(156, 156, 156)
	CPicon.Size = UDim2.fromOffset(20, 20)
	CPicon.Parent = CPcolorpickerInput

	local CPuIPadding = Instance.new("UIPadding")
	CPuIPadding.Name = "UIPadding"
	CPuIPadding.PaddingLeft = UDim.new(0, 15)
	CPuIPadding.PaddingRight = UDim.new(0, 10)
	CPuIPadding.Parent = CPcolorpickerInput

	local CPinputs = Instance.new("Frame")
	CPinputs.Name = "Inputs"
	CPinputs.AutomaticSize = Enum.AutomaticSize.X
	CPinputs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CPinputs.BackgroundTransparency = 1
	CPinputs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CPinputs.BorderSizePixel = 0
	CPinputs.Size = UDim2.fromScale(0, 1)

	local alpha = Instance.new("TextBox")
	alpha.Name = "Alpha"
	alpha.AutomaticSize = Enum.AutomaticSize.X
	alpha.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	alpha.BorderColor3 = Color3.fromRGB(0, 0, 0)
	alpha.BorderSizePixel = 0
	alpha.ClearTextOnFocus = false
	alpha.ClipsDescendants = true
	alpha.CursorPosition = -1
	alpha.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	alpha.LayoutOrder = 6
	alpha.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	alpha.PlaceholderText = "Alpha"
	alpha.Size = UDim2.fromScale(0, 1)
	alpha.Text = "255"
	alpha.TextColor3 = Color3.fromRGB(156, 156, 156)
	alpha.TextSize = 15
	alpha.TextXAlignment = Enum.TextXAlignment.Left

	local CPuICorner1 = Instance.new("UICorner")
	CPuICorner1.Name = "UICorner"
	CPuICorner1.CornerRadius = UDim.new(0, 5)
	CPuICorner1.Parent = alpha

	local CPuIPadding1 = Instance.new("UIPadding")
	CPuIPadding1.Name = "UIPadding"
	CPuIPadding1.PaddingLeft = UDim.new(0, 8)
	CPuIPadding1.PaddingRight = UDim.new(0, 8)
	CPuIPadding1.Parent = alpha

	alpha.Parent = CPinputs

	local red = Instance.new("TextBox")
	red.Name = "Red"
	red.AutomaticSize = Enum.AutomaticSize.X
	red.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	red.BorderColor3 = Color3.fromRGB(0, 0, 0)
	red.BorderSizePixel = 0
	red.ClearTextOnFocus = false
	red.ClipsDescendants = true
	red.CursorPosition = -1
	red.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	red.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	red.PlaceholderText = "Red"
	red.Size = UDim2.fromScale(0, 1)
	red.Text = "255"
	red.TextColor3 = Color3.fromRGB(156, 156, 156)
	red.TextSize = 15
	red.TextXAlignment = Enum.TextXAlignment.Left

	local CPuICorner2 = Instance.new("UICorner")
	CPuICorner2.Name = "UICorner"
	CPuICorner2.CornerRadius = UDim.new(0, 5)
	CPuICorner2.Parent = red

	local CPuIPadding2 = Instance.new("UIPadding")
	CPuIPadding2.Name = "UIPadding"
	CPuIPadding2.PaddingLeft = UDim.new(0, 8)
	CPuIPadding2.PaddingRight = UDim.new(0, 8)
	CPuIPadding2.Parent = red

	red.Parent = CPinputs

	local blue = Instance.new("TextBox")
	blue.Name = "Blue"
	blue.AutomaticSize = Enum.AutomaticSize.X
	blue.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	blue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	blue.BorderSizePixel = 0
	blue.ClearTextOnFocus = false
	blue.ClipsDescendants = true
	blue.CursorPosition = -1
	blue.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	blue.LayoutOrder = 4
	blue.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	blue.PlaceholderText = "Blue"
	blue.Size = UDim2.fromScale(0, 1)
	blue.Text = "255"
	blue.TextColor3 = Color3.fromRGB(156, 156, 156)
	blue.TextSize = 15
	blue.TextXAlignment = Enum.TextXAlignment.Left

	local CPuICorner3 = Instance.new("UICorner")
	CPuICorner3.Name = "UICorner"
	CPuICorner3.CornerRadius = UDim.new(0, 5)
	CPuICorner3.Parent = blue

	local CPuIPadding3 = Instance.new("UIPadding")
	CPuIPadding3.Name = "UIPadding"
	CPuIPadding3.PaddingLeft = UDim.new(0, 8)
	CPuIPadding3.PaddingRight = UDim.new(0, 8)
	CPuIPadding3.Parent = blue

	blue.Parent = CPinputs

	local green = Instance.new("TextBox")
	green.Name = "Green"
	green.AutomaticSize = Enum.AutomaticSize.X
	green.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	green.BorderColor3 = Color3.fromRGB(0, 0, 0)
	green.BorderSizePixel = 0
	green.ClearTextOnFocus = false
	green.ClipsDescendants = true
	green.CursorPosition = -1
	green.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	green.LayoutOrder = 2
	green.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	green.PlaceholderText = "Green"
	green.Size = UDim2.fromScale(0, 1)
	green.Text = "255"
	green.TextColor3 = Color3.fromRGB(156, 156, 156)
	green.TextSize = 15
	green.TextXAlignment = Enum.TextXAlignment.Left

	local CPuICorner4 = Instance.new("UICorner")
	CPuICorner4.Name = "UICorner"
	CPuICorner4.CornerRadius = UDim.new(0, 5)
	CPuICorner4.Parent = green

	local CPuIPadding4 = Instance.new("UIPadding")
	CPuIPadding4.Name = "UIPadding"
	CPuIPadding4.PaddingLeft = UDim.new(0, 8)
	CPuIPadding4.PaddingRight = UDim.new(0, 8)
	CPuIPadding4.Parent = green

	green.Parent = CPinputs

	local CPuIListLayout1 = Instance.new("UIListLayout")
	CPuIListLayout1.Name = "UIListLayout"
	CPuIListLayout1.FillDirection = Enum.FillDirection.Horizontal
	CPuIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	CPuIListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
	CPuIListLayout1.Parent = CPinputs

	CPinputs.Parent = CPcolorpickerInput

	function _colorpicker:SetColor(color: Color3, transparency: number)
		local finalAlpha = 1 - (transparency or 0)

		_colorpicker.Settings.Color = color
		_colorpicker.Settings.Transparency = finalAlpha

		local r = math.round(color.R * 255)
		local g = math.round(color.G * 255)
		local b = math.round(color.B * 255)
		local a = math.round((1 - finalAlpha) * 255)

		red.Text = tostring(r)
		green.Text = tostring(g)
		blue.Text = tostring(b)
		alpha.Text = tostring(a)

		customColor_Color.ImageColor3 = color
		customColor_Transparency.ImageTransparency = 1 - finalAlpha

		if _colorpicker.Settings.Callback then
			utilities.callback(_colorpicker.Settings.Callback, _colorpicker, color, finalAlpha)
		end

		return _colorpicker
	end

	local function updatePos()
		local buttonAbsPos = customColor_Color.AbsolutePosition
		local buttonSize = customColor_Color.AbsoluteSize

		local posX = buttonAbsPos.X + buttonSize.X
		local posY = buttonAbsPos.Y + (buttonSize.Y * 2) + CPcolorpickerInput.AbsoluteSize.Y

		CPcolorpickerInput.Position = UDim2.fromOffset(posX, posY)
	end
	updatePos()
	customColor_Color:GetPropertyChangedSignal("AbsolutePosition"):Connect(updatePos)

	customColor_Color.MouseButton1Click:Connect(function()
		CPcolorpickerInput.Visible = not CPcolorpickerInput.Visible
	end)

	local function handleInput()
		local r = tonumber(red.Text)
		local g = tonumber(green.Text)
		local b = tonumber(blue.Text)
		local a = tonumber(alpha.Text)

		r = r and math.clamp(r, 0, 255) or  (_colorpicker.Settings.Color.R * 255)
		g = g and math.clamp(g, 0, 255) or (_colorpicker.Settings.Color.G * 255)
		b = b and math.clamp(b, 0, 255) or  (_colorpicker.Settings.Color.B * 255)
		a = a and math.clamp(a, 0, 255) or  (1 - _colorpicker.Settings.Transparency) * 255

		local color = Color3.fromRGB(r, g, b)
		local transparency = a / 255

		_colorpicker:SetColor(color, transparency)
	end

	for _, child in pairs(CPinputs:GetChildren()) do
		if child:IsA("TextBox") then
			child.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					handleInput()
				end
			end)
		end
	end
	
	local hovering = false
	
	CPcolorpickerInput.MouseEnter:Connect(function()
		hovering = true
	end)

	CPcolorpickerInput.MouseLeave:Connect(function()
		hovering = false
	end)
	
	services._userInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not hovering and CPcolorpickerInput.Visible then
			CPcolorpickerInput.Visible = false
		end
	end)

	function _colorpicker:UpdateSettings(Settings)
		Settings = Settings or {}
		if Settings.Visible ~= nil then
			_colorpicker.Settings.Visible = Settings.Visible
			colorpicker.Visible = Settings.Visible
		end

		if Settings.Name then
			_colorpicker.Settings.Name = Settings.Name
			name.Text = Settings.Name
			name.Visible = Settings.Name and true or false
		end

		if Settings.Description then
			_colorpicker.Settings.Description = Settings.Description
			description.Text = Settings.Description or ""
			description.Visible = Settings.Description and true or false
		end

		if Settings.AlphaEnabled ~= nil then
			_colorpicker.Settings.AlphaEnabled = Settings.AlphaEnabled
			alpha.Visible = Settings.AlphaEnabled
		end

		if Settings.Color then
			_colorpicker:SetColor(Settings.Color[1], 1-(Settings.Color[2] or 0))
		end

		if Settings.SuggestionColors then
			_colorpicker.Settings.SuggestionColors = Settings.SuggestionColors

			for _, child in ipairs(suggestedColors:GetChildren()) do
				if child:IsA("GuiObject") then
					child:Destroy()
				end
			end

			for i, v in ipairs(Settings.SuggestionColors) do
				local color = v[1]
				local alpha = v[2] or 0

				local suggestionColor = Instance.new("ImageButton")
				suggestionColor.Name = "SuggestionColor"
				suggestionColor.BackgroundTransparency = 1
				suggestionColor.BorderSizePixel = 0
				suggestionColor.Image = "rbxassetid://79776444663640"
				suggestionColor.ImageColor3 = color
				suggestionColor.Size = UDim2.fromOffset(15, 15)
				suggestionColor.LayoutOrder = i

				local transparency = Instance.new("ImageLabel")
				transparency.Name = "Transparency"
				transparency.BackgroundTransparency = 1
				transparency.BorderSizePixel = 0
				transparency.Image = "rbxassetid://101467502072089"
				transparency.ImageTransparency = 1 - alpha
				transparency.Size = UDim2.fromScale(1, 1)
				transparency.Parent = suggestionColor

				suggestionColor.MouseButton1Click:Connect(function()
					_colorpicker:SetColor(color, 1-alpha)
				end)

				suggestionColor.Parent = suggestedColors
			end
		end

		if not Settings.Name and not Settings.Description then
			elementInfo.Visible = false
			uIPadding.PaddingTop = UDim.new(0, 0)
		elseif not Settings.Name and Settings.Description then
			uIPadding.PaddingTop = UDim.new(0, -5)
		else
			elementInfo.Visible = true
			uIPadding.PaddingTop = UDim.new(0, 8)
		end
	end

	_colorpicker:UpdateSettings(_colorpicker.Settings)

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _colorpicker:Continue()
		divider.Visible = false
		return _colorpicker
	end
	function _colorpicker:End()
		divider.Visible = true
		return _colorpicker
	end

	if Flag then
		library.Components[Flag] = _colorpicker
	end

	_colorpicker.Content = Parent
	injectComponents(_colorpicker, "Colorpicker")

	return _colorpicker:End()
end

function CreateKeybind(Parent, Settings, Flag)
	local _keybind = { Settings = Settings, Type = "Keybind" }

	local keybind = Instance.new("Frame")
	keybind.AutomaticSize = Enum.AutomaticSize.Y
	keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	keybind.BackgroundTransparency = 1
	keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keybind.BorderSizePixel = 0
	keybind.Size = UDim2.fromScale(1, 0)
	keybind.Visible = _keybind.Settings.Visible == nil and true or _keybind.Settings.Visible
	keybind.Parent = Parent

	local keybind1 = Instance.new("TextButton")
	keybind1.AutoButtonColor = false
	keybind1.AutomaticSize = Enum.AutomaticSize.Y
	keybind1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	keybind1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keybind1.BorderSizePixel = 0
	keybind1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	keybind1.Size = UDim2.new(1, 0, 0, 40)
	keybind1.Text = ""
	keybind1.TextColor3 = Color3.fromRGB(0, 0, 0)
	keybind1.TextSize = 14

	local name = Instance.new("TextLabel")
	name.AnchorPoint = Vector2.new(0, 0.5)
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.LayoutOrder = 1
	name.Position = UDim2.fromScale(0, 0.5)
	name.TextColor3 = Color3.fromRGB(156, 156, 156)
	name.TextSize = 15
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Text = "Unbinded"

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 10)
	uIPadding.PaddingRight = UDim.new(0, 50)
	uIPadding.PaddingTop = UDim.new(0, 10)
	uIPadding.Parent = name

	name.Parent = keybind1

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.PaddingLeft = UDim.new(0, 15)
	uIPadding1.Parent = keybind1

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.Padding = UDim.new(0, 15)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = keybind1

	local icon = Instance.new("ImageLabel")
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.Image = "rbxassetid://94052787260057"
	icon.ImageColor3 = Color3.fromRGB(156, 156, 156)
	icon.Size = UDim2.fromOffset(20, 20)
	icon.Parent = keybind1

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = keybind1

	keybind1.Parent = keybind

	local tweens = {
		Selected = Color3.fromRGB(225, 225, 225),
		Unselected = Color3.fromRGB(156, 156, 156),
	}

	local isBinding = false

	local function changeBindState(binding)
		if binding then
			icon.Visible = false
			name.Text = "Press a key"
			name.Size = UDim2.fromScale(1, 0)
			name.TextXAlignment = Enum.TextXAlignment.Center
			uIPadding.PaddingRight = UDim.new(0, 15)
			keybind1.Active = false
			keybind1.Interactable = false
		elseif binding == false then
			icon.Visible = true
			name.Size = UDim2.fromScale(0, 0)
			name.TextXAlignment = Enum.TextXAlignment.Left
			uIPadding.PaddingRight = UDim.new(0, 50)
			keybind1.Active = true
			keybind1.Interactable = true
		else
			icon.Visible = true
			name.Text = "Unbinded"
			name.Size = UDim2.fromScale(0, 0)
			name.TextXAlignment = Enum.TextXAlignment.Left
			uIPadding.PaddingRight = UDim.new(0, 50)
			keybind1.Active = true
			keybind1.Interactable = true
		end
	end

	if _keybind.Settings.Bind then
		changeBindState(false)
		if _keybind.Settings.Bind.EnumType == Enum.KeyCode then
			name.Text = utilities.parseKeyCode(_keybind.Settings.Bind)
		elseif
			_keybind.Settings.Bind == Enum.UserInputType.MouseButton1
			or _keybind.Settings.Bind == Enum.UserInputType.MouseButton2
		then
			name.Text = utilities.parseKeyCode(_keybind.Settings.Bind)
		end
	else
		changeBindState(nil)
	end

	keybind.MouseEnter:Connect(function()
		utilities.tween(icon, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { ImageColor3 = tweens.Selected }):Play()

		utilities.tween(name, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { TextColor3 = tweens.Selected }):Play()
	end)

	keybind.MouseLeave:Connect(function()
		utilities.tween(icon, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { ImageColor3 = tweens.Unselected }):Play()

		utilities.tween(name, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { TextColor3 = tweens.Unselected }):Play()
	end)

	keybind1.InputEnded:Connect(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
		then
			isBinding = true
			changeBindState(true)
		end
	end)

	services._userInputService.InputBegan:Connect(function(input, gameProcessed)
		if
			isBinding
			and not gameProcessed
			and not (
				_keybind.Settings.Blacklist
					and (
						table.find(_keybind.Settings.Blacklist, input.KeyCode)
						or table.find(_keybind.Settings.Blacklist, input.UserInputType)
					)
			)
		then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				_keybind.Settings.Bind = input.KeyCode
				name.Text = utilities.parseKeyCode(input.KeyCode)
				changeBindState(false)

				if _keybind.Settings.onChanged then
					utilities.callback(_keybind.Settings.onChanged, _keybind, _keybind.Settings.Bind)
				end
				isBinding = false
			elseif
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.MouseButton2
			then
				_keybind.Settings.Bind = input.UserInputType
				name.Text = utilities.parseKeyCode(input.UserInputType)
				changeBindState(false)

				if _keybind.Settings.onChanged then
					utilities.callback(_keybind.Settings.onChanged, _keybind, _keybind.Settings.Bind)
				end
				isBinding = false
			end
		end
	end)

	services._userInputService.InputBegan:Connect(function(input, gameProcessed)
		if not isBinding then
			if input.KeyCode == _keybind.Settings.Bind or input.UserInputType == _keybind.Settings.Bind then
				if _keybind.Settings.Callback then
					utilities.callback(_keybind.Settings.Callback, _keybind, gameProcessed)
				end
				if _keybind.Settings.onHeld then
					utilities.callback(_keybind.Settings.onHeld, _keybind, true, gameProcessed)
				end
			end
		end
	end)

	services._userInputService.InputEnded:Connect(function(input, gameProcessed)
		if
			not isBinding
			and (input.KeyCode == _keybind.Settings.Bind or input.UserInputType == _keybind.Settings.Bind)
		then
			if _keybind.Settings.onHeld then
				utilities.callback(_keybind.Settings.onHeld, _keybind, false, gameProcessed)
			end
		end
	end)

	function _keybind:UpdateSettings(Settings)
		if Settings.Visible ~= nil then
			_keybind.Settings.Visible = Settings.Visible
			keybind.Visible = Settings.Visible
		end

		if Settings.Bind then
			_keybind.Settings.Bind = Settings.Bind

			changeBindState(false)
			if _keybind.Settings.Bind.EnumType == Enum.KeyCode then
				name.Text = utilities.parseKeyCode(_keybind.Settings.Bind)
			elseif
				_keybind.Settings.Bind == Enum.UserInputType.MouseButton1
				or _keybind.Settings.Bind == Enum.UserInputType.MouseButton2
			then
				name.Text = utilities.parseKeyCode(_keybind.Settings.Bind)
			end

			if Settings.Callback then
				utilities.callback(_keybind.Settings.Callback, _keybind, false)
			end
		end

		if Settings.Callback then
			_keybind.Settings.Callback = Settings.Callback
		end

		if Settings.onHeld then
			_keybind.Settings.onHeld = Settings.onHeld
		end

		if Settings.onChanged then
			_keybind.Settings.onChanged = Settings.onChanged
		end
	end

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent

	function _keybind:Continue()
		divider.Visible = false
		return _keybind
	end
	function _keybind:End()
		divider.Visible = true
		return _keybind
	end

	_keybind:UpdateSettings(_keybind.Settings)

	if Flag then
		library.Components[Flag] = _keybind
	end
	return _keybind:End()
end

function CreateDivider(Parent, Settings, Flag)
	local _divider = { Settings = Settings }

	local divider = Instance.new("Frame")
	divider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.Parent = Parent
	divider.Visible = _divider.Settings and (_divider.Settings.Visible == nil and true or _divider.Settings.Visible)
		or true

	function _divider:UpdateSettings(Settings)
		if Settings.Visible ~= nil then
			_divider.Settings.Visible = Settings.Visible
			divider.Visible = Settings.Visible
		end
	end

	if Flag then
		library.Components[Flag] = _divider
	end

	return _divider
end

local SharedConstructors = {
	Section = CreateSection,
	Button = CreateButton,
	Toggle = CreateToggle,
	Keybind = CreateKeybind,
	Dropdown = CreateDropdown,
	Colorpicker = CreateColorpicker,
	MultiInput = CreateMultiInput,
	Input = CreateInput,
	Slider = CreateSlider,
	Divider = CreateDivider,
}

function injectComponents(class, SpecConstructor)
	for name, constructor in pairs(SharedConstructors) do
		if SpecConstructor and name == SpecConstructor then
			class[name] = function(self, ...)
				return constructor(self.Content, ...)
			end
			break
		else
			class[name] = function(self, ...)
				return constructor(self.Content, ...)
			end
		end
	end
end

function library:Window(Settings)
	local _window = { Settings = Settings }

	assert(_window.Settings.Title and type(_window.Settings.Title) == "string", "Missing window title or wrong type")
	_window.Settings.Keybind = _window.Settings.Keybind or Enum.KeyCode.RightControl
	libData.winKeybind = _window.Settings.Keybind

	local menu = Instance.new("ImageLabel")
	menu.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
	menu.BorderSizePixel = 0
	menu.ClipsDescendants = true
	menu.Image = "rbxassetid://17365187482"
	menu.ImageTransparency = 0.96
	menu.ScaleType = Enum.ScaleType.Tile
	menu.Size = UDim2.fromOffset(400, 672)
	menu.TileSize = UDim2.fromOffset(500, 325)

	local header = Instance.new("Frame")
	header.AutomaticSize = Enum.AutomaticSize.XY
	header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	header.BackgroundTransparency = 1
	header.BorderColor3 = Color3.fromRGB(0, 0, 0)
	header.BorderSizePixel = 0

	local header1 = Instance.new("TextLabel")
	header1.AutomaticSize = Enum.AutomaticSize.XY
	header1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	header1.BackgroundTransparency = 1
	header1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	header1.BorderSizePixel = 0
	header1.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	header1.RichText = true
	header1.Text = _window.Settings.Title
	header1.TextColor3 = Color3.fromRGB(255, 255, 255)
	header1.TextSize = 35
	header1.TextWrapped = true
	header1.TextXAlignment = Enum.TextXAlignment.Left
	header1.Parent = header

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingLeft = UDim.new(0, 25)
	uIPadding.PaddingRight = UDim.new(0, 25)
	uIPadding.Parent = header

	local underline = Instance.new("Frame")
	underline.AnchorPoint = Vector2.new(0, 1)
	underline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	underline.BackgroundTransparency = 0.9
	underline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	underline.BorderSizePixel = 0
	underline.Position = UDim2.new(0, 0, 1, 10)
	underline.Size = UDim2.new(0.95, 0, 0, 1)

	local underline1 = Instance.new("Frame")
	underline1.BackgroundColor3 = Color3.fromRGB(185, 228, 255)
	underline1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	underline1.BorderSizePixel = 0
	underline1.Size = UDim2.new(0.5, 0, 0, 1)
	underline1.Parent = underline

	underline.Parent = header

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Padding = UDim.new(0, 10)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = header

	header.Parent = menu

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 15)
	uICorner.Parent = menu

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.PaddingBottom = UDim.new(0, 25)
	uIPadding1.PaddingTop = UDim.new(0, 25)
	uIPadding1.Parent = menu

	local content = Instance.new("Frame")
	content.AnchorPoint = Vector2.new(0, 1)
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 1
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.ClipsDescendants = true
	content.LayoutOrder = 1
	content.Position = UDim2.fromScale(0, 1)
	content.Size = UDim2.new(1, 0, 1, -55)

	local tabs = Instance.new("ScrollingFrame")
	tabs.Active = true
	tabs.AutomaticCanvasSize = Enum.AutomaticSize.X
	tabs.AutomaticSize = Enum.AutomaticSize.Y
	tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabs.BackgroundTransparency = 1
	tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabs.BorderSizePixel = 0
	tabs.CanvasSize = UDim2.new()
	tabs.ScrollBarImageTransparency = 1
	tabs.ScrollBarThickness = 0
	tabs.ScrollingDirection = Enum.ScrollingDirection.X
	tabs.Size = UDim2.fromScale(1, 0)

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout1.Padding = UDim.new(0, 10)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = tabs

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.PaddingBottom = UDim.new(0, 10)
	uIPadding2.PaddingLeft = UDim.new(0, 26)
	uIPadding2.PaddingRight = UDim.new(0, 26)
	uIPadding2.PaddingTop = UDim.new(0, 1)
	uIPadding2.Parent = tabs

	tabs.Parent = content

	local uIListLayout2 = Instance.new("UIListLayout")
	uIListLayout2.Padding = UDim.new(0, 25)
	uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout2.Parent = content

	local content1 = Instance.new("Frame")
	content1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content1.BackgroundTransparency = 1
	content1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content1.BorderSizePixel = 0
	content1.Size = UDim2.new(1, 0, 1, -104)
	content1.Parent = content

	content.Parent = menu

	local uIListLayout3 = Instance.new("UIListLayout")
	uIListLayout3.Padding = UDim.new(0, 30)
	uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout3.Parent = menu

	menu.Parent = libData.overlay

	local uIPadding5 = Instance.new("UIPadding")
	uIPadding5.PaddingBottom = UDim.new(0, 15)
	uIPadding5.PaddingLeft = UDim.new(0, 15)
	uIPadding5.PaddingRight = UDim.new(0, 15)
	uIPadding5.PaddingTop = UDim.new(0, 15)
	uIPadding5.Parent = libData.overlay

	local visualPreview = Instance.new("ImageLabel")
	visualPreview.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	visualPreview.BorderColor3 = Color3.fromRGB(0, 0, 0)
	visualPreview.BorderSizePixel = 0
	visualPreview.ClipsDescendants = true
	visualPreview.Image = "rbxassetid://17365187482"
	visualPreview.ImageTransparency = 0.96
	visualPreview.ScaleType = Enum.ScaleType.Tile
	visualPreview.Size = UDim2.fromOffset(400, 570)
	visualPreview.TileSize = UDim2.fromOffset(500, 325)
	visualPreview.Visible = false
	visualPreview.ZIndex = 0
	visualPreview.Position = UDim2.fromOffset(menu.AbsoluteSize.X + 15, 0)

	local uICorner1 = Instance.new("UICorner")
	uICorner1.CornerRadius = UDim.new(0, 15)
	uICorner1.Parent = visualPreview

	local uIPadding3 = Instance.new("UIPadding")
	uIPadding3.PaddingBottom = UDim.new(0, 25)
	uIPadding3.PaddingLeft = UDim.new(0, 25)
	uIPadding3.PaddingRight = UDim.new(0, 15)
	uIPadding3.PaddingTop = UDim.new(0, 20)
	uIPadding3.Parent = visualPreview

	local header2 = Instance.new("Frame")
	header2.AutomaticSize = Enum.AutomaticSize.XY
	header2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	header2.BackgroundTransparency = 1
	header2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	header2.BorderSizePixel = 0

	local header3 = Instance.new("TextLabel")
	header3.AutomaticSize = Enum.AutomaticSize.XY
	header3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	header3.BackgroundTransparency = 1
	header3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	header3.BorderSizePixel = 0
	header3.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	header3.Text = "Visual Preview"
	header3.TextColor3 = Color3.fromRGB(255, 255, 255)
	header3.TextSize = 30
	header3.TextWrapped = true
	header3.TextXAlignment = Enum.TextXAlignment.Left
	header3.Parent = header2

	local underline2 = Instance.new("Frame")
	underline2.AnchorPoint = Vector2.new(0, 1)
	underline2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	underline2.BackgroundTransparency = 0.9
	underline2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	underline2.BorderSizePixel = 0
	underline2.Position = UDim2.new(0, 0, 1, 10)
	underline2.Size = UDim2.new(0.95, 0, 0, 1)

	local underline3 = Instance.new("Frame")
	underline3.BackgroundColor3 = Color3.fromRGB(185, 228, 255)
	underline3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	underline3.BorderSizePixel = 0
	underline3.Size = UDim2.new(0.5, 0, 0, 1)
	underline3.Parent = underline2

	underline2.Parent = header2

	header2.Parent = visualPreview

	local uIListLayout4 = Instance.new("UIListLayout")
	uIListLayout4.Padding = UDim.new(0, 40)
	uIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout4.Parent = visualPreview

	local preview = Instance.new("Frame")
	preview.AnchorPoint = Vector2.new(0, 1)
	preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	preview.BackgroundTransparency = 1
	preview.BorderColor3 = Color3.fromRGB(0, 0, 0)
	preview.BorderSizePixel = 0
	preview.LayoutOrder = 1
	preview.Position = UDim2.fromScale(0, 1)
	preview.Size = UDim2.new(1, 0, 1, -70)

	local contentBot = Instance.new("Frame")
	contentBot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	contentBot.BackgroundTransparency = 1
	contentBot.BorderColor3 = Color3.fromRGB(0, 0, 0)
	contentBot.BorderSizePixel = 0
	contentBot.LayoutOrder = 1
	contentBot.Size = UDim2.new(1, 0, 1, -18)

	local healthBar = Instance.new("Frame")
	healthBar.AnchorPoint = Vector2.new(1, 0)
	healthBar.BackgroundColor3 = Color3.fromRGB(58, 161, 47)
	healthBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	healthBar.BorderSizePixel = 0
	healthBar.Position = UDim2.fromOffset(-10, 0)
	healthBar.Size = UDim2.new(0, 12, 1, 0)
	healthBar.Visible = false
	healthBar.Parent = contentBot

	local preview1 = Instance.new("Frame")
	preview1.AnchorPoint = Vector2.new(0.5, 1)
	preview1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	preview1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	preview1.BorderSizePixel = 0
	preview1.LayoutOrder = 1
	preview1.Position = UDim2.fromScale(0.5, 1)
	preview1.Size = UDim2.fromScale(1, 1)

	local cornerbox = Instance.new("Frame")
	cornerbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	cornerbox.BackgroundTransparency = 1
	cornerbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	cornerbox.BorderSizePixel = 0
	cornerbox.Size = UDim2.fromScale(1, 1)
	cornerbox.Visible = false
	cornerbox.ZIndex = 2

	local tLVert = Instance.new("Frame")
	tLVert.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tLVert.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tLVert.BorderSizePixel = 0
	tLVert.Size = UDim2.fromOffset(2, 30)
	tLVert.Parent = cornerbox

	local tLHori = Instance.new("Frame")
	tLHori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tLHori.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tLHori.BorderSizePixel = 0
	tLHori.Size = UDim2.fromOffset(30, 2)
	tLHori.Parent = cornerbox

	local bLHori = Instance.new("Frame")
	bLHori.AnchorPoint = Vector2.new(0, 1)
	bLHori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bLHori.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bLHori.BorderSizePixel = 0
	bLHori.Position = UDim2.fromScale(0, 1)
	bLHori.Size = UDim2.fromOffset(30, 2)
	bLHori.Parent = cornerbox

	local bLVert = Instance.new("Frame")
	bLVert.AnchorPoint = Vector2.new(0, 1)
	bLVert.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bLVert.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bLVert.BorderSizePixel = 0
	bLVert.Position = UDim2.fromScale(0, 1)
	bLVert.Size = UDim2.fromOffset(2, 30)
	bLVert.Parent = cornerbox

	local bRVert = Instance.new("Frame")
	bRVert.AnchorPoint = Vector2.new(1, 1)
	bRVert.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bRVert.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bRVert.BorderSizePixel = 0
	bRVert.Position = UDim2.fromScale(1, 1)
	bRVert.Size = UDim2.fromOffset(2, 30)
	bRVert.Parent = cornerbox

	local bRHori = Instance.new("Frame")
	bRHori.AnchorPoint = Vector2.new(1, 1)
	bRHori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bRHori.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bRHori.BorderSizePixel = 0
	bRHori.Position = UDim2.fromScale(1, 1)
	bRHori.Size = UDim2.fromOffset(30, 2)
	bRHori.Parent = cornerbox

	local bTVert = Instance.new("Frame")
	bTVert.AnchorPoint = Vector2.new(1, 0)
	bTVert.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bTVert.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bTVert.BorderSizePixel = 0
	bTVert.Position = UDim2.fromScale(1, 0)
	bTVert.Size = UDim2.fromOffset(2, 30)
	bTVert.Parent = cornerbox

	local bTHori = Instance.new("Frame")
	bTHori.AnchorPoint = Vector2.new(1, 0)
	bTHori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bTHori.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bTHori.BorderSizePixel = 0
	bTHori.Position = UDim2.fromScale(1, 0)
	bTHori.Size = UDim2.fromOffset(30, 2)
	bTHori.Parent = cornerbox

	cornerbox.Parent = preview1

	local characteroverlay = Instance.new("ImageLabel")
	characteroverlay.AnchorPoint = Vector2.new(0.5, 0.5)
	characteroverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	characteroverlay.BackgroundTransparency = 1
	characteroverlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
	characteroverlay.BorderSizePixel = 0
	characteroverlay.Image = "rbxassetid://109289851861610"
	characteroverlay.Position = UDim2.fromScale(0.5, 0.5)
	characteroverlay.ScaleType = Enum.ScaleType.Fit
	characteroverlay.Size = UDim2.new(1, -20, 1, -20)

	local uIGradient = Instance.new("UIGradient")
	uIGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(101, 143, 175)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(197, 173, 128)),
	})
	uIGradient.Offset = Vector2.new(0, 0.15)
	uIGradient.Rotation = 90
	uIGradient.Parent = characteroverlay

	characteroverlay.Parent = preview1

	local name = Instance.new("TextLabel")
	name.AnchorPoint = Vector2.new(0, 1)
	name.AutomaticSize = Enum.AutomaticSize.XY
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	name.BorderSizePixel = 0
	name.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	name.Position = UDim2.fromOffset(0, -5)
	name.Size = UDim2.fromScale(1, 0)
	name.Text = "RIOTPLAYER987123"
	name.TextColor3 = Color3.fromRGB(255, 255, 255)
	name.TextSize = 13
	name.TextWrapped = true
	name.TextYAlignment = Enum.TextYAlignment.Top
	name.Visible = false

	local uIPadding4 = Instance.new("UIPadding")
	uIPadding4.PaddingLeft = UDim.new(0, 20)
	uIPadding4.Parent = name

	name.Parent = preview1

	local boundingbox = Instance.new("Frame")
	boundingbox.AnchorPoint = Vector2.new(0.5, 0.5)
	boundingbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	boundingbox.BackgroundTransparency = 1
	boundingbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	boundingbox.BorderSizePixel = 0
	boundingbox.Position = UDim2.fromScale(0.5, 0.5)
	boundingbox.Size = UDim2.new(1, -2, 1, -2)
	boundingbox.Visible = false

	local uIStroke = Instance.new("UIStroke")
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(255, 255, 255)
	uIStroke.Parent = boundingbox

	boundingbox.Parent = preview1

	local fillbox = Instance.new("Frame")
	fillbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	fillbox.BackgroundTransparency = 1
	fillbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	fillbox.BorderSizePixel = 0
	fillbox.Size = UDim2.fromScale(1, 1)
	fillbox.Visible = false
	fillbox.Parent = preview1

	preview1.Parent = contentBot

	local info = Instance.new("Frame")
	info.AutomaticSize = Enum.AutomaticSize.XY
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.LayoutOrder = 2
	info.Position = UDim2.new(1, 5, 0, 10)
	info.Size = UDim2.fromOffset(50, 0)
	info.Visible = true

	local distance = Instance.new("TextLabel")
	distance.AnchorPoint = Vector2.new(0, 1)
	distance.AutomaticSize = Enum.AutomaticSize.XY
	distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	distance.BackgroundTransparency = 1
	distance.BorderColor3 = Color3.fromRGB(0, 0, 0)
	distance.BorderSizePixel = 0
	distance.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	distance.Position = UDim2.fromOffset(0, -5)
	distance.RichText = true
	distance.Text = "100M"
	distance.TextColor3 = Color3.fromRGB(255, 255, 255)
	distance.TextSize = 13
	distance.TextWrapped = true
	distance.TextXAlignment = Enum.TextXAlignment.Left
	distance.TextYAlignment = Enum.TextYAlignment.Top
	distance.Parent = info
	distance.Visible = false

	local weapon = Instance.new("TextLabel")
	weapon.AnchorPoint = Vector2.new(0, 1)
	weapon.AutomaticSize = Enum.AutomaticSize.XY
	weapon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	weapon.BackgroundTransparency = 1
	weapon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	weapon.BorderSizePixel = 0
	weapon.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	weapon.LayoutOrder = 1
	weapon.Position = UDim2.fromOffset(0, -5)
	weapon.RichText = true
	weapon.Text = "BF 30"
	weapon.TextColor3 = Color3.fromRGB(255, 255, 255)
	weapon.TextSize = 13
	weapon.TextWrapped = true
	weapon.TextXAlignment = Enum.TextXAlignment.Left
	weapon.TextYAlignment = Enum.TextYAlignment.Top
	weapon.Parent = info
	weapon.Visible = false

	local health = Instance.new("TextLabel")
	health.AnchorPoint = Vector2.new(0, 1)
	health.AutomaticSize = Enum.AutomaticSize.XY
	health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	health.BackgroundTransparency = 1
	health.BorderColor3 = Color3.fromRGB(0, 0, 0)
	health.BorderSizePixel = 0
	health.ClipsDescendants = true
	health.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	health.LayoutOrder = 2
	health.Position = UDim2.fromOffset(0, -5)
	health.RichText = true
	health.Text = "140HP"
	health.TextColor3 = Color3.fromRGB(255, 255, 255)
	health.TextSize = 13
	health.TextWrapped = true
	health.TextXAlignment = Enum.TextXAlignment.Left
	health.TextYAlignment = Enum.TextYAlignment.Top
	health.Parent = info
	health.Visible = false

	local uIListLayout5 = Instance.new("UIListLayout")
	uIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout5.Parent = info

	info.Parent = contentBot

	local uIListLayout6 = Instance.new("UIListLayout")
	uIListLayout6.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout6.HorizontalFlex = Enum.UIFlexAlignment.Fill
	uIListLayout6.Padding = UDim.new(0, 10)
	uIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout6.Parent = contentBot

	contentBot.Parent = preview

	preview.Parent = visualPreview

	visualPreview.Parent = libData.overlay

	utilities.makeDraggable(visualPreview)
	utilities.makeDraggable(menu)

	services._userInputService.InputEnded:Connect(function(inp, gpe)
		if gpe then
			return
		end

		if inp.KeyCode == _window.Settings.Keybind then
			libData.overlay.Visible = not libData.overlay.Visible
		end
	end)

	local function updateContentSize()
		local headerHeight = header.AbsoluteSize.Y + 9
		content.Size = UDim2.new(1, 0, 1, -headerHeight)
		content.Position = UDim2.new(0, 0, 0, headerHeight)
	end

	header:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateContentSize)

	updateContentSize()

	function _window:UpdateSettings(Settings)
		if Settings.Title then
			_window.Settings.Title = Settings.Title
			header1.Text = Settings.Title
		end

		if Settings.Keybind then
			_window.Settings.Keybind = Settings.Keybind
			libData.winKeybind = Settings.Keybind
		end
	end

	--[[ function _window:TabView(Parent, Settings, Flag)
		local _tabView = { Settings = Settings }
	
		local tabView = Instance.new("Frame")
		tabView.Name = "TabView"
		tabView.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabView.BackgroundTransparency = 1
		tabView.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabView.BorderSizePixel = 0
		tabView.ClipsDescendants = true
		tabView.LayoutOrder = -1
		tabView.Position = UDim2.fromOffset(0, -10)
		tabView.Size = UDim2.new(1, 0, 1, 10)
	
		local uIListLayout = Instance.new("UIListLayout")
		uIListLayout.Name = "UIListLayout"
		uIListLayout.Padding = UDim.new(0, 10)
		uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout.Parent = tabView
	
		local leading = Instance.new("ScrollingFrame")
		leading.Name = "Leading"
		leading.Active = true
		leading.AutomaticCanvasSize = Enum.AutomaticSize.X
		leading.AutomaticSize = Enum.AutomaticSize.Y
		leading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		leading.BackgroundTransparency = 1
		leading.BorderColor3 = Color3.fromRGB(0, 0, 0)
		leading.BorderSizePixel = 0
		leading.CanvasSize = UDim2.new()
		leading.LayoutOrder = -1
		leading.ScrollBarImageTransparency = 1
		leading.ScrollBarThickness = 0
		leading.ScrollingDirection = Enum.ScrollingDirection.X
		leading.Size = UDim2.fromScale(1, 0)
	
		local uIListLayout1 = Instance.new("UIListLayout")
		uIListLayout1.Name = "UIListLayout"
		uIListLayout1.FillDirection = Enum.FillDirection.Horizontal
		uIListLayout1.Padding = UDim.new(0, 10)
		uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout1.Parent = leading
	
		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingBottom = UDim.new(0, 1)
		uIPadding.PaddingLeft = UDim.new(0, 1)
		uIPadding.PaddingRight = UDim.new(0, 1)
		uIPadding.PaddingTop = UDim.new(0, 1)
		uIPadding.Parent = leading
	
		leading.Parent = tabView
	
		local trailing = Instance.new("ScrollingFrame")
		trailing.Name = "Trailing"
		trailing.AutomaticCanvasSize = Enum.AutomaticSize.Y
		trailing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		trailing.BackgroundTransparency = 1
		trailing.BorderColor3 = Color3.fromRGB(0, 0, 0)
		trailing.BorderSizePixel = 0
		trailing.CanvasSize = UDim2.new()
		trailing.ScrollBarImageTransparency = 1
		trailing.ScrollBarThickness = 1
		trailing.Size = UDim2.new(1, 0, 1, -15)
	
		local uIListLayout2 = Instance.new("UIListLayout")
		uIListLayout2.Name = "UIListLayout"
		uIListLayout2.Padding = UDim.new(0, 10)
		uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout2.Parent = trailing
	
		local uIPadding1 = Instance.new("UIPadding")
		uIPadding1.Name = "UIPadding"
		uIPadding1.PaddingRight = UDim.new(0, 1)
		uIPadding1.Parent = trailing
	
		trailing.Parent = tabView
	
		local uIPadding2 = Instance.new("UIPadding")
		uIPadding2.Name = "UIPadding"
		uIPadding2.PaddingBottom = UDim.new(0, 20)
		uIPadding2.PaddingLeft = UDim.new(0, 25)
		uIPadding2.PaddingRight = UDim.new(0, 25)
		uIPadding2.Parent = tabView
	
		function _tabView:UpdateSettings(Settings)
			if Settings.Visible ~= nil then
				_tabView.Settings.Visible = Settings.Visible
				tabView.Visible = Settings.Visible
			end
		end
	
		function _tabView:SubTab(Settings, Flag)
			local tab = Instance.new("TextButton")
			tab.AutoButtonColor = false
			tab.AutomaticSize = Enum.AutomaticSize.XY
			tab.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
			tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
			tab.BorderSizePixel = 0
			tab.FontFace = Font.new(
				"rbxassetid://12187365364",
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			)
			tab.Text = Settings.Name or "Tab"
			tab.TextColor3 = Color3.fromRGB(150, 150, 150)
			tab.TextSize = 12
			tab.TextWrapped = true
			tab.Parent = leading
	
			local uICorner = Instance.new("UICorner")
			uICorner.CornerRadius = UDim.new(1, 0)
			uICorner.Parent = tab
	
			local uIStroke = Instance.new("UIStroke")
			uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uIStroke.Color = Color3.fromRGB(168, 193, 225)
			uIStroke.Transparency = 1
			uIStroke.Parent = tab
	
			local uIPadding = Instance.new("UIPadding")
			uIPadding.PaddingBottom = UDim.new(0, 5)
			uIPadding.PaddingLeft = UDim.new(0, 10)
			uIPadding.PaddingRight = UDim.new(0, 10)
			uIPadding.PaddingTop = UDim.new(0, 5)
			uIPadding.Parent = tab
	
			tab.MouseButton1Click:Connect(function()
				
			end)
		end
	
		_tabView:UpdateSettings(_tabView.Settings)
	
		if Flag then
			library.Components[Flag] = _tabView
		end
	
		return _tabView
	end ]]

	function _window:Tab(Settings)
		local _tab = { Settings = Settings }

		assert(_tab.Settings.Name and type(_tab.Settings.Name) == "string", "Missing string or wrong type")
		if not _tab.Settings.Image or _tab.Settings.Image == "" then
			_tab.Settings.Image = library.Assets.DefaultImage
		end

		libData.tabSystem.tabIndex += 1

		local tab = Instance.new("Frame")
		tab.AutomaticSize = Enum.AutomaticSize.Y
		tab.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
		tab.BackgroundTransparency = 1
		tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tab.BorderSizePixel = 0
		tab.Size = UDim2.fromOffset(50, 50)
		tab.Parent = tabs
		tab.LayoutOrder = libData.tabSystem.tabIndex

		local tabName = Instance.new("TextLabel")
		tabName.AutomaticSize = Enum.AutomaticSize.Y
		tabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabName.BackgroundTransparency = 1
		tabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabName.BorderSizePixel = 0
		tabName.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		tabName.LayoutOrder = 1
		tabName.Position = UDim2.new(0, 0, 1, 10)
		tabName.RichText = true
		tabName.Size = UDim2.fromScale(1, 0)
		tabName.Text = _tab.Settings.Name:upper()
		tabName.TextColor3 = Color3.fromRGB(150, 150, 150)
		tabName.TextSize = 11
		tabName.TextWrapped = true
		tabName.Parent = tab

		local tabButton = Instance.new("TextButton")
		tabButton.AutoButtonColor = false
		tabButton.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
		tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabButton.BorderSizePixel = 0
		tabButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		tabButton.Size = UDim2.fromOffset(50, 50)
		tabButton.Text = ""
		tabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		tabButton.TextSize = 14

		local uICorner = Instance.new("UICorner")
		uICorner.CornerRadius = UDim.new(0, 13)
		uICorner.Parent = tabButton

		local uIStroke = Instance.new("UIStroke")
		uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uIStroke.Color = Color3.fromRGB(185, 228, 255)
		uIStroke.Transparency = 1
		uIStroke.Parent = tabButton

		local tabIcon = Instance.new("ImageLabel")
		tabIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		tabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabIcon.BackgroundTransparency = 1
		tabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabIcon.BorderSizePixel = 0
		tabIcon.Image = _tab.Settings.Image
		tabIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
		tabIcon.Position = UDim2.fromScale(0.5, 0.5)
		tabIcon.ScaleType = Enum.ScaleType.Crop
		tabIcon.Size = UDim2.fromOffset(28, 28)
		tabIcon.Parent = tabButton

		tabButton.Parent = tab

		local uIListLayout = Instance.new("UIListLayout")
		uIListLayout.Padding = UDim.new(0, 10)
		uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout.Parent = tab

		local tabContent = Instance.new("ScrollingFrame")
		tabContent.Name = "TabContent"
		tabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
		tabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabContent.BackgroundTransparency = 1
		tabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabContent.BorderSizePixel = 0
		tabContent.CanvasSize = UDim2.new()
		tabContent.ScrollBarImageTransparency = 1
		tabContent.ScrollBarThickness = 1
		tabContent.Size = UDim2.fromScale(1, 1)

		local uIListLayout2 = Instance.new("UIListLayout")
		uIListLayout2.Name = "UIListLayout"
		uIListLayout2.Padding = UDim.new(0, 10)
		uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout2.Parent = tabContent

		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingBottom = UDim.new(0, 20)
		uIPadding.PaddingLeft = UDim.new(0, 25)
		uIPadding.PaddingRight = UDim.new(0, 25)
		uIPadding.Parent = tabContent

		libData.tabSystem.tabInstances[tab] = {
			Name = tabName,
			Stroke = uIStroke,
			Icon = tabIcon,
			TabContent = tabContent,
		}

		function _tab:Select()
			if libData.tabSystem.tabInstances[libData.tabSystem.currentTab] then
				local oldTab = libData.tabSystem.tabInstances[libData.tabSystem.currentTab]

				utilities
					.tween(
						oldTab.Name,
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ TextColor3 = Color3.fromRGB(150, 150, 150) }
					)
					:Play()
				utilities
					.tween(
						oldTab.Icon,
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ ImageColor3 = Color3.fromRGB(150, 150, 150) }
					)
					:Play()
				utilities.tween(oldTab.Stroke, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Transparency = 1 }):Play()

				if libData.tabSystem.currentContent then
					libData.tabSystem.currentContent.Parent = nil
				end
			end

			if libData.tabSystem.tabInstances[tab] then
				local newTab = libData.tabSystem.tabInstances[tab]

				utilities
					.tween(
						newTab.Name,
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ TextColor3 = Color3.fromRGB(168, 193, 225) }
					)
					:Play()
				utilities
					.tween(
						newTab.Icon,
						TweenInfo.new(0.1, Enum.EasingStyle.Sine),
						{ ImageColor3 = Color3.fromRGB(133, 192, 228) }
					)
					:Play()
				utilities.tween(newTab.Stroke, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Transparency = 0 }):Play()

				libData.tabSystem.currentTab = tab

				tabContent.Parent = content1
				libData.tabSystem.currentContent = tabContent
			end
		end

		tabButton.MouseButton1Click:Connect(function()
			_tab:Select()
		end)

		function _tab:Section(Settings, Flag)
			local _section = { Settings = Settings }

			local section = Instance.new("Frame")
			section.Name = "Section"
			section.AutomaticSize = Enum.AutomaticSize.Y
			section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			section.BackgroundTransparency = 1
			section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			section.BorderSizePixel = 0
			section.Size = UDim2.fromScale(1, 0)

			local leading = Instance.new("TextButton")
			leading.Name = "Leading"
			leading.AutoButtonColor = false
			leading.AutomaticSize = Enum.AutomaticSize.Y
			leading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			leading.BackgroundTransparency = 1
			leading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			leading.BorderSizePixel = 0
			leading.LayoutOrder = -1
			leading.Selectable = false
			leading.Size = UDim2.fromScale(1, 0)
			leading.Text = ""

			local name = Instance.new("TextLabel")
			name.Name = "Name"
			name.AutomaticSize = Enum.AutomaticSize.XY
			name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			name.BackgroundTransparency = 1
			name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			name.BorderSizePixel = 0
			name.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			name.LayoutOrder = 1
			name.Position = UDim2.fromOffset(28, 0)
			name.RichText = true
			name.TextColor3 = Color3.fromRGB(225, 225, 225)
			name.TextSize = 20
			name.TextWrapped = true
			name.TextXAlignment = Enum.TextXAlignment.Left
			name.Parent = leading

			local chevron = Instance.new("ImageButton")
			chevron.Name = "Chevron"
			chevron.AnchorPoint = Vector2.new(0, 0.5)
			chevron.AutoButtonColor = false
			chevron.BackgroundColor3 = Color3.fromRGB(30, 34, 47)
			chevron.BackgroundTransparency = 1
			chevron.BorderColor3 = Color3.fromRGB(0, 0, 0)
			chevron.BorderSizePixel = 0
			chevron.Image = "rbxassetid://77136690433593"
			chevron.LayoutOrder = 1
			chevron.Position = UDim2.fromScale(0, 0.5)
			chevron.Selectable = false
			chevron.Active = false
			chevron.Interactable = false
			chevron.Size = UDim2.fromOffset(18, 18)
			chevron.Parent = leading

			leading.Parent = section

			local trailing = Instance.new("Frame")
			trailing.Name = "Trailing"
			trailing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			trailing.BackgroundTransparency = 1
			trailing.BorderColor3 = Color3.fromRGB(0, 0, 0)
			trailing.BorderSizePixel = 0
			trailing.ClipsDescendants = true
			trailing.Size = UDim2.fromScale(1, 0)

			local uIListLayout = Instance.new("UIListLayout")
			uIListLayout.Name = "UIListLayout"
			uIListLayout.Padding = UDim.new(0, 10)
			uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uIListLayout.Parent = trailing

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingLeft = UDim.new(0, 12)
			uIPadding.Parent = trailing

			local folder = Instance.new("Folder")
			folder.Name = "Folder"

			local frame = Instance.new("Frame")
			frame.Name = "Frame"
			frame.AnchorPoint = Vector2.new(0, 1)
			frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame.BorderSizePixel = 0
			frame.Position = UDim2.new(0, -12, 1, 0)
			frame.Size = UDim2.new(0, 1, 1, 0)
			frame.Parent = folder

			folder.Parent = trailing

			trailing.Parent = section

			local uIListLayout1 = Instance.new("UIListLayout")
			uIListLayout1.Name = "UIListLayout"
			uIListLayout1.Padding = UDim.new(0, 10)
			uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
			uIListLayout1.Parent = section

			local uIPadding1 = Instance.new("UIPadding")
			uIPadding1.Name = "UIPadding"
			uIPadding1.PaddingBottom = UDim.new(0, 8)
			uIPadding1.PaddingTop = UDim.new(0, 8)
			uIPadding1.Parent = section

			section.Parent = tabContent

			local Components = {}

			local function updateDisclosure(state)
				if state then
					local Components = {}
					local NewSizeY = 0

					for _, v in pairs(trailing:GetChildren()) do
						if v:IsA("GuiObject") and v.Visible then
							table.insert(Components, v)
							NewSizeY += v.AbsoluteSize.Y
						end
					end

					if #Components > 1 then
						NewSizeY += (#Components - 1) * uIListLayout.Padding.Offset
					end

					utilities
						.tween(trailing, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Size = UDim2.new(1, 0, 0, NewSizeY) })
						:Play()

					utilities.tween(chevron, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Rotation = -180 }):Play()
				else
					utilities
						.tween(trailing, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Size = UDim2.new(1, 0, 0, 0) })
						:Play()

					utilities.tween(chevron, TweenInfo.new(0.15, Enum.EasingStyle.Sine), { Rotation = 0 }):Play()
				end
			end

			leading.MouseButton1Click:Connect(function()
				_section.Settings.Opened = not _section.Settings.Opened
				updateDisclosure(_section.Settings.Opened)
			end)

			local function trackChild(child)
				if not child:IsA("GuiObject") then
					return
				end

				child:GetPropertyChangedSignal("Visible"):Connect(function()
					if _section.Settings.Opened then
						updateDisclosure(true)
					end
				end)
			end

			for _, child in pairs(trailing:GetChildren()) do
				trackChild(child)
			end

			trailing.ChildAdded:Connect(function(child)
				trackChild(child)
				if _section.Settings.Opened then
					updateDisclosure(true)
				end
			end)

			trailing.ChildRemoved:Connect(function()
				if _section.Settings.Opened then
					updateDisclosure(true)
				end
			end)

			function _section:UpdateSettings(Settings)
				if Settings.Visible ~= nil then
					_section.Settings.Visible = Settings.Visible
					section.Visible = Settings.Visible
				end

				if Settings.Opened ~= nil then
					_section.Settings.Opened = Settings.Opened
					updateDisclosure(Settings.Opened)
				end

				if Settings.Name then
					_section.Settings.Name = Settings.Name
					name.Text = Settings.Name
				end
			end

			if _section.Settings.Closed == nil then
				_section.Settings.Closed = true
			end
			_section:UpdateSettings(_section.Settings)

			if Flag then
				library.Components[Flag] = _section
			end

			_section.Content = trailing
			injectComponents(_section)
			return _section
		end

		_tab.Content = tabContent
		injectComponents(_tab)
		return _tab
	end

	function _window:VisualPreview(Settings)
		local corners = {
			bLHori,
			bLVert,
			bRHori,
			bRVert,
			bTHori,
			bTVert,
			tLHori,
			tLVert,
		}

		if Settings.Enabled ~= nil then
			local enabledState = Settings.Enabled
			healthBar.Visible = enabledState
			distance.Visible = enabledState
			health.Visible = enabledState
			weapon.Visible = enabledState
			name.Visible = enabledState
			fillbox.Visible = enabledState
			boundingbox.Visible = enabledState
			cornerbox.Visible = enabledState

			for _, corner in ipairs(corners) do
				corner.Visible = enabledState
			end

			if not enabledState then
				return
			end
		end

		if Settings.Visible ~= nil then
			visualPreview.Visible = Settings.Visible
		end

		if Settings.HealthBar then
			if Settings.HealthBar.Visible ~= nil then
				healthBar.Visible = Settings.HealthBar.Visible
			end
			if Settings.HealthBar.Color then
				healthBar.BackgroundColor3 = Settings.HealthBar.Color[1] or healthBar.BackgroundColor3
				if Settings.HealthBar.Color[2] ~= nil then
					healthBar.Transparency = 1 - Settings.HealthBar.Color[2]
				end
			end
		end

		if Settings.Distance then
			if Settings.Distance.Visible ~= nil then
				distance.Visible = Settings.Distance.Visible
			end
			if Settings.Distance.Color then
				distance.TextColor3 = Settings.Distance.Color[1] or distance.TextColor3
				if Settings.Distance.Color[2] ~= nil then
					distance.TextTransparency = 1 - Settings.Distance.Color[2]
				end
			end
		end

		if Settings.Health then
			if Settings.Health.Visible ~= nil then
				health.Visible = Settings.Health.Visible
			end
			if Settings.Health.Color then
				health.TextColor3 = Settings.Health.Color[1] or health.TextColor3
				if Settings.Health.Color[2] ~= nil then
					health.TextTransparency = 1 - Settings.Health.Color[2]
				end
			end
		end

		if Settings.Weapon then
			if Settings.Weapon.Visible ~= nil then
				weapon.Visible = Settings.Weapon.Visible
			end
			if Settings.Weapon.Color then
				weapon.TextColor3 = Settings.Weapon.Color[1] or weapon.TextColor3
				if Settings.Weapon.Color[2] ~= nil then
					weapon.TextTransparency = 1 - Settings.Weapon.Color[2]
				end
			end
		end

		if Settings.Name then
			if Settings.Name.Visible ~= nil then
				name.Visible = Settings.Name.Visible
			end
			if Settings.Name.Color then
				name.TextColor3 = Settings.Name.Color[1] or name.TextColor3
				if Settings.Name.Color[2] ~= nil then
					name.TextTransparency = 1 - Settings.Name.Color[2]
				end
			end
		end

		if Settings.FillBox then
			if Settings.FillBox.Visible ~= nil then
				fillbox.Visible = Settings.FillBox.Visible
			end
			if Settings.FillBox.Color then
				fillbox.BackgroundColor3 = Settings.FillBox.Color[1] or fillbox.BackgroundColor3
				if Settings.FillBox.Color[2] ~= nil then
					fillbox.BackgroundTransparency = 1 - Settings.FillBox.Color[2]
				end
			end
		end

		if Settings.BoundingBox then
			if Settings.BoundingBox.Visible ~= nil then
				boundingbox.Visible = Settings.BoundingBox.Visible
			end
			if Settings.BoundingBox.Color then
				uIStroke.Color = Settings.BoundingBox.Color[1] or uIStroke.Color
				if Settings.BoundingBox.Color[2] ~= nil then
					uIStroke.Transparency = 1 - Settings.BoundingBox.Color[2]
				end
			end
		end

		if Settings.CornerBox then
			if Settings.CornerBox.Visible ~= nil then
				cornerbox.Visible = Settings.CornerBox.Visible
			end
			if Settings.CornerBox.Color then
				for _, corner in ipairs(corners) do
					corner.BackgroundColor3 = Settings.CornerBox.Color[1] or corner.BackgroundColor3
					if Settings.CornerBox.Color[2] ~= nil then
						corner.BackgroundTransparency = 1 - Settings.CornerBox.Color[2]
					end
				end
			end
		end		
	end

	return _window
end

function library:Notification(Settings)
	local _notification = { Settings = Settings }

	assert(
		_notification.Settings.Title and type(_notification.Settings.Title) == "string",
		"Missing notification title or wrong type"
	)

	local notification = Instance.new("ImageButton")
	notification.AnchorPoint = Vector2.new(1, 1)
	notification.AutoButtonColor = false
	notification.AutomaticSize = Enum.AutomaticSize.Y
	notification.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	notification.BorderSizePixel = 0
	notification.Image = "rbxassetid://17365187482"
	notification.ImageTransparency = 0.96
	notification.Position = UDim2.fromScale(1, 1)
	notification.ScaleType = Enum.ScaleType.Tile
	notification.Size = UDim2.fromOffset(280, 0)
	notification.TileSize = UDim2.fromOffset(500, 325)
	notification.Position = UDim2.new(
		1,
		(
			notification.AbsoluteSize.X
				+ (libData.notifSystem.uIpadding and libData.notifSystem.uIpadding.PaddingRight.Offset or 0)
		),
		1,
		0
	)

	local content = Instance.new("Frame")
	content.AutomaticSize = Enum.AutomaticSize.Y
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 1
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Size = UDim2.fromScale(1, 0)

	local uIPadding = Instance.new("UIPadding")
	uIPadding.PaddingBottom = UDim.new(0, 13)
	uIPadding.PaddingLeft = UDim.new(0, 13)
	uIPadding.PaddingRight = UDim.new(0, _notification.Settings.Image and 42 or 13)
	uIPadding.PaddingTop = UDim.new(0, 13)
	uIPadding.Parent = content

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = content

	local titleContent = Instance.new("Frame")
	titleContent.AutomaticSize = Enum.AutomaticSize.Y
	titleContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	titleContent.BackgroundTransparency = 1
	titleContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	titleContent.BorderSizePixel = 0
	titleContent.Size = UDim2.fromScale(1, 0)

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout1.Padding = UDim.new(0, 13)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = titleContent

	local icon = Instance.new("ImageLabel")
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.ImageColor3 = Color3.fromRGB(225, 225, 225)
	icon.ScaleType = Enum.ScaleType.Fit
	icon.Size = UDim2.fromOffset(16, 16)
	icon.Parent = titleContent
	icon.Visible = _notification.Settings.Image and _notification.Settings.Image ~= ""
	icon.Image = _notification.Settings.Image or ""

	local content1 = Instance.new("Frame")
	content1.AutomaticSize = Enum.AutomaticSize.Y
	content1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content1.BackgroundTransparency = 1
	content1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content1.BorderSizePixel = 0
	content1.LayoutOrder = 1
	content1.Size = UDim2.fromScale(1, 0)

	local uIListLayout2 = Instance.new("UIListLayout")
	uIListLayout2.Padding = UDim.new(0, 5)
	uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout2.Parent = content1

	local title = Instance.new("TextLabel")
	title.AutomaticSize = Enum.AutomaticSize.Y
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	title.LayoutOrder = 1
	title.RichText = true
	title.Size = UDim2.fromScale(1, 0)
	title.TextColor3 = Color3.fromRGB(225, 225, 225)
	title.TextSize = 16
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Top
	title.Parent = content1
	title.Text = _notification.Settings.Title

	local description = Instance.new("TextLabel")
	description.AutomaticSize = Enum.AutomaticSize.Y
	description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	description.BackgroundTransparency = 1
	description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	description.BorderSizePixel = 0
	description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	description.LayoutOrder = 1
	description.RichText = true
	description.Size = UDim2.fromScale(1, 0)
	description.TextColor3 = Color3.fromRGB(100, 100, 100)
	description.TextSize = 14
	description.TextWrapped = true
	description.TextXAlignment = Enum.TextXAlignment.Left
	description.TextYAlignment = Enum.TextYAlignment.Top
	description.Parent = content1
	description.Visible = _notification.Settings.Description and true or false
	description.Text = _notification.Settings.Description or ""

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.PaddingTop = UDim.new(0, -1)
	uIPadding1.Parent = content1

	content1.Parent = titleContent

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.PaddingTop = UDim.new(0, 1)
	uIPadding2.Parent = titleContent

	titleContent.Parent = content

	content.Parent = notification

	table.insert(libData.notifSystem.notifInstances, notification)

	notification.Parent = libData.notifSystem.notifications

	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = UDim.new(0, 15)
	uICorner.Parent = notification

	utilities
		.tween(notification, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), { Position = UDim2.new(1, 0, 1, 0) })
		:Play()

	if _notification.Settings.Lifetime and _notification.Settings.Lifetime > 0 then
		task.delay(_notification.Settings.Lifetime, function()
			_notification:Cancel()
		end)
	end

	function _notification:Cancel()
		local index = table.find(libData.notifSystem.notifInstances, notification)
		if not index then
			return
		end

		table.remove(libData.notifSystem.notifInstances, index)

		task.spawn(function()
			utilities
				.tween(notification, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {
					Position = UDim2.new(
						1,
						notification.AbsoluteSize.X
						+ (libData.notifSystem.uIpadding and libData.notifSystem.uIpadding.PaddingRight.Offset or 0),
						1,
						notification.Position.Y.Offset
					),
				})
				:Play()
		end)

		task.delay(0.25, function()
			notification:Destroy()
		end)

		for i = index - 1, 1, -1 do
			task.spawn(function()
				local notif = libData.notifSystem.notifInstances[i]
				utilities
					.tween(notif, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {
						Position = notif.Position + UDim2.new(
							0,
							0,
							0,
							notification.AbsoluteSize.Y
							+ (
								libData.notifSystem.uIpadding
								and libData.notifSystem.uIpadding.PaddingBottom.Offset
								or 0
							)
						),
					})
					:Play()
			end)
		end
	end

	return _notification
end

function library:Unload()
	libData.gui:Destroy()
end

--// Initialize
libData.localPlayer = services._players.LocalPlayer
local function getCC()
	libData.camera = services._workspace.CurrentCamera
end
getCC()
services._workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(getCC)

libData.gui = utilities.secureGui({
	OnTopOfCoreBlur = true,
	ScreenInsets = Enum.ScreenInsets.None,
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 2147483647,
})

libData.overlay = Instance.new("Frame", libData.gui)
libData.overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
libData.overlay.BackgroundTransparency = 1
libData.overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
libData.overlay.BorderSizePixel = 0
libData.overlay.Size = UDim2.fromScale(1, 1)
libData.overlay.Parent = libData.gui

libData.notifSystem.notifications = Instance.new("Frame", libData.gui)
libData.notifSystem.notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
libData.notifSystem.notifications.BackgroundTransparency = 1
libData.notifSystem.notifications.BorderColor3 = Color3.fromRGB(0, 0, 0)
libData.notifSystem.notifications.BorderSizePixel = 0
libData.notifSystem.notifications.Size = UDim2.fromScale(1, 1)
libData.notifSystem.notifications.ZIndex = 2

libData.notifSystem.uIpadding = Instance.new("UIPadding", libData.notifSystem.notifications)
libData.notifSystem.uIpadding.PaddingBottom = UDim.new(0, 15)
libData.notifSystem.uIpadding.PaddingLeft = UDim.new(0, 15)
libData.notifSystem.uIpadding.PaddingRight = UDim.new(0, 15)
libData.notifSystem.uIpadding.PaddingTop = UDim.new(0, 15)

local notifListener = function(instance)
	local newNotif = table.find(libData.notifSystem.notifInstances, instance)
	if newNotif then
		for i, v in pairs(libData.notifSystem.notifInstances) do
			if i ~= newNotif then
				utilities
					.tween(v, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {
						Position = v.Position
						- UDim2.new(0, 0, 0, libData.notifSystem.notifInstances[newNotif].AbsoluteSize.Y + 10),
					})
					:Play()
			end
		end
	end
end

libData.notifSystem.notifications.ChildAdded:Connect(notifListener)

return library
