--!nolint LocalShadow
--!nolint UnknownGlobal
--!nocheck

local game, workspace = game, workspace
local Vector2new, Vector3zero, CFramenew, Color3RGB, Drawingnew, TweenInfonew = Vector2.new, Vector3.zero, CFrame.new, Color3.fromRGB, Drawing.new, TweenInfo.new
local mousemoverel, tablefind, tableremove, stringlower, stringsub, mathclamp = mousemoverel or (Input and Input.MouseMove), table.find, table.remove, string.lower, string.sub, math.clamp

local GameMetatable = getrawmetatable and getrawmetatable(game) or {

	__index = function(self, Index)
		return self[Index]
	end,

	__newindex = function(self, Index, Value)
		self[Index] = Value
	end
}

local __index = GameMetatable.__index
local __newindex = GameMetatable.__newindex

local GetService = __index(game, "GetService")

local RunService = GetService(game, "RunService")
local UserInputService = GetService(game, "UserInputService")
local TweenService = GetService(game, "TweenService")
local Players = GetService(game, "Players")

local LocalPlayer = __index(Players, "LocalPlayer")
local Camera = __index(workspace, "CurrentCamera")

local FindFirstChild, FindFirstChildOfClass = __index(game, "FindFirstChild"), __index(game, "FindFirstChildOfClass")
local GetDescendants = __index(game, "GetDescendants")
local WorldToViewportPoint = __index(Camera, "WorldToViewportPoint")
local GetPartsObscuringTarget = __index(Camera, "GetPartsObscuringTarget")
local GetMouseLocation = __index(UserInputService, "GetMouseLocation")
local GetPlayers = __index(Players, "GetPlayers")

local RequiredDistance, Typing, Running, ServiceConnections, Animation, OriginalSensitivity = 2000, false, false, {}, nil, nil
local Connect, Disconnect = __index(game, "DescendantAdded").Connect, nil

local Aimbot = {
	DeveloperSettings = {
		UpdateMode = "RenderStepped",
		TeamCheckOption = "Team",
	},

	Settings = {
		Enabled = true,
		AutoStateLabel = function(State: boolean) return end,
		AutoLockedLabel = function(Player: Player) return end,

		TeamCheck = false,
		AliveCheck = true,
		WallCheck = false,

		OffsetToMoveDirection = false,
		OffsetIncrement = 15,

		Sensitivity = 0,
		Sensitivity2 = 3.5,

        ShakeMultiplier = 0.1,

		LockMode = 2,
		LockPart = "Head",

		TriggerKey = Enum.UserInputType.MouseButton2,
		Toggle = false
	},

	FOVSettings = {
		Enabled = true,
		Visible = true,

		Radius = 90,
		NumSides = 60,

		Thickness = 2,
		Transparency = 1,
		Filled = false,

		RainbowColor = false,
		RainbowOutlineColor = false,
		Color = Color3RGB(255, 255, 255),
		OutlineColor = Color3RGB(0, 0, 0),
		LockedColor = Color3RGB(255, 150, 150)
	},

	Blacklisted = {},
	FOVCircleOutline = Drawingnew("Circle"),
	FOVCircle = Drawingnew("Circle")
}

local Environment = Aimbot

Environment.FOVSettings.Visible = false
Environment.FOVSettings.Visible = false

