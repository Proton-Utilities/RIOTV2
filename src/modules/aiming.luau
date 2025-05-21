--!nolint LocalShadow
--!nolint UnknownGlobal
--!nocheck

local Functions = require("core/functions.luau")
local GetService = Functions.SecureService
local game, workspace = game, workspace

local Vector2new, Vector3zero, CFramenew, Color3RGB, Drawingnew, TweenInfonew =
	Vector2.new, Vector3.zero, CFrame.new, Color3.fromRGB, Drawing.new, TweenInfo.new
local mousemoverel, mathclamp =
	mousemoverel or (Input and Input.MouseMove), math.clamp

local GameMetatable = getrawmetatable and getrawmetatable(game)
	or {

		__index = function(self, Index)
			return self[Index]
		end,

		__newindex = function(self, Index, Value)
			self[Index] = Value
		end,
	}

local __index = GameMetatable.__index
local __newindex = GameMetatable.__newindex

local RunService = GetService("RunService")
local UserInputService = GetService("UserInputService")
local TweenService = GetService("TweenService")
local Players = GetService("Players")

local LocalPlayer = __index(Players, "LocalPlayer")
local Camera = __index(workspace, "CurrentCamera")

local FindFirstChild, FindFirstChildOfClass = __index(game, "FindFirstChild"), __index(game, "FindFirstChildOfClass")
local WorldToViewportPoint = __index(Camera, "WorldToViewportPoint")
local GetPartsObscuringTarget = __index(Camera, "GetPartsObscuringTarget")
local GetMouseLocation = __index(UserInputService, "GetMouseLocation")
local GetPlayers = __index(Players, "GetPlayers")

local RequiredDistance, Running, ServiceConnections, Animation, OriginalSensitivity = 2000, false, {}, nil, nil
local Connect, Disconnect = __index(game, "DescendantAdded").Connect, nil

local Aiming = {
	Triggerbot = {
		Enabled = false,

		TeamCheck = true,
		AliveCheck = true,
		WeaponCheck = true,

		Delay = 0,

		TargetChanged = function(Target: Player)
			return
		end,
		Trigger = function(State)
			if State then
				mouse1press()
				task.wait()
				mouse1release()
			end
		end,
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
		LockedColor = Color3RGB(150, 255, 150),
	},

	IgnoredParts = {},
	BlacklistTable = {},

	FOVCircleOutline = Drawingnew("Circle"),
	FOVCircle = Drawingnew("Circle"),
}

--// Game Specific Functions
function Aiming.IsFriendly(Player)
	return Player and Player.Team and Player.Team == LocalPlayer.Team
end

function Aiming.IsBone(Name)
	return Name == "Head" or Name:find("Torso") or Name:find("Leg") or Name:find("Arm")
end

function Aiming.GetPlayerFromCharacter(Model)
	return Players:GetPlayerFromCharacter(Model)
end

function Aiming.GetCharacter(Player)
	return Player and Player.Character;
end

function Aiming.GetHealth(Player)
	local Character = Player and Aiming.GetCharacter(Player);
	local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid");
	if Humanoid then
		return Humanoid.Health
	end
	return 100
end

--// Utility
local ConvertVector = function(Vector)
	return Vector2new(Vector.X, Vector.Y)
end

local CancelLock = function()
	Aiming.Locked = nil

	local FOVCircle = Aiming.FOVCircle

	FOVCircle.Color = Aiming.FOVSettings.Color
	__newindex(UserInputService, "MouseDeltaSensitivity", OriginalSensitivity)

	if Animation then
		Animation:Cancel()
	end
end

function Aiming.AddToIgnoreQuery(Part)
	if not table.find(Aiming.IgnoredParts, Part) then
		table.insert(Aiming.IgnoredParts, Part)
	end
end

function Aiming.Aimbot.SetState(State: boolean)
	Running = State
	if not State then
		CancelLock()
	end
end

local GetClosestPlayer = function()
	local Settings = Aiming.Aimbot
	local LockPart = Settings.LockPart

	if not Aiming.Locked then
		RequiredDistance = Aiming.FOVSettings.Enabled and Aiming.FOVSettings.Radius or 2000
		for _, Value in next, GetPlayers(Players) do
			local Character = Aiming.GetCharacter(Value)
			local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
			if
				Value ~= LocalPlayer
				and Character
				and Aiming.GetCharacter(LocalPlayer)
				and FindFirstChild(Character, LockPart)
				and Humanoid
			then
				local PartPosition = __index(Character[LockPart], "Position")

				if
					Settings.MaxDistance
					and (Camera.CFrame.Position - PartPosition).Magnitude > Settings.MaxDistance
				then
					continue
				end

				if Settings.TeamCheck and Aiming.IsFriendly(Value) then
					continue
				end
				if Settings.AliveCheck and Aiming.GetHealth(Value) < 0 then
					continue
				end

				if Settings.WallCheck == 2 or Settings.WallCheck == 3 then
					table.clear(Aiming.BlacklistTable)
				
					table.insert(Aiming.BlacklistTable, Aiming.GetCharacter(LocalPlayer))
					table.insert(Aiming.BlacklistTable, Aiming.GetCharacter(Value))
					
					for i = 1, #Aiming.IgnoredParts do
						Aiming.BlacklistTable[i + 2] = Aiming.IgnoredParts[i]
					end

					if #GetPartsObscuringTarget(Camera, { PartPosition }, Aiming.BlacklistTable) > 0 then
						continue
					end
				end

				local Vector, OnScreen, Distance = WorldToViewportPoint(Camera, PartPosition)
				Vector = ConvertVector(Vector)
				Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude
				if Distance < RequiredDistance and OnScreen then
					RequiredDistance, Aiming.Locked = Distance, Value
				end
			end
		end
	else
		local LockedCharacter = Aiming.GetCharacter(Aiming.Locked)

		if LockedCharacter and Aiming.GetCharacter(LocalPlayer) then
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
				table.clear(Aiming.BlacklistTable)
				
				table.insert(Aiming.BlacklistTable, Aiming.GetCharacter(LocalPlayer))
				table.insert(Aiming.BlacklistTable, Aiming.GetCharacter(Aiming.Locked))
				
				for i = 1, #Aiming.IgnoredParts do
					Aiming.BlacklistTable[i + 2] = Aiming.IgnoredParts[i]
				end

				if #GetPartsObscuringTarget(Camera, { PartPosition }, Aiming.BlacklistTable) > 0 then
					CancelLock()
					return
				end
			end

			if Distance > RequiredDistance or not OnScreen then
				CancelLock()
			end
		else
			CancelLock()
		end
	end
