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

local RequiredDistance, Running, ServiceConnections, Animation, OriginalSensitivity = 2000, false, {}, nil, nil
local Connect, Disconnect = __index(game, "DescendantAdded").Connect, nil

local Aiming = {
	DeveloperSettings = {
		UpdateMode = "RenderStepped",
		TeamCheckOption = "Team",
	},

	Triggerbot = {
		Enabled = false,

		TeamCheck = true,
		AliveCheck = true,
		WeaponCheck = true,

		Delay = 0,

		TargetChanged = function(Target: Player) return end,
		Trigger = function()
			mouse1press()
			task.wait()
			mouse1release()
		end
	},

	Aimbot = {
		Enabled = false,

		LockMode = 2,
		LockPart = "Head",

		MaxDistance = 250,
	
		TeamCheck = true,
		AliveCheck = true,
		WallCheck = 1, -- 1 = Off, 2 = Sticky, 3 = Always On
	
		Sensitivity = 0,
		Sensitivity2 = 1,

		OffsetToMoveDirection = false,
		OffsetIncrement = 15,
	},

	FOVSettings = {
		Enabled = false,
		Visible = true,

		Radius = 90,
		NumSides = 60,

		Thickness = 2,
		Transparency = 0,
		Filled = false,

		Color = Color3RGB(255, 150, 150),
		OutlineColor = Color3RGB(0, 0, 0),
		LockedColor = Color3RGB(150, 255, 150)
	},

	Blacklisted = {},
	
	FOVCircleOutline = Drawingnew("Circle"),
	FOVCircle = Drawingnew("Circle")
}

local Environment = Aiming

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
end

function Environment.Aimbot.SetState(State: boolean)
	Running = State
	if not State then
		CancelLock()
	end
end

function Environment.PlayerAlive(Player)
	local Character = __index(Player, "Character")
	local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
	return __index(Humanoid, "Health") <= 0
end

local GetClosestPlayer = function()
    local Settings = Environment.Aimbot
    local LockPart = Settings.LockPart
    
    if not Environment.Locked then
        RequiredDistance = Environment.FOVSettings.Enabled and Environment.FOVSettings.Radius or 2000
        for _, Value in next, GetPlayers(Players) do
            local Character = __index(Value, "Character")
            local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
            if Value ~= LocalPlayer and not tablefind(Environment.Blacklisted, __index(Value, "Name")) and Character and FindFirstChild(Character, LockPart) and Humanoid then
                local PartPosition, TeamCheckOption = __index(Character[LockPart], "Position"), Environment.DeveloperSettings.TeamCheckOption

                if Settings.MaxDistance and (Camera.CFrame.Position - PartPosition).Magnitude > Settings.MaxDistance then
                    continue
                end

                if Settings.TeamCheck and __index(Value, TeamCheckOption) and __index(Value, TeamCheckOption) == __index(LocalPlayer, TeamCheckOption) then
                    continue
                end
                if Settings.AliveCheck and Environment.PlayerAlive(Value) then
                    continue
                end
                
                if Settings.WallCheck == 2 or Settings.WallCheck == 3 then
					local BlacklistTable = {
						Camera,
						__index(LocalPlayer, "Character"),
						LockedCharacter
					}
                    if #GetPartsObscuringTarget(Camera, {PartPosition}, BlacklistTable) > 0 then
                        continue
                    end
                end
                
                local Vector, OnScreen, Distance = WorldToViewportPoint(Camera, PartPosition)
                Vector = ConvertVector(Vector)
                Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude
                if Distance < RequiredDistance and OnScreen then
                    RequiredDistance, Environment.Locked = Distance, Value
                end
            end
        end
    else
        local LockedCharacter = __index(Environment.Locked, "Character")
        
        if LockedCharacter then
            local LockPartInCharacter = FindFirstChild(LockedCharacter, LockPart)
            if not LockPartInCharacter then
                CancelLock()
                return
            end
            
            local PartPosition = __index(LockedCharacter[LockPart], "Position")

            if Settings.MaxDistance and (Camera.CFrame.Position - PartPosition).Magnitude > Settings.MaxDistance then
                CancelLock()
                return
            end

            local Vector, OnScreen = WorldToViewportPoint(Camera, PartPosition)
            Vector = ConvertVector(Vector)
            local Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude
            
            if Settings.WallCheck == 3 then
				local BlacklistTable = {
					Camera,
					__index(LocalPlayer, "Character"),
					LockedCharacter
				}
                
                if #GetPartsObscuringTarget(Camera, {PartPosition}, BlacklistTable) > 0 then
                    CancelLock()
                    return
                end
            end
            
            if (Distance > RequiredDistance or not OnScreen) then
                CancelLock()
            end
        else
            CancelLock()
        end
    end
