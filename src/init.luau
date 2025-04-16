--!nocheck
--!nolint

local Files = {
    ["Universal"] = {
        Name = "Universal",
        Load = require("games/Universal/init.luau")
    },

    ["Arsenal"] = {
        Name = "Arsenal",
        Load = require("games/Arsenal/init.luau"),
        Places = {
            286090429
        }
    },
}

for _, Game in pairs(Files) do
    if Game.Places then
        for _, PlaceId in ipairs(Game.Places) do
            if PlaceId == game.PlaceId then
                Game:Load()
                return
            end
        end
    end
end

Files.Universal:Load()