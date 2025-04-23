--!nocheck
--!nolint

--// Functions
local function JmpFck(pmo)
	game.Players.LocalPlayer:Kick(pmo or "RI_JMPFCK")

	coroutine.wrap(function()
		for _, Object in ipairs(game:GetDescendants()) do
			pcall(function()
				Object:Destroy()
			end)
		end
	end)()

	game:Shutdown()

	task.wait(0.2)

	coroutine.wrap(function()
		repeat
			coroutine.wrap(function()
				for i = 1, 0, 0 do
				end
			end)()
		until false
	end)()

	game.Sandboxed = true
end

--// Initialize
if RIOT.BUILD == "Release" and not RIOT.VERSION:find("-") then
	if getgenv().__RIOT_LOADED then
		return
	end
	getgenv().__RIOT_LOADED = true

	-- Anti-debugging
	debug.traceback = function()
		return ""
	end
	getgenv().print, getgenv().warn, getgenv().error = function() end, function() end, function() end

	-- Anti-reversal
	pcall(function()
		local CGUI = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
		local function Check()
			local Count = 0

			for _, v in pairs(gethui():GetChildren()) do
				if v:IsA("ScreenGui") then
					Count += 1
					if Count > 1 then
						JmpFck(":illegal instance 1")
					end
				end
			end

			for _, v in pairs(CGUI:GetChildren()) do
				if v:IsA("ScreenGui") and (v.Name == "Window" or v.Name == "Intro") then
					JmpFck(":illegal instance 2")
				end
			end
		end

		gethui().ChildAdded:Connect(Check)
		CGUI.ChildAdded:Connect(Check)
		Check()
	end)

	do
		local Original 
		Original = hookfunction(loadstring, function(Source, Chunk)
			if checkcaller() then
				JmpFck(":illegal chunk 1")
			end
		
			return Original(Source, Chunk)
		end)		
	end

	--[[ pcall(function()
		while ({ x = "y" })["x"] == "y" do
			if rawget(_G, "moduleData") or rawget(_G, "DebugLoadModule") then
				JmpFck("(dex) 2")
			end

			for i, v in pairs(getgenv()) do
				if i:lower():find("dex") then
					JmpFck("(dex) 3")
				end
			end

			task.wait(0.5)
		end
	end) ]]

	--[[ local HttpService = game:GetService("HttpService")
	hookfunction(HttpService.JSONDecode, function(self, json)
		local decoded = getfenv(1).HttpService:JSONDecode(json)
		local str = HttpService:JSONEncode(decoded)
		if str:lower():find("hydroxide") then
			JmpFck("(hydroxide) 1")
		end
		return decoded
	end) ]]
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
