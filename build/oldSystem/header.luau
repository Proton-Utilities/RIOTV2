--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/RIOTV2

    @name RIOT V2
    @author Proton Utilities

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local ROA_Id = {
    UniverseId = {
        113491250,
        2132866904,
    },
}

local Push = function(File)
    local Actor = getactors and getactors()[1]

    if
        Actor and (ROA_Id.PlaceId and table.find(ROA_Id.PlaceId, game.PlaceId))
        or (ROA_Id.UniverseId and table.find(ROA_Id.UniverseId, game.GameId))
    then
        return run_on_actor(Actor, File)
    else
        return loadstring(File)()
    end
end

Push([====[
        getgenv().RIOT = {
            BUILD = __COMPOSER : INSERT 'GET BUILD_TYPE',
            VERSION = __COMPOSER : INSERT 'GET BUILD_VERSION' or 'v0.0.0'
        }

        __COMPOSER : INSERT 'GET BUILD'
    ]====])
