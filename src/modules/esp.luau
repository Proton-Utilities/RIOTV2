--!nolint LocalShadow
--!nolint UnknownGlobal
--!nocheck

local Functions = require("core/functions.luau")
local GetService = Functions.SecureService

--// Services
local RunService = GetService("RunService")
local Players = GetService("Players")
local Workspace = GetService("Workspace")
local UserInputService = GetService("UserInputService")
local CoreGui = gethui and gethui() or GetService("CoreGui")

--// Variables
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local ViewportSize = Camera.ViewportSize

--// Locals
local Floor = math.floor
local Round = math.round
local Sin = math.sin
local Cos = math.cos
local Clear = table.clear
local Unpack = table.unpack
local Find = table.find
local Create = table.create
local FromMatrix = CFrame.fromMatrix

--// Methods
local WorldToViewportPoint = Camera.WorldToViewportPoint
local IsA = Workspace.IsA
local GetPivot = Workspace.GetPivot
local FindFirstChild = Workspace.FindFirstChild
local FindFirstChildOfClass = Workspace.FindFirstChildOfClass
local GetChildren = Workspace.GetChildren
local PointToObjectSpace = CFrame.identity.PointToObjectSpace
local LerpColor = Color3.new().Lerp
local Min2 = Vector2.zero.Min
local Max2 = Vector2.zero.Max
local Lerp2 = Vector2.zero.Lerp
local Min3 = Vector3.zero.Min
local Max3 = Vector3.zero.Max

--// Constants
local HEALTH_BAR_OUTLINE_OFFSET = Vector2.new(0, 1)
local TEXT_TOP_OFFSET = Vector2.new(0, 2)
local TEXT_RIGHT_OFFSET = Vector2.new(5, 0)
local VERTICES = {
	Vector3.new(-1, -1, -1),
	Vector3.new(-1, 1, -1),
	Vector3.new(-1, 1, 1),
	Vector3.new(-1, -1, 1),
	Vector3.new(1, -1, -1),
	Vector3.new(1, 1, -1),
	Vector3.new(1, 1, 1),
	Vector3.new(1, -1, 1),
}

--// Functions
local function GetBoundingBox(Parts)
	local Min, Max
	for i = 1, #Parts do
		local Part = Parts[i]
		local CFrame, Size = Part.CFrame, Part.Size

		Min = Min3(Min or CFrame.Position, (CFrame - Size * 0.5).Position)
		Max = Max3(Max or CFrame.Position, (CFrame + Size * 0.5).Position)
	end

	local Center = (Min + Max) * 0.5
	local Front = Vector3.new(Center.X, Center.Y, Max.Z)
	return CFrame.new(Center, Front), Max - Min
end

local function WorldToScreen(World)
	local Screen, InBounds = WorldToViewportPoint(Camera, World)
	return Vector2.new(Screen.X, Screen.Y), InBounds, Screen.Z
end

