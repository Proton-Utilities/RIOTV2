--!nocheck
--!nolint

local Files = {
    ["linoriaBase"] = {
        Name = "linoriaBase",
        Load = require("games/linoriaBase/init.luau"),
    },

    ["Arsenal"] = {
        Name = "Arsenal",
        Load = require("games/Arsenal/init.luau"),
        Places = {
            286090429
        }
    },

    ["Universal"] = {
        Name = "Universal",
        Load = require("games/Universal/init.luau"),
    }
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

--Files.newBase:Load()
--Files.Universal:Load()
Files.Arsenal:Load()