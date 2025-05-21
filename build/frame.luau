--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @author Proton-Utilities
    @name RIOTV2

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
	genDate = __COMPOSER.Insert(__COMPOSER.genDate),
	cfg = __COMPOSER.Insert(__COMPOSER.cfg),
	vers = __COMPOSER.Insert(__COMPOSER.vers),
}

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

Push([===[
    __COMPOSER.Insert(__COMPOSER.build)
]===])
