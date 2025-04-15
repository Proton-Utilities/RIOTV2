--!nocheck
--!nolint UnknownGlobal

return function(self)
	local NewLoader, PingRemote =
		game:GetService("ReplicatedFirst"):WaitForChild("NewLoader"),
		game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Ping")

	do
		local Original
		Original = hookfunction(
			getrenv().task.spawn,
			newcclosure(function(Function: (...any) -> ...any, ...)
				local Arguments = { ... }

				if Arguments[1] == PingRemote and debug.info(Function, "n") == "InvokeServer" then
					return task.wait(9e9)
				end

				return Original(Function, ...)
			end)
		)
	end

	do
		local Original
		Original = hookmetamethod(
			game,
			"__namecall",
			newcclosure(function(self, Argument, ...)
				if
					self.Parent == nil
					and not checkcaller()
					and getnamecallmethod() == "Fire"
					and typeof(Argument) == "table"
				then
					local Userdata, _ = next(Argument)

					if typeof(Userdata) == "userdata" then
						hookmetamethod(game, "__namecall", Original)
						return task.wait(9e9)
					end
				end

				return Original(self, Argument, ...)
			end)
		)
	end

	do
		local Original
		Original = hookmetamethod(
			game,
			"__namecall",
			newcclosure(function(self, Argument, ...)
				if
					self == game
					and not checkcaller()
					and getnamecallmethod() == "FindService"
					and Argument == "VirtualUser"
				then
					hookmetamethod(game, "__namecall", Original)
					return task.wait(9e9)
				end

				return Original(self, Argument, ...)
			end)
		)
	end

	do
		local Original
		Original = hookmetamethod(
			game,
			"__newindex",
			newcclosure(function(self, Index, Value)
				if self == NewLoader and not checkcaller() then
					return task.wait(9e9)
				end

				return Original(self, Index, Value)
			end)
		)
	end
end
