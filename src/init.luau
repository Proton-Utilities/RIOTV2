--!nocheck
--!nolint

if not hookfunction or not getrenv() then
	game.Player.LocalPlayer:Kick("Your executor is not supported.")
	return
end

--// Imports
local Functions = require("core/functions.luau")

--// Methods
local GetService = Functions.SecureService

--// Services
local CoreGui = GetService("CoreGui")

--// Functions
local function JmpFck(...)
	getrenv().game.Players.LocalPlayer:Kick(`:{table.concat({ ... }, ", ")}`)

	coroutine.wrap(function()
		for _, Object in ipairs(getrenv().game:GetDescendants()) do
			pcall(function()
				Object:Destroy()
			end)
		end
	end)()

	getrenv().game:Shutdown()

	task.delay(0.2, function()
		coroutine.wrap(function()
			repeat
				coroutine.wrap(function()
					for i = 1, 0, 0 do
					end
				end)()
			until false
		end)()

		getrenv().game.Sandboxed = true
	end)
end

--// Initialize Anti Reversal
pcall(function()
	local DTC_A_RT = false

	local function Check()
		local Count = 0

		for _, Object in pairs(gethui():GetChildren()) do
			if Object:IsA("ScreenGui") then
				Count += 1
				if Count > 1 then
					return "illegal object 1", Object
				end
			end
		end

		for _, Object in pairs(CoreGui:GetChildren()) do
			if
				Object:IsA("ScreenGui")
				and (Object.Name == "Window" or Object.Name == "Intro" or Object.Name == "ScreenGui")
			then
				return "illegal object 2", Object
			end
		end

		return false
	end

	local DTC_GH_CLD_A_RT = gethui().ChildAdded:Connect(function()
		local Result, Object = Check()
		if Result and not DTC_A_RT then
			DTC_A_RT = true
			JmpFck(Result)
			Object:Destroy()
		end
	end)
	local DTC_CGUI_CLD_A_RT = CoreGui.ChildAdded:Connect(function()
		local Result, Object = Check()
		if Result and not DTC_A_RT then
			DTC_A_RT = true
			JmpFck(Result)
			Object:Destroy()
		end
	end)

	task.spawn(function()
		while true do
			if not (DTC_GH_CLD_A_RT.Connected and DTC_CGUI_CLD_A_RT.Connected) then
				JmpFck("bypass 1")
			end

			local Result, Object = Check()
			if Result and not DTC_A_RT then
				JmpFck("bypass 2", Result)
				Object:Destroy()
			end

			task.wait(0.5)
		end
	end)
end)

-- Hooks
do
	local OriginalLoadstring = loadstring
	hookfunction(loadstring, function(...)
		if checkcaller() then
			JmpFck("illegal chunk 1")
			return
		end
		return OriginalLoadstring(...)
	end)
end

--// Initialize Anti Debugging
if RIOT.BUILD == "Release" and not RIOT.VERSION:find("-") then
	if getgenv().__RIOT_LOADED then
		return
	end
	getgenv().__RIOT_LOADED = true

	getgenv().print, getgenv().warn, getgenv().error = function() end, function() end, function() end
end

--// Initialize Loader
local Files = {
	["Universal"] = {
		Name = "Universal",
		Load = require("games/Universal/init.luau"),
	},

	["Arsenal"] = {
		Name = "Arsenal",
		Load = require("games/Arsenal/init.luau"),
		UniverseId = 111958650,
	},

	["Operations: Siege"] = {
		Name = "Operations: Siege",
		Load = require("games/Operations Siege/init.luau"),
		UniverseId = 4849157113,
	},

	["Frontlines"] = {
		Name = "Frontlines",
		Load = require("games/Frontlines/init.luau"),
		UniverseId = 2132866904,
	},

	["Booga Booga Reborn"] = {
		Name = "Booga Booga [RB]",
		Load = require("games/Booga Booga Reborn/init.luau"),
		UniverseId = 4154513353,
	},

	["Lone Survival"] = {
		Name = "Lone Survival",
		Load = require("games/Lone Survival/init.luau"),
		UniverseId = 4712109542,
	},
}

print("[DEBUG]", `Loading - RIOT {RIOT.VERSION} | {RIOT.BUILD}`)

local function Load(Game)
	print("[DEBUG]", `RIOT - Found: {Game.Name}`)
	Game:Load()
	getgenv().__RIOT_LOADED = true
end

for _, Game in pairs(Files) do
	if Game.Places then
		for _, PlaceId in ipairs(Game.Places) do
			if PlaceId == game.PlaceId then
				Load(Game)
				return
			end
		end
	end
	if Game.UniverseId and Game.UniverseId == game.GameId then
		Load(Game)
		return
	end
end

Load(Files.Universal)
