local Functions = {}

Functions.ProtectGui = function(Gui: ScreenGui)
	local _game = cloneref and cloneref(game) or game
	local success, err = pcall(function()
		Gui.Parent = gethui and gethui()
			or cloneref and cloneref(_game:GetService("CoreGui"))
			or _game:GetService("CoreGui")
	end)
	return success and Gui or error("Failed to protect GUI: " .. tostring(err))
end
Functions.ProtectGui = newcclosure and newcclosure(Functions.ProtectGui) or Functions.ProtectGui

Functions.SecureService = function(service: string): Instance
	local _game = cloneref and cloneref(game) or game
	local success, result = pcall(function()
		return cloneref and cloneref(_game:GetService(service)) or _game:GetService(service)
	end)
	return success and result or error("Unable to retrieve service: " .. service)
end
Functions.SecureService = newcclosure and newcclosure(Functions.SecureService) or Functions.SecureService

function Functions.GetPlayer(): Player?
	local success, result = pcall(function()
		return Functions.SecureService("Players") :: Players
	end)
	return success and (result :: Players).LocalPlayer or nil
end

function Functions.GetCharacter(player: Player?): Model?
	local success, result = pcall(function()
		return player and player.Character or nil
	end)
	return success and result or nil
end

function Functions.GetHumanoid(player: Player?): Humanoid?
	local success, result = pcall(function()
		local character = Functions.GetCharacter(player)
		return character and character:FindFirstChildOfClass("Humanoid") or nil
	end)
	return success and result or nil
end

return Functions
