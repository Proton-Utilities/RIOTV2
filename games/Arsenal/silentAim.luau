--!nocheck

local game, workspace = game, workspace

local Vector2new, Color3RGB, Drawingnew = Vector2.new, Color3.fromRGB, Drawing.new
local tablefind = table.find

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
local GetService = __index(game, "GetService")

local RunService = GetService(game, "RunService")
local UserInputService = GetService(game, "UserInputService")
local Players = GetService(game, "Players")

local LocalPlayer = __index(Players, "LocalPlayer")
local Camera = __index(workspace, "CurrentCamera")

local FindFirstChild, FindFirstChildOfClass = __index(game, "FindFirstChild"), __index(game, "FindFirstChildOfClass")
local GetDescendants = __index(game, "GetDescendants")
local WorldToViewportPoint = __index(Camera, "WorldToViewportPoint")
local GetPartsObscuringTarget = __index(Camera, "GetPartsObscuringTarget")
local GetMouseLocation = __index(UserInputService, "GetMouseLocation")
local GetPlayers = __index(Players, "GetPlayers")

local Running = false

local Environment = {
	DeveloperSettings = {
		UpdateMode = "RenderStepped",
		TeamCheckOption = "Team",
	},

	SilentAim = {
		Locked = nil,
		Enabled = true,
		LockPart = "Head",
		RandomLockPart = false,
		HitChance = 100,

		MaxDistance = 250,
		WallCheck = true,
		TeamCheck = true,
		AliveCheck = true,

		FOVSettings = {
			Enabled = true,
			Visible = true,

			Radius = 90,
			NumSides = 60,

			Thickness = 2,
			Filled = false,

			Color = { Color3RGB(255, 150, 150), 0 },
			OutlineColor = { Color3RGB(0, 0, 0), 0 },
		},

		SnaplineSettings = {
			Enabled = true,

			Thickness = 2,

			Color = { Color3RGB(255, 0, 0), 0 },
			OutlineColor = { Color3RGB(0, 0, 0), 0 },
		},
	},

	Blacklisted = {},

	FOVCircleOutline = Drawingnew("Circle"),
	FOVCircle = Drawingnew("Circle"),

	SnaplineOutline = Drawingnew("Line"),
	Snapline = Drawingnew("Line"),
}

function Environment.SilentAim.SetState(State: boolean)
	Running = State
end

local ConvertVector = function(Vector)
	return Vector2new(Vector.X, Vector.Y)
end