local FixUsername = function(String)
	local Result

	for _, Value in next, GetPlayers(Players) do
		local Name = __index(Value, "Name")

		if stringsub(stringlower(Name), 1, #String) == stringlower(String) then
			Result = Name
		end
	end

	return Result
end

local ConvertVector = function(Vector)
	return Vector2new(Vector.X, Vector.Y)
end

local CancelLock = function()
	Environment.Locked = nil

	local FOVCircle = Environment.FOVCircle

	FOVCircle.Color =  Environment.FOVSettings.Color
	__newindex(UserInputService, "MouseDeltaSensitivity", OriginalSensitivity)

	if Animation then
		Animation:Cancel()
	end
	Environment.Settings.AutoLockedLabel(nil)
end

local GetClosestPlayer = function()
	local Settings = Environment.Settings
	local LockPart = Settings.LockPart

	if not Environment.Locked then
		RequiredDistance = Environment.FOVSettings.Enabled and Environment.FOVSettings.Radius or 2000

		for _, Value in next, GetPlayers(Players) do
			local Character = __index(Value, "Character")
			local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")

			if Value ~= LocalPlayer and not tablefind(Environment.Blacklisted, __index(Value, "Name")) and Character and FindFirstChild(Character, LockPart) and Humanoid then
				local PartPosition, TeamCheckOption = __index(Character[LockPart], "Position"), Environment.DeveloperSettings.TeamCheckOption

				if Settings.TeamCheck and __index(Value, TeamCheckOption) and __index(Value, TeamCheckOption) == __index(LocalPlayer, TeamCheckOption) then
					continue
				end

				if Settings.AliveCheck and __index(Humanoid, "Health") <= 0 then
					continue
				end

				if Settings.WallCheck then
					local BlacklistTable = GetDescendants(__index(LocalPlayer, "Character"))

					for _, Value in next, GetDescendants(Character) do
						BlacklistTable[#BlacklistTable + 1] = Value
					end

					if #GetPartsObscuringTarget(Camera, {PartPosition}, BlacklistTable) > 0 then
						continue
					end
				end

				local Vector, OnScreen, Distance = WorldToViewportPoint(Camera, PartPosition)
				Vector = ConvertVector(Vector)
				Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude

				if Distance < RequiredDistance and OnScreen then
					RequiredDistance, Environment.Locked = Distance, Value
					Settings.AutoLockedLabel(Value)
				end
			end
		end
	elseif (GetMouseLocation(UserInputService) - ConvertVector(WorldToViewportPoint(Camera, __index(__index(__index(Environment.Locked, "Character"), LockPart), "Position")))).Magnitude > RequiredDistance then
		CancelLock()
	end
end

local Load = function()
	OriginalSensitivity = __index(UserInputService, "MouseDeltaSensitivity")

	local Settings, FOVCircle, FOVCircleOutline, FOVSettings, Offset = Environment.Settings, Environment.FOVCircle, Environment.FOVCircleOutline, Environment.FOVSettings, nil

	ServiceConnections.RenderSteppedConnection = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
		local OffsetToMoveDirection, LockPart = Settings.OffsetToMoveDirection, Settings.LockPart
        local ShakeMultiplier = Settings.ShakeMultiplier

		if FOVSettings.Enabled and Settings.Enabled then
			FOVCircle.Color = (Environment.Locked and FOVSettings.LockedColor) or FOVSettings.Color
			FOVCircleOutline.Color = FOVSettings.OutlineColor
		
			FOVCircle.Thickness = FOVSettings.Thickness
			FOVCircleOutline.Thickness = FOVSettings.Thickness + 1

			FOVCircle.Position = GetMouseLocation(UserInputService)
			FOVCircleOutline.Position = GetMouseLocation(UserInputService)
		
			FOVCircle.NumSides = FOVSettings.NumSides
			FOVCircleOutline.NumSides = FOVSettings.NumSides
		
			FOVCircle.Radius = FOVSettings.Radius
			FOVCircleOutline.Radius = FOVSettings.Radius
		
			FOVCircle.Transparency = 1 - FOVSettings.Transparency
			FOVCircleOutline.Transparency = 1 - FOVSettings.Transparency

			FOVCircle.Visible = FOVSettings.Visible
			FOVCircleOutline.Visible = FOVSettings.Visible
		else
			FOVCircle.Visible = false
			FOVCircleOutline.Visible = false
		end		

		if Running and Settings.Enabled then
			GetClosestPlayer()

			Offset = OffsetToMoveDirection and __index(FindFirstChildOfClass(__index(Environment.Locked, "Character"), "Humanoid"), "MoveDirection") * (mathclamp(Settings.OffsetIncrement, 1, 30) / 10) or Vector3zero

            if Environment.Locked then
                local LockedPosition_Vector3 = __index(__index(Environment.Locked, "Character")[LockPart], "Position")
                local LockedPosition = WorldToViewportPoint(Camera, LockedPosition_Vector3 + Offset)
    
                local moveX = (LockedPosition.X - GetMouseLocation(UserInputService).X) / Settings.Sensitivity2
                local moveY = (LockedPosition.Y - GetMouseLocation(UserInputService).Y) / Settings.Sensitivity2
    
                local shakeX = math.random() * ShakeMultiplier - (ShakeMultiplier / 2)
                local shakeY = math.random() * ShakeMultiplier - (ShakeMultiplier / 2)
    
                if Environment.Settings.LockMode == 2 then
                    mousemoverel(moveX + shakeX, moveY + shakeY)
                else
                    if Settings.Sensitivity > 0 then
                        Animation = TweenService:Create(Camera, TweenInfonew(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
                            {CFrame = CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset + Vector3.new(shakeX, shakeY, 0))})
                        Animation:Play()
                    else
                        __newindex(Camera, "CFrame", CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset + Vector3.new(shakeX, shakeY, 0)))
                    end
                end
            end
		end
	end)

	ServiceConnections.InputBeganConnection = Connect(__index(UserInputService, "InputBegan"), function(Inp)
		local TriggerKey, Toggle = Settings.TriggerKey, Settings.Toggle

		if Typing then
			return
		end

		if Inp.UserInputType == Enum.UserInputType.Keyboard and Inp.KeyCode == TriggerKey or Inp.UserInputType == TriggerKey then
			if Toggle then
				Running = not Running

				if not Running then
					CancelLock()
				end
			else
				Running = true
			end
			Settings.AutoStateLabel(Running)
		end
	end)

	ServiceConnections.InputEndedConnection = Connect(__index(UserInputService, "InputEnded"), function(Inp)
		local TriggerKey, Toggle = Settings.TriggerKey, Settings.Toggle

		if Toggle or Typing then
			return
		end

		if Inp.UserInputType == Enum.UserInputType.Keyboard and Inp.KeyCode == TriggerKey or Inp.UserInputType == TriggerKey then
			Running = false
			Settings.AutoStateLabel(Running)
			CancelLock()
		end
	end)