local function CalculateCorners(CFrame, Size)
	local Corners = Create(#VERTICES)
	for i = 1, #VERTICES do
		Corners[i] = WorldToScreen((CFrame + Size * 0.5 * VERTICES[i]).Position)
	end

	local Min = Min2(ViewportSize, Unpack(Corners))
	local Max = Max2(Vector2.zero, Unpack(Corners))
	return {
		Corners = Corners,
		TopLeft = Vector2.new(Floor(Min.X), Floor(Min.Y)),
		TopRight = Vector2.new(Floor(Max.X), Floor(Min.Y)),
		BottomLeft = Vector2.new(Floor(Min.X), Floor(Max.Y)),
		BottomRight = Vector2.new(Floor(Max.X), Floor(Max.Y)),
	}
end

local function RotateVector(Vector, Radians)
	local X, Y = Vector.X, Vector.Y
	local C, S = Cos(Radians), Sin(Radians)
	return Vector2.new(X * C - Y * S, X * S + Y * C)
end

local function ParseColor(self, Color, IsOutline)
	if Color == "Team Color" or (self.Interface.Shared.UseTeamColor and not IsOutline) then
		return self.Interface.GetTeamColor(self.Player) or Color3.new(1, 1, 1)
	end
	return Color
end

--// Esp Object
local EspObject = {}
EspObject.__index = EspObject

function EspObject.New(Player, Interface)
	local self = setmetatable({}, EspObject)
	self.Player = assert(Player, "Missing argument #1 (Player expected)")
	self.Interface = assert(Interface, "Missing argument #2 (table expected)")
	self:Construct()
	return self
end

function EspObject:_Create(Class, Properties)
	local Drawing = Drawing.new(Class)
	for Property, Value in next, Properties do
		pcall(function()
			Drawing[Property] = Value
		end)
	end
	self.Bin[#self.Bin + 1] = Drawing
	return Drawing
end

function EspObject:Construct()
	self.CharCache = {}
	self.ChildCount = 0
	self.Bin = {}
	self.Drawings = {
		Box3d = {
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
			{
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
				self:_Create("Line", { Thickness = 1, Visible = false }),
			},
		},
		Visible = {
			TracerOutline = self:_Create("Line", { Thickness = 2, Visible = false }),
			Tracer = self:_Create("Line", { Thickness = 1, Visible = false }),
			BoxFill = self:_Create("Square", { Filled = true, Visible = false }),
			BoxOutline = self:_Create("Square", { Thickness = 2, Visible = false }),
			Box = self:_Create("Square", { Thickness = 1, Visible = false }),
			CornerBox = {},
			HealthBarOutline = self:_Create("Line", { Thickness = 6, Visible = false }),
			HealthBar = self:_Create("Line", { Thickness = 4, Visible = false }),
			HealthText = self:_Create("Text", { Center = true, Visible = false }),
			Name = self:_Create(
				"Text",
				{ Text = string.upper(self.Player.DisplayName), Center = true, Visible = false }
			),
			Distance = self:_Create("Text", { Center = true, Visible = false }),
			Weapon = self:_Create("Text", { Center = true, Visible = false }),
			Skeleton = {
				Head = self:_Create("Circle", { NumSides = 30, Thickness = 1, Visible = false }),
			},
		},
		Hidden = {
			ArrowOutline = self:_Create("Triangle", { Thickness = 3, Visible = false }),
			Arrow = self:_Create("Triangle", { Filled = true, Visible = false }),
		},
	}

	for _ = 1, 8 do
		table.insert(self.Drawings.Visible.CornerBox, self:_Create("Line", { Thickness = 2, Visible = false }))
	end

	for i = 1, 14 do
		self.Drawings.Visible.Skeleton[i] = self:_Create("Line", { Thickness = 1, Visible = false })
	end

	self.RenderConnection = RunService.RenderStepped:Connect(function(DeltaTime)
		self:Update(DeltaTime)
		self:Render(DeltaTime)
	end)
end

function EspObject:Destruct()
	self.RenderConnection:Disconnect()

	for i = 1, #self.Bin do
		self.Bin[i]:Remove()
	end

	Clear(self)
end

function EspObject:Update()
	local Interface = self.Interface

	self.Options = Interface.Team[Interface.IsFriendly(self.Player) and "Friendly" or "Enemy"]
	self.Character = Interface.GetCharacter(self.Player)
	self.Health, self.MaxHealth = Interface.GetHealth(self.Player)
	self.Weapon = Interface.GetWeapon(self.Player)
	self.Enabled = self.Options.Enabled
		and self.Character
		and not (#Interface.Whitelist > 0 and not Find(Interface.Whitelist, self.Player.UserId))

	local RootPart = self.Enabled and FindFirstChild(self.Character, Interface.GetRootPart())
	if not RootPart then
		self.CharCache = {}
		self.OnScreen = false
		return
	end

	local _, OnScreen, Depth = WorldToScreen(RootPart.Position)
	self.OnScreen = OnScreen
	self.Distance = Depth

	if Interface.Shared.LimitDistance and Depth > Interface.Shared.MaxDistance then
		self.OnScreen = false
	end

	if self.OnScreen then
		local Cache = self.CharCache
		local Children = GetChildren(self.Character)
		if not Cache[1] or self.ChildCount ~= #Children then
			Clear(Cache)

			for i = 1, #Children do
				local Part = Children[i]
				if IsA(Part, "BasePart") and Interface.IsBodyPart(Part.Name) then
					Cache[#Cache + 1] = Part
				end
			end

			self.ChildCount = #Children
		end

		self.Corners = CalculateCorners(GetBoundingBox(Cache))
	elseif self.Options.OffScreenArrow then
		local CFrame = Camera.CFrame
		local Flat = FromMatrix(CFrame.Position, CFrame.RightVector, Vector3.yAxis)
		local ObjectSpace = PointToObjectSpace(Flat, RootPart.Position)
		self.Direction = Vector2.new(ObjectSpace.X, ObjectSpace.Z).Unit
	end
end

function EspObject:Render()
	local Interface = self.Interface
	local OnScreen = self.OnScreen or false
	local Enabled = self.Enabled and Interface.GetHealth() > 0 or false
	local Visible = self.Drawings.Visible
	local Hidden = self.Drawings.Hidden
	local Box3d = self.Drawings.Box3d
	local Interface = self.Interface
	local Options = self.Options
	local Corners = self.Corners

	Visible.Box.Visible = Enabled and OnScreen and Options.Box
	Visible.BoxOutline.Visible = Visible.Box.Visible and Options.BoxOutline
	if Visible.Box.Visible then
		local Box = Visible.Box
		Box.Position = Corners.TopLeft
		Box.Size = Corners.BottomRight - Corners.TopLeft
		Box.Color = ParseColor(self, Options.BoxColor[1])
		Box.Transparency = Options.BoxColor[2]

		local BoxOutline = Visible.BoxOutline
		BoxOutline.Position = Box.Position
		BoxOutline.Size = Box.Size
		BoxOutline.Color = ParseColor(self, Options.BoxOutlineColor[1], true)
		BoxOutline.Transparency = Options.BoxOutlineColor[2]
	end

	local CornerBoxEnabled = Enabled and OnScreen and Options.CornerBox

	for i = 1, 8 do
		local CornerLine = Visible.CornerBox[i]

		CornerLine.Visible = CornerBoxEnabled
	end

	if CornerBoxEnabled then
		local CornerWidth = (Corners.TopRight.X - Corners.TopLeft.X) * 0.2
		local CornerHeight = (Corners.BottomLeft.Y - Corners.TopLeft.Y) * 0.2

		CornerWidth = math.clamp(CornerWidth, 2, 30)
		CornerHeight = math.clamp(CornerHeight, 2, 30)

		local function DrawCorner(Index, Origin, HorizOffset, VertOffset)
			local Line1 = Visible.CornerBox[Index]
			local Line2 = Visible.CornerBox[Index + 1]

			local Thickness = Line1.Thickness or 1
			local Overlap = (Thickness - 1)
			local Offset = Overlap / 2

			local ExtendedHoriz = HorizOffset.Unit * (HorizOffset.Magnitude + Overlap)
			Line1.From = Origin - HorizOffset.Unit * Offset
			Line1.To = Origin + ExtendedHoriz - HorizOffset.Unit * Offset
			Line1.Color = ParseColor(self, Options.CornerBoxColor[1])
			Line1.Transparency = Options.CornerBoxColor[2]

			local ExtendedVert = VertOffset.Unit * (VertOffset.Magnitude + Overlap)
			Line2.From = Origin - VertOffset.Unit * Offset
			Line2.To = Origin + ExtendedVert - VertOffset.Unit * Offset
			Line2.Color = ParseColor(self, Options.CornerBoxColor[1])
			Line2.Transparency = Options.CornerBoxColor[2]
		end

		DrawCorner(1, Corners.TopLeft, Vector2.new(CornerWidth, 0), Vector2.new(0, CornerHeight))
		DrawCorner(3, Corners.TopRight, Vector2.new(-CornerWidth, 0), Vector2.new(0, CornerHeight))
		DrawCorner(5, Corners.BottomRight, Vector2.new(-CornerWidth, 0), Vector2.new(0, -CornerHeight))
		DrawCorner(7, Corners.BottomLeft, Vector2.new(CornerWidth, 0), Vector2.new(0, -CornerHeight))
	end

	Visible.BoxFill.Visible = Enabled and OnScreen and Options.BoxFill
	if Visible.BoxFill.Visible then
		local BoxFill = Visible.BoxFill
		BoxFill.Position = Corners.TopLeft
		BoxFill.Size = Corners.BottomRight - Corners.TopLeft
		BoxFill.Color = ParseColor(self, Options.BoxFillColor[1])
		BoxFill.Transparency = Options.BoxFillColor[2]
	end

	Visible.HealthBar.Visible = Enabled and OnScreen and Options.HealthBar
	Visible.HealthBarOutline.Visible = Visible.HealthBar.Visible and Options.HealthBarOutline
	if Visible.HealthBar.Visible then
		local ScaledThickness = math.clamp((Corners.TopRight.X - Corners.TopLeft.X) * 0.03, 1, 10)
		local Offset = Vector2.new((ScaledThickness + 3), 0)
		local BarFrom = Corners.TopLeft - Offset
		local BarTo = Corners.BottomLeft - Offset

		local HealthBar = Visible.HealthBar
		HealthBar.To = BarTo
		HealthBar.From = Lerp2(BarTo, BarFrom, self.Health / self.MaxHealth)
		HealthBar.Color = LerpColor(Options.DyingColor, Options.HealthyColor, self.Health / self.MaxHealth)
		HealthBar.Thickness = ScaledThickness

		local HealthBarOutline = Visible.HealthBarOutline
		HealthBarOutline.To = BarTo + HEALTH_BAR_OUTLINE_OFFSET
		HealthBarOutline.From = BarFrom - HEALTH_BAR_OUTLINE_OFFSET
		HealthBarOutline.Color = ParseColor(self, Options.HealthBarOutlineColor[1], true)
		HealthBarOutline.Transparency = Options.HealthBarOutlineColor[2]
		HealthBarOutline.Thickness = HealthBar.Thickness + 2
	end

	Visible.Name.Visible = Enabled and OnScreen and Options.Name
	if Visible.Name.Visible then
		local Name = Visible.Name
		Name.Size = Interface.Shared.TextSize
		Name.Font = Interface.Shared.TextFont
		Name.Color = ParseColor(self, Options.NameColor[1])
		Name.Transparency = Options.NameColor[2]
		Name.Outline = Options.NameOutline
		Name.OutlineColor = ParseColor(self, Options.NameOutlineColor, true)
		Name.Position = (Corners.TopLeft + Corners.TopRight) * 0.5 - Vector2.yAxis * Name.TextBounds.Y - TEXT_TOP_OFFSET
	end

	local ListYOffset = Corners and Corners.TopRight.Y or 0

	Visible.Distance.Visible = Enabled and OnScreen and self.Distance and Options.Distance
	if Visible.Distance.Visible then
		local Distance = Visible.Distance
		Distance.Text = Round(self.Distance * 0.28) .. "M"
		Distance.Size = Interface.Shared.TextSize
		Distance.Font = Interface.Shared.TextFont
		Distance.Color = ParseColor(self, Options.DistanceColor[1])
		Distance.Transparency = Options.DistanceColor[2]
		Distance.Outline = Options.DistanceOutline
		Distance.OutlineColor = ParseColor(self, Options.DistanceOutlineColor, true)

		Distance.Position = Vector2.new(
			Corners.TopRight.X + TEXT_RIGHT_OFFSET.X + Distance.TextBounds.X * 0.5,
			ListYOffset - Distance.TextBounds.Y * 0.5 - TEXT_RIGHT_OFFSET.Y
		)

		ListYOffset = ListYOffset + Distance.TextBounds.Y + TEXT_RIGHT_OFFSET.Y
	end

	Visible.Weapon.Visible = Enabled and OnScreen and Options.Weapon
	if Visible.Weapon.Visible then
		local Weapon = Visible.Weapon
		Weapon.Text = self.Weapon
		Weapon.Size = Interface.Shared.TextSize
		Weapon.Font = Interface.Shared.TextFont
		Weapon.Color = ParseColor(self, Options.WeaponColor[1])
		Weapon.Transparency = Options.WeaponColor[2]
		Weapon.Outline = Options.WeaponOutline
		Weapon.OutlineColor = ParseColor(self, Options.WeaponOutlineColor, true)

		Weapon.Position = Vector2.new(
			Corners.TopRight.X + TEXT_RIGHT_OFFSET.X + Weapon.TextBounds.X * 0.5,
			ListYOffset - Weapon.TextBounds.Y * 0.5
		)

		ListYOffset = ListYOffset + Weapon.TextBounds.Y + TEXT_RIGHT_OFFSET.Y
	end

	Visible.HealthText.Visible = Enabled and OnScreen and Options.HealthText
	if Visible.HealthText.Visible then
		local HealthText = Visible.HealthText
		HealthText.Text = (self.Health >= (2 ^ 31 - 1) and "INF " or Round(self.Health)) .. "HP"
		HealthText.Size = Interface.Shared.TextSize
		HealthText.Font = Interface.Shared.TextFont
		HealthText.Color = ParseColor(self, Options.HealthTextColor[1])
		HealthText.Transparency = Options.HealthTextColor[2]
		HealthText.Outline = Options.HealthTextOutline
		HealthText.OutlineColor = ParseColor(self, Options.HealthTextOutlineColor, true)

		HealthText.Position = Vector2.new(
			Corners.TopRight.X + TEXT_RIGHT_OFFSET.X + HealthText.TextBounds.X * 0.5,
			ListYOffset - HealthText.TextBounds.Y * 0.5
		)
	end

	Visible.Tracer.Visible = Enabled and OnScreen and Options.Tracer
	Visible.TracerOutline.Visible = Visible.Tracer.Visible and Options.TracerOutline
	if Visible.Tracer.Visible then
		local Tracer = Visible.Tracer
		Tracer.Color = ParseColor(self, Options.TracerColor[1])
		Tracer.Transparency = Options.TracerColor[2]
		Tracer.To = (Corners.BottomLeft + Corners.BottomRight) * 0.5
		Tracer.From = Options.TracerOrigin == "Middle" and ViewportSize * 0.5
			or Options.TracerOrigin == "Top" and ViewportSize * Vector2.new(0.5, 0)
			or Options.TracerOrigin == "Bottom" and ViewportSize * Vector2.new(0.5, 1)
			or Options.TracerOrigin == "Mouse" and UserInputService:GetMouseLocation()

		local TracerOutline = Visible.TracerOutline
		TracerOutline.Color = ParseColor(self, Options.TracerOutlineColor[1], true)
		TracerOutline.Transparency = Options.TracerOutlineColor[2]
		TracerOutline.To = Tracer.To
		TracerOutline.From = Tracer.From
	end

	Hidden.Arrow.Visible = Enabled and not OnScreen and Options.OffScreenArrow
	Hidden.ArrowOutline.Visible = Hidden.Arrow.Visible and Options.OffScreenArrowOutline
	if Hidden.Arrow.Visible and self.Direction then
		local Arrow = Hidden.Arrow
		Arrow.PointA = Min2(
			Max2(ViewportSize * 0.5 + self.Direction * Options.OffScreenArrowRadius, Vector2.one * 25),
			ViewportSize - Vector2.one * 25
		)
		Arrow.PointB = Arrow.PointA - RotateVector(self.Direction, 0.45) * Options.OffScreenArrowSize
		Arrow.PointC = Arrow.PointA - RotateVector(self.Direction, -0.45) * Options.OffScreenArrowSize
		Arrow.Color = ParseColor(self, Options.OffScreenArrowColor[1])
		Arrow.Transparency = Options.OffScreenArrowColor[2]

		local ArrowOutline = Hidden.ArrowOutline
		ArrowOutline.PointA = Arrow.PointA
		ArrowOutline.PointB = Arrow.PointB
		ArrowOutline.PointC = Arrow.PointC
		ArrowOutline.Color = ParseColor(self, Options.OffScreenArrowOutlineColor[1], true)
		ArrowOutline.Transparency = Options.OffScreenArrowOutlineColor[2]
	end

	local Box3dEnabled = Enabled and OnScreen and Options.Box3d
	for i = 1, #Box3d do
		local Face = Box3d[i]
		for i2 = 1, #Face do
			local Line = Face[i2]
			Line.Visible = Box3dEnabled
			Line.Color = ParseColor(self, Options.Box3dColor[1])
			Line.Transparency = Options.Box3dColor[2]
		end

		if Box3dEnabled then
			local Line1 = Face[1]
			Line1.From = Corners.Corners[i]
			Line1.To = Corners.Corners[i == 4 and 1 or i + 1]

			local Line2 = Face[2]
			Line2.From = Corners.Corners[i == 4 and 1 or i + 1]
			Line2.To = Corners.Corners[i == 4 and 5 or i + 5]

			local Line3 = Face[3]
			Line3.From = Corners.Corners[i == 4 and 5 or i + 5]
			Line3.To = Corners.Corners[i == 4 and 8 or i + 4]
		end
	end

	local SkeletonEnabled = Enabled and OnScreen and Options.Skeleton
	if SkeletonEnabled then
		local Joints, AttachPoints = Interface.GetJoints(self.Character)

		local HeadCircle = Visible.Skeleton.Head
		HeadCircle.Visible = false

		if Joints.Head then
			local HeadPos, HeadVisible = WorldToScreen(Joints.Head.Position)
			if HeadVisible then
				HeadCircle.Visible = true
				HeadCircle.Position = HeadPos
				HeadCircle.Radius = math.clamp((Corners.TopRight.X - Corners.TopLeft.X) * 0.1, 2, 50)
				HeadCircle.Thickness = Options.SkeletonThickness
				HeadCircle.Color = ParseColor(self, Options.SkeletonColor[1])
				HeadCircle.Transparency = Options.SkeletonColor[2]
			end
		end

		for i, Connection in ipairs(AttachPoints) do
			local Line = Visible.Skeleton[i]
			Line.Visible = false

			local Start = Connection[1]
			local End = Connection[2]

			if Start and End then
				local StartPos, StartVisible = WorldToScreen(
					Start == Joints.Head and Start.Position - Vector3.new(0, Start.Size.Y / 2, 0) or Start.Position
				)
				local EndPos, EndVisible = WorldToScreen(End.Position)

				if StartVisible and EndVisible then
					Line.Visible = true
					Line.From = StartPos
					Line.To = EndPos
					Line.Thickness = Options.SkeletonThickness
					Line.Color = ParseColor(self, Options.SkeletonColor[1])
					Line.Transparency = Options.SkeletonColor[2]
				end
			end
		end
	else
		Visible.Skeleton.Head.Visible = false
		for _, Line in ipairs(Visible.Skeleton) do
			if type(Line) == "table" then
				continue
			end
			Line.Visible = false
		end
	end
end

--// Cham Object
local ChamObject = {}
ChamObject.__index = ChamObject

function ChamObject.New(Player, Interface)
	local self = setmetatable({}, ChamObject)
	self.Player = assert(Player, "Missing argument #1 (Player expected)")
	self.Interface = assert(Interface, "Missing argument #2 (table expected)")
	self:Construct()
	return self
end

function ChamObject:Construct()
	self.Highlight = Instance.new("Highlight")
	self.UpdateConnection = RunService.RenderStepped:Connect(function()
		self:Update()
	end)
end

function ChamObject:Destruct()
	self.UpdateConnection:Disconnect()
	self.Highlight:Destroy()

	Clear(self)
end

function ChamObject:Update()
	local Highlight = self.Highlight
	local Interface = self.Interface
	local Character = Interface.GetCharacter(self.Player)
	local Options = Interface.Team[Interface.IsFriendly(self.Player) and "Friendly" or "Enemy"]
	local Enabled = Options.Enabled
		and Character
		and not (#Interface.Whitelist > 0 and not Find(Interface.Whitelist, self.Player.UserId))

	Highlight.Enabled = Enabled and Options.Chams
	if Highlight.Enabled then
		Highlight.Adornee = Character
		Highlight.FillColor = ParseColor(self, Options.ChamsFillColor[1])
		Highlight.FillTransparency = Options.ChamsFillColor[2]
		Highlight.OutlineColor = ParseColor(self, Options.ChamsOutlineColor[1], true)
		Highlight.OutlineTransparency = Options.ChamsOutlineColor[2]
		Highlight.DepthMode = Options.ChamsVisibleOnly and "Occluded" or "AlwaysOnTop"
		Highlight.Parent = CoreGui
	end
end

--// Instance class
local InstanceObject = {}
InstanceObject.__index = InstanceObject

function InstanceObject.New(Instance, Options)
	local self = setmetatable({}, InstanceObject)
	self.Instance = assert(Instance, "Missing argument #1 (Instance Expected)")
	self.Options = assert(Options, "Missing argument #2 (table expected)")
	self:Construct()
	return self
end

function InstanceObject:Construct()
	local Options = self.Options
	Options.Enabled = Options.Enabled == nil and true or Options.Enabled
	Options.Text = Options.Text or "{name}"
	Options.TextColor = Options.TextColor or { Color3.new(1, 1, 1), 1 }
	Options.TextOutline = Options.TextOutline == nil and true or Options.TextOutline
	Options.TextOutlineColor = Options.TextOutlineColor or Color3.new()
	Options.TextSize = Options.TextSize or 13
	Options.TextFont = Options.TextFont or 2
	Options.LimitDistance = Options.LimitDistance or false
	Options.MaxDistance = Options.MaxDistance or 150

	self.Text = Drawing.new("Text")
	self.Text.Center = true

	self.RenderConnection = RunService.Stepped:Connect(function(DeltaTime)
		self:Render(DeltaTime)
	end)
end

function InstanceObject:Destruct()
	self.RenderConnection:Disconnect()
	self.Text:Remove()
end

function InstanceObject:Render()
	local Instance = self.Instance
	if not Instance or not Instance.Parent then
		return self:Destruct()
	end

	local Text = self.Text
	local Options = self.Options
	if not Options.Enabled then
		Text.Visible = false
		return
	end

	local World = GetPivot(Instance).Position
	local Position, Visible, Depth = WorldToScreen(World)
	if Options.LimitDistance and Depth > Options.MaxDistance then
		Visible = false
	end

	Text.Visible = Visible
	if Text.Visible then
		Text.Position = Position
		Text.Color = Options.TextColor[1]
		Text.Transparency = Options.TextColor[2]
		Text.Outline = Options.TextOutline
		Text.OutlineColor = Options.TextOutlineColor
		Text.Size = Options.TextSize
		Text.Font = Options.TextFont
		Text.Text = Options.Text
			:gsub("{name}", string.upper(Instance.Name))
			:gsub("{distance}", Round(Depth * 0.28) .. "M")
			:gsub("{position}", string.upper(tostring(World)))
	end

	return nil
end

--// Interface
local EspInterface = {
	HasLoaded = false,
	ObjectCache = {},
	Whitelist = {},
	Shared = {
		TextSize = 13,
		TextFont = 2,
		LimitDistance = false,
		MaxDistance = 150,
		UseTeamColor = false,
		IncludeLocalPlayer = false,
	},
	Team = {
		Enemy = {
			Enabled = false,
			Box = false,
			BoxColor = { Color3.new(1, 0, 0), 1 },
			BoxOutline = true,
			BoxOutlineColor = { Color3.new(), 1 },
			BoxFill = false,
			BoxFillColor = { Color3.new(1, 0, 0), 0.5 },
			CornerBox = false,
			CornerBoxColor = { Color3.new(1, 1, 1), 1 },
			HealthBar = false,
			HealthyColor = Color3.fromRGB(58, 161, 47),
			DyingColor = Color3.fromRGB(161, 47, 47),
			HealthBarOutline = true,
			HealthBarOutlineColor = { Color3.new(), 0.5 },
			HealthText = false,
			HealthTextColor = { Color3.new(1, 1, 1), 1 },
			HealthTextOutline = true,
			HealthTextOutlineColor = Color3.new(),
			Box3d = false,
			Box3dColor = { Color3.new(1, 0, 0), 1 },
			Name = false,
			NameColor = { Color3.new(1, 1, 1), 1 },
			NameOutline = true,
			NameOutlineColor = Color3.new(),
			Weapon = false,
			WeaponColor = { Color3.new(1, 1, 1), 1 },
			WeaponOutline = true,
			WeaponOutlineColor = Color3.new(),
			Distance = false,
			DistanceColor = { Color3.new(1, 1, 1), 1 },
			DistanceOutline = true,
			DistanceOutlineColor = Color3.new(),
			Tracer = false,
			TracerOrigin = "Bottom",
			TracerColor = { Color3.new(1, 0, 0), 1 },
			TracerOutline = true,
			TracerOutlineColor = { Color3.new(), 1 },
			OffScreenArrow = false,
			OffScreenArrowColor = { Color3.new(1, 1, 1), 1 },
			OffScreenArrowSize = 15,
			OffScreenArrowRadius = 150,
			OffScreenArrowOutline = true,
			OffScreenArrowOutlineColor = { Color3.new(), 1 },
			Chams = false,
			ChamsVisibleOnly = false,
			ChamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			ChamsOutlineColor = { Color3.new(1, 0, 0), 0 },
			Skeleton = false,
			SkeletonThickness = 1,
			SkeletonColor = { Color3.new(1, 0, 0), 1 },
		},
		Friendly = {
			Enabled = false,
			Box = false,
			BoxColor = { Color3.new(0, 1, 0), 1 },
			BoxOutline = true,
			BoxOutlineColor = { Color3.new(), 1 },
			BoxFill = false,
			BoxFillColor = { Color3.new(0, 1, 0), 0.5 },
			CornerBox = false,
			CornerBoxColor = { Color3.new(1, 1, 1), 1 },
			HealthBar = false,
			HealthyColor = Color3.new(0, 1, 0),
			DyingColor = Color3.new(1, 0, 0),
			HealthBarOutline = true,
			HealthBarOutlineColor = { Color3.new(), 0.5 },
			HealthText = false,
			HealthTextColor = { Color3.new(1, 1, 1), 1 },
			HealthTextOutline = true,
			HealthTextOutlineColor = Color3.new(),
			Box3d = false,
			Box3dColor = { Color3.new(0, 1, 0), 1 },
			Name = false,
			NameColor = { Color3.new(1, 1, 1), 1 },
			NameOutline = true,
			NameOutlineColor = Color3.new(),
			Weapon = false,
			WeaponColor = { Color3.new(1, 1, 1), 1 },
			WeaponOutline = true,
			WeaponOutlineColor = Color3.new(),
			Distance = false,
			DistanceColor = { Color3.new(1, 1, 1), 1 },
			DistanceOutline = true,
			DistanceOutlineColor = Color3.new(),
			Tracer = false,
			TracerOrigin = "Bottom",
			TracerColor = { Color3.new(0, 1, 0), 1 },
			TracerOutline = true,
			TracerOutlineColor = { Color3.new(), 1 },
			OffScreenArrow = false,
			OffScreenArrowColor = { Color3.new(1, 1, 1), 1 },
			OffScreenArrowSize = 15,
			OffScreenArrowRadius = 150,
			OffScreenArrowOutline = true,
			OffScreenArrowOutlineColor = { Color3.new(), 1 },
			Chams = false,
			ChamsVisibleOnly = false,
			ChamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
			ChamsOutlineColor = { Color3.new(0, 1, 0), 0 },
			Skeleton = false,
			SkeletonColor = { Color3.new(0, 1, 0), 1 },
		},
	},
}

function EspInterface.AddInstance(Instance, Options)
	local Cache = EspInterface.ObjectCache
	if Cache[Instance] then
		warn("Instance handler already exists.")
	else
		Cache[Instance] = { InstanceObject.New(Instance, Options) }
	end
	return Cache[Instance][1]
end

function EspInterface.Load()
	assert(not EspInterface.HasLoaded, "Esp has already been loaded.")

	local function CreateObject(Player)
		EspInterface.ObjectCache[Player] = {
			EspObject.New(Player, EspInterface),
			ChamObject.New(Player, EspInterface),
		}
	end

	local function RemoveObject(Player)
		local Object = EspInterface.ObjectCache[Player]
		if Object then
			for i = 1, #Object do
				Object[i]:Destruct()
			end
			EspInterface.ObjectCache[Player] = nil
		end
	end

	local Plrs = Players:GetPlayers()

	for i = EspInterface.Shared.IncludeLocalPlayer and 1 or 2, #Plrs do
		CreateObject(Plrs[i])
	end

	EspInterface.PlayerAdded = Players.PlayerAdded:Connect(CreateObject)
	EspInterface.PlayerRemoving = Players.PlayerRemoving:Connect(RemoveObject)
	EspInterface.HasLoaded = true
end

function EspInterface.Unload()
	assert(EspInterface.HasLoaded, "Esp has not been loaded yet.")

	for Index, Object in next, EspInterface.ObjectCache do
		for i = 1, #Object do
			Object[i]:Destruct()
		end
		EspInterface.ObjectCache[Index] = nil
	end

	EspInterface.PlayerAdded:Disconnect()
	EspInterface.PlayerRemoving:Disconnect()
	EspInterface.HasLoaded = false
end

function EspInterface.GetWeapon(Player)
	local Weapon = "None"

	if Player and Player.Character then
		local Tool = Player.Character:FindFirstChildOfClass("Tool")
		if Tool then
			Weapon = Tool.Name
		end
	end

	return string.upper(Weapon)
end

function EspInterface.IsFriendly(Player)
	return Player.Team and Player.Team == LocalPlayer.Team
end

function EspInterface.GetTeamColor(Player)
	return Player.Team and Player.Team.TeamColor and Player.Team.TeamColor.Color
end

function EspInterface.GetCharacter(Player)
	return Player.Character
end

function EspInterface.IsBodyPart(Name)
	return Name == "Head" or Name:find("Torso") or Name:find("Leg") or Name:find("Arm")
end

function EspInterface.GetRootPart()
	return "HumanoidRootPart"
end

function EspInterface.GetHealth(Player)
	local Character = Player and EspInterface.GetCharacter(Player)
	local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
	if Humanoid then
		return Humanoid.Health, Humanoid.MaxHealth
	end
	return 100, 100
end

function EspInterface.GetJoints(Character)
	local Joints = {
		Head = Character:FindFirstChild("Head"),

		UpperTorso = Character:FindFirstChild("UpperTorso") or Character:FindFirstChild("Torso"),
		LowerTorso = Character:FindFirstChild("LowerTorso") or Character:FindFirstChild("Torso"),

		LeftUpperArm = Character:FindFirstChild("LeftUpperArm") or Character:FindFirstChild("Left Arm"),
		LeftLowerArm = Character:FindFirstChild("LeftLowerArm") or Character:FindFirstChild("Left Arm"),
		LeftHand = Character:FindFirstChild("LeftHand") or Character:FindFirstChild("Left Arm"),

		RightUpperArm = Character:FindFirstChild("RightUpperArm") or Character:FindFirstChild("Right Arm"),
		RightLowerArm = Character:FindFirstChild("RightLowerArm") or Character:FindFirstChild("Right Arm"),
		RightHand = Character:FindFirstChild("RightHand") or Character:FindFirstChild("Right Arm"),

		LeftUpperLeg = Character:FindFirstChild("LeftUpperLeg") or Character:FindFirstChild("Left Leg"),
		LeftLowerLeg = Character:FindFirstChild("LeftLowerLeg") or Character:FindFirstChild("Left Leg"),
		LeftFoot = Character:FindFirstChild("LeftFoot") or Character:FindFirstChild("Left Leg"),

		RightUpperLeg = Character:FindFirstChild("RightUpperLeg") or Character:FindFirstChild("Right Leg"),
		RightLowerLeg = Character:FindFirstChild("RightLowerLeg") or Character:FindFirstChild("Right Leg"),
		RightFoot = Character:FindFirstChild("RightFoot") or Character:FindFirstChild("Right Leg"),
	}
	local AttachPoints = {
		{ Joints.Head, Joints.UpperTorso },
		{ Joints.UpperTorso, Joints.LowerTorso },
		{ Joints.UpperTorso, Joints.LeftUpperArm },
		{ Joints.LeftUpperArm, Joints.LeftLowerArm },
		{ Joints.LeftLowerArm, Joints.LeftHand },
		{ Joints.UpperTorso, Joints.RightUpperArm },
		{ Joints.RightUpperArm, Joints.RightLowerArm },
		{ Joints.RightLowerArm, Joints.RightHand },
		{ Joints.LowerTorso, Joints.LeftUpperLeg },
		{ Joints.LeftUpperLeg, Joints.LeftLowerLeg },
		{ Joints.LeftLowerLeg, Joints.LeftFoot },
		{ Joints.LowerTorso, Joints.RightUpperLeg },
		{ Joints.RightUpperLeg, Joints.RightLowerLeg },
		{ Joints.RightLowerLeg, Joints.RightFoot },
	}
	return Joints, AttachPoints
end

return EspInterface