end

local TriggerbotShoot = function()
	local Settings = Aiming.Triggerbot
	if not Settings.Enabled or not Aiming.GetCharacter(LocalPlayer) then
		Settings.TargetChanged()
		return
	end

	local Mouse = __index(LocalPlayer, "GetMouse") and LocalPlayer:GetMouse()
	if not Mouse then
		Settings.TargetChanged()
		return
	end

	local Camera = workspace.CurrentCamera
	local Ray = Ray.new(Camera.CFrame.Position, (Mouse.Hit.Position - Camera.CFrame.Position).Unit * 1000)

	local IgnoreList = { Aiming.GetCharacter(LocalPlayer), Camera }
	for _, part in next, Aiming.IgnoredParts do
		IgnoreList[#IgnoreList + 1] = part
	end

	local RaycastParams = RaycastParams.new()
	RaycastParams.FilterDescendantsInstances = IgnoreList
	RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

	local RaycastResult = workspace:Raycast(Ray.Origin, Ray.Direction, RaycastParams)
	if not RaycastResult then
		Settings.TargetChanged()
		return
	end

	local Target = RaycastResult.Instance
	local Model = Target:FindFirstAncestorOfClass("Model")
	if not Model then
		Settings.TargetChanged()
		return
	end

	local Player = Aiming.GetPlayerFromCharacter(Model)
	if not Player or Player == LocalPlayer then
		Settings.TargetChanged()
		return
	end

	if Settings.TeamCheck and Aiming.IsFriendly(Player) then
		Settings.TargetChanged()
		return
	end

	if Settings.AliveCheck and Aiming.GetHealth(Player) < 0 then
		Settings.TargetChanged()
	end

	Settings.TargetChanged(Player)

	task.wait(Settings.Delay)

	Settings.Trigger(true)
end

local Load = function()
	OriginalSensitivity = __index(UserInputService, "MouseDeltaSensitivity")

	local AimbotSettings, TriggerbotSettings, FOVCircle, FOVCircleOutline, FOVSettings, Offset =
		Aiming.Aimbot,
		Aiming.Triggerbot,
		Aiming.FOVCircle,
		Aiming.FOVCircleOutline,
		Aiming.FOVSettings,
		nil

	ServiceConnections.RenderSteppedConnection = Connect(
		__index(RunService, "RenderStepped"),
		function()
			local OffsetToMoveDirection, LockPart = AimbotSettings.OffsetToMoveDirection, AimbotSettings.LockPart

			if FOVSettings.Enabled and AimbotSettings.Enabled then
				FOVCircle.Color = (Aiming.Locked and FOVSettings.LockedColor) or FOVSettings.Color
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

				Offset = OffsetToMoveDirection
						and __index(
							FindFirstChildOfClass(Aiming.GetCharacter(Aiming.Locked), "Humanoid"),
							"MoveDirection"
						) * (mathclamp(AimbotSettings.OffsetIncrement, 1, 30) / 10)
					or Vector3zero

				if Aiming.Locked then
					local LockedPosition_Vector3 =
						__index(Aiming.GetCharacter(Aiming.Locked)[LockPart], "Position")
					local LockedPosition = WorldToViewportPoint(Camera, LockedPosition_Vector3 + Offset)

					local moveX = (LockedPosition.X - GetMouseLocation(UserInputService).X)
						/ AimbotSettings.Sensitivity2
					local moveY = (LockedPosition.Y - GetMouseLocation(UserInputService).Y)
						/ AimbotSettings.Sensitivity2

					if Aiming.Aimbot.LockMode == 2 then
						mousemoverel(moveX, moveY)
					else
						if AimbotSettings.Sensitivity > 0 then
							Animation = TweenService:Create(
								Camera,
								TweenInfonew(
									Aiming.Aimbot.Sensitivity,
									Enum.EasingStyle.Sine,
									Enum.EasingDirection.Out
								),
								{ CFrame = CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset) }
							)
							Animation:Play()
						else
							__newindex(
								Camera,
								"CFrame",
								CFramenew(Camera.CFrame.Position, LockedPosition_Vector3 + Offset)
							)
						end
					end
				end
			end
		end
	)
end

function Aiming.Exit(self)
	assert(self, 'Aimbot.Exit: Missing parameter #1 "self" <table>.')

	for Index, _ in next, ServiceConnections do
		Disconnect(ServiceConnections[Index])
	end

	Load = nil
	ConvertVector = nil
	CancelLock = nil
	GetClosestPlayer = nil

	self.FOVCircle:Remove()
	self.FOVCircleOutline:Remove()
end

function Aiming.Restart()
	for Index, _ in next, ServiceConnections do
		Disconnect(ServiceConnections[Index])
	end

	Load()
end

Aiming.Load = Load

setmetatable(Aiming, { __call = Load })

return Aiming