end

ServiceConnections.TypingStartedConnection = Connect(__index(UserInputService, "TextBoxFocused"), function()
	Typing = true
end)

ServiceConnections.TypingEndedConnection = Connect(__index(UserInputService, "TextBoxFocusReleased"), function()
	Typing = false
end)

function Environment.Exit(self)
	assert(self, "Aimbot.Exit: Missing parameter #1 \"self\" <table>.")

	for Index, _ in next, ServiceConnections do
		Disconnect(ServiceConnections[Index])
	end

	Load = nil; ConvertVector = nil; CancelLock = nil; GetClosestPlayer = nil; FixUsername = nil

	self.FOVCircle:Remove()
	self.FOVCircleOutline:Remove()
end

function Environment.Restart()
	for Index, _ in next, ServiceConnections do
		Disconnect(ServiceConnections[Index])
	end

	Load()
end

function Environment.Blacklist(self, Username)
	assert(self, "Aimbot.Blacklist: Missing parameter #1 \"self\" <table>.")
	assert(Username, "Aimbot.Blacklist: Missing parameter #2 \"Username\" <string>.")

	Username = FixUsername(Username)

	assert(self, "Aimbot.Blacklist: User "..Username.." couldn't be found.")

	self.Blacklisted[#self.Blacklisted + 1] = Username
end

function Environment.Whitelist(self, Username)
	assert(self, "Aimbot.Whitelist: Missing parameter #1 \"self\" <table>.")
	assert(Username, "Aimbot.Whitelist: Missing parameter #2 \"Username\" <string>.")

	Username = FixUsername(Username)

	assert(Username, "Aimbot.Whitelist: User "..Username.." couldn't be found.")

	local Index = tablefind(self.Blacklisted, Username)

	assert(Index, "Aimbot.Whitelist: User "..Username.." is not blacklisted.")

	tableremove(self.Blacklisted, Index)
end

function Environment.GetClosestPlayer()
	GetClosestPlayer()
	local Value = Environment.Locked
	CancelLock()

	return Value
end

Environment.Load = Load

setmetatable(Environment, {__call = Load})

return Environment