end

local TriggerbotShoot = function()
    local Settings = Environment.Triggerbot
    if not Settings.Enabled then Settings.TargetChanged(); return end
    
    local Mouse = __index(LocalPlayer, "GetMouse") and LocalPlayer:GetMouse()
    if not Mouse then Settings.TargetChanged(); return end
    
    local Camera = workspace.CurrentCamera
    local Ray = Ray.new(Camera.CFrame.Position, (Mouse.Hit.Position - Camera.CFrame.Position).Unit * 1000)
    
    local IgnoreList = {LocalPlayer.Character, Camera}
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = IgnoreList
    RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    
    local RaycastResult = workspace:Raycast(Ray.Origin, Ray.Direction, RaycastParams)
    if not RaycastResult then Settings.TargetChanged(); return end
    
    local Target = RaycastResult.Instance
    local Model = Target:FindFirstAncestorOfClass("Model")
    if not Model then Settings.TargetChanged(); return end
    
    local Bones = {}
	local IsBone = false
	for _,v in pairs(Model:GetChildren()) do
		if v.Name == "Head" or v.Name:find("Torso") or v.Name:find("Leg") or v.Name:find("Arm") then
			table.insert(Bones, v)
		end
	end; IsBone = table.find(Bones, Target) or Target:IsDescendantOf(table.find(Bones, Target)) 
    
    if not IsBone then Settings.TargetChanged(); return end
    
    local Player = Players:GetPlayerFromCharacter(Model)
    if not Player or Player == LocalPlayer then Settings.TargetChanged(); return end
    
    local TeamCheckOption = Environment.DeveloperSettings.TeamCheckOption
    if Settings.TeamCheck and __index(Player, TeamCheckOption) and __index(Player, TeamCheckOption) == __index(LocalPlayer, TeamCheckOption) then
        Settings.TargetChanged();
        return
    end
    
    if Settings.AliveCheck and Environment.PlayerAlive then
        Settings.TargetChanged();
    end

    Settings.TargetChanged(Player)

	task.wait(Settings.Delay)
    
	mouse1press()
	task.wait()
	mouse1release()
end

local Load = function()
	OriginalSensitivity = __index(UserInputService, "MouseDeltaSensitivity")

	local AimbotSettings, TriggerbotSettings, FOVCircle, FOVCircleOutline, FOVSettings, Offset = 
		Environment.Aimbot, Environment.Triggerbot, Environment.FOVCircle, Environment.FOVCircleOutline, Environment.FOVSettings, nil

	ServiceConnections.RenderSteppedConnection = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
		local OffsetToMoveDirection, LockPart = AimbotSettings.OffsetToMoveDirection, AimbotSettings.LockPart

		if FOVSettings.Enabled and AimbotSettings.Enabled then
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

		if TriggerbotSettings.Enabled then
			TriggerbotShoot()
		end

		if Running and AimbotSettings.Enabled then
			GetClosestPlayer()

			Offset = OffsetToMoveDirection and __index(FindFirstChildOfClass(__index(Environment.Locked, "Character"), "Humanoid"), "MoveDirection") * (mathclamp(AimbotSettings.OffsetIncrement, 1, 30) / 10) or Vector3zero

            if Environment.Locked then
                local LockedPosition_Vector3 = __index(__index(Environment.Locked, "Character")[LockPart], "Position")
                local LockedPosition = WorldToViewportPoint(Camera, LockedPosition_Vector3 + Offset)
    
                local moveX = (LockedPosition.X - GetMouseLocation(UserInputService).X) / AimbotSettings.Sensitivity2
                local moveY = (LockedPosition.Y - GetMouseLocation(UserInputService).Y) / AimbotSettings.Sensitivity2
    
                if Environment.Aimbot.LockMode == 2 then
                    mousemoverel(moveX, moveY)
                else
                    if AimbotSettings.Sensitivity > 0 then
                        Animation = TweenService:Create(Camera, TweenInfonew(Environment.Aimbot.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
                            {CFrame = CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset)})
                        Animation:Play()
                    else
                        __newindex(Camera, "CFrame", CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset))
                    end
                end
            end
		end
	end)
end

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

Environment.Load = Load

setmetatable(Environment, {__call = Load})

return Environment