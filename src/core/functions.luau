--!nocheck
--!nolint

local Functions = {}

function Functions.Clone<Original>(ToClone: any & Original): (Original, boolean)
    local Type = typeof(ToClone)

    if Type == "function" and (clonefunc or clonefunction) then
        return (clonefunc or clonefunction)(ToClone), true
    end

    if Type == "Instance" and (cloneref or clonereference) then
        return (cloneref or clonereference)(ToClone), true
    end

    if Type ~= "table" then
        return ToClone, false
    end

    local function DeepCopy(Orig, Copies: { [any]: any }?)
        if Copies and Copies[Orig] then
            return Copies[Orig]
        end

        local _Copies = Copies or {}
        local Copy = {}

        _Copies[Orig] = Copy

        for Key, Value in next, Orig do
            Copy[DeepCopy(Key, _Copies)] = DeepCopy(Value, _Copies)
        end

        local Meta = (getrawmetatable or getmetatable)(Orig)
        if Meta then
            (setrawmetatable or setmetatable)(Copy, DeepCopy(Meta, _Copies))
        end

        return Copy
    end

    return DeepCopy(ToClone), true
end

Functions.ProtectGui = function(Gui: ScreenGui)
	local _Game = cloneref and cloneref(game) or game
	local Success, Result = pcall(function()
		Gui.Parent = gethui and gethui()
			or cloneref and cloneref(_Game:GetService("CoreGui"))
			or _Game:GetService("CoreGui")
	end)
	return Success and Gui or error("Failed to protect GUI: " .. tostring(Result))
end
Functions.ProtectGui = newcclosure and newcclosure(Functions.ProtectGui) or Functions.ProtectGui

Functions.SecureService = function(Service: string): Instance
	local _Game = cloneref and cloneref(game) or game
	local Success, Result = pcall(function()
		return cloneref and cloneref(_Game:GetService(Service)) or _Game:GetService(Service)
	end)
	return Success and Result or error("Unable to retrieve service: " .. Service)
end
Functions.SecureService = newcclosure and newcclosure(Functions.SecureService) or Functions.SecureService

function Functions.GetPlayer(): Player?
	local Success, Result = pcall(function()
		return Functions.SecureService("Players") :: Players
	end)
	return Success and (Result :: Players).LocalPlayer or nil
end

function Functions.GetCharacter(player: Player?): Model?
	local Success, Result = pcall(function()
		return player and player.Character or nil
	end)
	return Success and Result or nil
end

function Functions.GetHumanoid(player: Player?): Humanoid?
	local Success, Result = pcall(function()
		local character = Functions.GetCharacter(player)
		return character and character:FindFirstChildOfClass("Humanoid") or nil
	end)
	return Success and Result or nil
end

return Functions
