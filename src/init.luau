--!nocheck
--!nolint

local Files = {
    ["linoriaBase"] = {
        Name = "linoriaBase",
        Load = require("games/linoriaBase/init.luau"),
    },

    ["riotUiBase"] = {
        Name = "riotUiBase",
        Load = require("games/riotUiBase/init.luau"),
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
Files.riotUiBase:Load()