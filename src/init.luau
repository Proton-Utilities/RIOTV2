--!nocheck
--!nolint

local game = cloneref(game)
local gPID = game.PlaceId

local files = {
    ["Operations: Siege"] = {
        File = require("games/OperationsSiege/src/init.luau"), 
        Places = {
            13997018456, 
            13997264379
        }
    },
    ["KAT"] = {
        File = require("games/KAT/src/init.luau"), 
        Places = {
            621129760
        }
    }
}

for gameName, data in pairs(files) do
    for _, placeId in ipairs(data.Places) do
        if placeId == gPID then
            data.File.init(gameName)
            return
        end
    end
end