--!nocheck
--!nolint

local Push = function(File)
	local Actor = getactors()[1]
	if Actor then
		run_on_actor(Actor, File)
	else
		loadstring(File)()
	end
end

Push([================================================================================[ 
--!DARKLUA_BUILD: [SPLIT_END]
]================================================================================])
