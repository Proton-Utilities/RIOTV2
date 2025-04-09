--!nocheck
--!nolint UnknownGlobal

return function(self)
	local NewLoader, PingRemote =
		game:GetService("ReplicatedFirst"):WaitForChild("NewLoader"),
		game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Ping")

	do
		local OldTaskSpawn
		OldTaskSpawn = hookfunction(
			getrenv().task.spawn,
			newcclosure(function(Function: (...any) -> ...any, ...)
				local Arguments = { ... }

				if Arguments[1] == PingRemote and debug.info(Function, "n") == "InvokeServer" then
					return task.wait(9e9)
				end

				return OldTaskSpawn(Function, ...)
			end)
		)
	end

	do
		local Old
		Old = hookmetamethod(
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
						hookmetamethod(game, "__namecall", Old)
						return task.wait(9e9)
					end
				end

				return Old(self, Argument, ...)
			end)
		)
	end

	do
		local Old
		Old = hookmetamethod(
			game,
			"__namecall",
			newcclosure(function(self, Argument, ...)
				if
					self == game
					and not checkcaller()
					and getnamecallmethod() == "FindService"
					and Argument == "VirtualUser"
				then
					hookmetamethod(game, "__namecall", Old)
					return task.wait(9e9)
				end

				return Old(self, Argument, ...)
			end)
		)
	end

	do
		local old
		old = hookmetamethod(
			game,
			"__newindex",
			newcclosure(function(self, index, val)
				if self == NewLoader and not checkcaller() then
					return task.wait(9e9)
				end

				return old(self, index, val)
			end)
		)
	end
end
