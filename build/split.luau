--!nocheck
--!nolint

local Spec_Id = {
	UniverseId = {
		113491250,
		2132866904,
	},
}

local Push = function(File)
	local Actor = getactors and getactors()[1]

	if
		Actor
		and (Spec_Id.PlaceId and table.find(Spec_Id.PlaceId, game.PlaceId))
		or (Spec_Id.UniverseId and table.find(Spec_Id.UniverseId, game.GameId))		
	then
		return run_on_actor(Actor, File)
	else
		return loadstring(File)()
	end
end

Push(
	[================================================================================================================================================================[
		getgenv().RIOT = {
			BUILD = #- COMPOSER[GET BUILD_TYPE] -#,
			VERSION = #- COMPOSER[GET BUILD_VERSION] -# or 'v0.0.0'
		}
		
		#- COMPOSER[INSERT(BUILD)] -#
	]================================================================================================================================================================]
)