local function GetClosestPlayer()
	local Settings = Environment.SilentAim
	local LockPart = Settings.RandomLockPart and ({ "Head", "HumanoidRootPart" })[math.random(1, 2)]
		or Settings.LockPart

	if not Settings.Locked then
		local RequiredDistance = Settings.FOVSettings.Enabled and Settings.FOVSettings.Radius or 2000
		for _, Value in next, GetPlayers(Players) do
			local Character = __index(Value, "Character")
			local Humanoid = Character and FindFirstChildOfClass(Character, "Humanoid")
			if
				Value ~= LocalPlayer
				and not tablefind(Environment.Blacklisted, __index(Value, "Name"))
				and Character
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

				if
					Settings.TeamCheck
					and __index(Value, Environment.DeveloperSettings.TeamCheckOption)
					and __index(Value, Environment.DeveloperSettings.TeamCheckOption)
						== __index(LocalPlayer, Environment.DeveloperSettings.TeamCheckOption)
				then
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
					if #GetPartsObscuringTarget(Camera, { PartPosition }, BlacklistTable) > 0 then
						continue
					end
				end

				local Vector, OnScreen = WorldToViewportPoint(Camera, PartPosition)
				Vector = ConvertVector(Vector)
				local Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude
				if Distance < RequiredDistance and OnScreen then
					RequiredDistance, Environment.Locked = Distance, Value
					return Character[LockPart]
				end
			end
		end
	else
		local LockedCharacter = __index(Environment.Locked, "Character")
		local RequiredDistance = Settings.FOVSettings.Enabled and Settings.FOVSettings.Radius or 2000

		if LockedCharacter then
			local LockPartInCharacter = FindFirstChild(LockedCharacter, LockPart)
			if not LockPartInCharacter then
				Settings.Locked = nil
				return nil
			end

			local PartPosition = __index(LockPartInCharacter, "Position")

			if Settings.MaxDistance and (Camera.CFrame.Position - PartPosition).Magnitude > Settings.MaxDistance then
				Settings.Locked = nil
				return nil
			end

			if Settings.WallCheck then
				local BlacklistTable = GetDescendants(__index(LocalPlayer, "Character"))
				for _, Value in next, GetDescendants(LockedCharacter) do
					BlacklistTable[#BlacklistTable + 1] = Value
				end

				if #GetPartsObscuringTarget(Camera, { PartPosition }, BlacklistTable) > 0 then
					Settings.Locked = nil
					return nil
				end
			end

			local Vector, OnScreen = WorldToViewportPoint(Camera, PartPosition)
			Vector = ConvertVector(Vector)
			local Distance = (GetMouseLocation(UserInputService) - Vector).Magnitude

			if Distance > RequiredDistance or not OnScreen then
				Settings.Locked = nil
				return nil
			end

			return LockPartInCharacter
		else
			Settings.Locked = nil
			return nil
		end
	end
	return nil
end

local function DrawFOVCircle()
	if Environment.SilentAim.Enabled and Environment.SilentAim.FOVSettings.Enabled then
		Environment.FOVCircle.Color = Environment.SilentAim.FOVSettings.Color[1]
		Environment.FOVCircleOutline.Color = Environment.SilentAim.FOVSettings.OutlineColor[1]

		Environment.FOVCircle.Transparency = Environment.SilentAim.FOVSettings.Color[2]
		Environment.FOVCircleOutline.Transparency = Environment.SilentAim.FOVSettings.OutlineColor[2]

		Environment.FOVCircle.Thickness = Environment.SilentAim.FOVSettings.Thickness
		Environment.FOVCircleOutline.Thickness = Environment.SilentAim.FOVSettings.Thickness + 2

		Environment.FOVCircle.Position = GetMouseLocation(UserInputService)
		Environment.FOVCircleOutline.Position = GetMouseLocation(UserInputService)

		Environment.FOVCircle.NumSides = Environment.SilentAim.FOVSettings.NumSides
		Environment.FOVCircleOutline.NumSides = Environment.SilentAim.FOVSettings.NumSides

		Environment.FOVCircle.Radius = Environment.SilentAim.FOVSettings.Radius
		Environment.FOVCircleOutline.Radius = Environment.SilentAim.FOVSettings.Radius

		Environment.FOVCircle.Visible = Environment.SilentAim.FOVSettings.Visible
		Environment.FOVCircleOutline.Visible = Environment.SilentAim.FOVSettings.Visible
	else
		Environment.FOVCircle.Visible = false
		Environment.FOVCircleOutline.Visible = false
	end
end

local function DrawSnapline(TargetPosition)
	if
		Running
		and Environment.SilentAim.Enabled
		and Environment.SilentAim.SnaplineSettings.Enabled
		and TargetPosition
	then
		local MousePosition = GetMouseLocation(UserInputService)

		Environment.SnaplineOutline.From = MousePosition
		Environment.SnaplineOutline.To = TargetPosition
		Environment.SnaplineOutline.Color = Environment.SilentAim.SnaplineSettings.OutlineColor[1]
		Environment.SnaplineOutline.Transparency = Environment.SilentAim.SnaplineSettings.OutlineColor[2]
		Environment.SnaplineOutline.Thickness = Environment.SilentAim.SnaplineSettings.Thickness + 2
		Environment.SnaplineOutline.Visible = true

		Environment.Snapline.From = MousePosition
		Environment.Snapline.To = TargetPosition
		Environment.Snapline.Color = Environment.SilentAim.SnaplineSettings.Color[1]
		Environment.Snapline.Transparency = Environment.SilentAim.SnaplineSettings.Color[2]
		Environment.Snapline.Thickness = Environment.SilentAim.SnaplineSettings.Thickness
		Environment.Snapline.Visible = true
	else
		Environment.Snapline.Visible = false
		Environment.SnaplineOutline.Visible = false
	end
end

local HitCache = nil

RunService.RenderStepped:Connect(function()
	DrawFOVCircle()

	HitCache = nil

	if Running and Environment.SilentAim.Enabled then
		HitCache = GetClosestPlayer()
		local SnapVector

		if HitCache and Environment.SilentAim.SnaplineSettings.Enabled then
			local Vector, OnScreen = WorldToViewportPoint(Camera, HitCache.Position)
			if OnScreen then
				SnapVector = Vector2new(Vector.X, Vector.Y)
			end
		end

		DrawSnapline(SnapVector)
	end
end)

local Old
Old = hookmetamethod(
	game,
	"__index",
	newcclosure(function(self, Method)
		if
			Running
			and Environment.SilentAim.Enabled
			and self == Camera
			and Method == "CoordinateFrame"
			and string.match(debug.info(3, "s"), "Client.Functions.Weapons")
			and debug.info(debug.info(3, "f"), "n") ~= "RotCamera"
		then
			if math.random(1, 100) <= Environment.SilentAim.HitChance and HitCache then
				return CFrame.new(Camera.CFrame.Position, HitCache.Position)
			end			
		end

		return Old(self, Method)
	end)
)

return Environment
