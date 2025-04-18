--!nocheck
--!nolint

--// Imports
local Functions = require("core/functions.luau")

--// Methods
local GetService = Functions.SecureService

--// Services
local CoreGui = GetService("CoreGui")
local Workspace = GetService("Workspace")

--// Initialize
if RIOT.BUILD == "Release" then
	debug.traceback = function()
		return ""
	end
	getgenv().print = function(...)
		return
	end
	getgenv().warn = function(...)
		return
	end
	getgenv().error = function(...)
		return
	end
end

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
}

print(`Loading - RIOT {RIOT.VERSION} | {RIOT.BUILD}`)

if getgenv().__RIOT_LOADED then
	return
end

local function Load(Game)
	print(`RIOT - Found - {Game.Name}`)
	getgenv().__RIOT_LOADED = true
	Game:Load()
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
