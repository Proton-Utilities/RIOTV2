--!nocheck
--!nolint UnknownGlobal

return function(self)
    local NewLoader, PingRemote = game:GetService("ReplicatedFirst"):WaitForChild("NewLoader"), game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Ping")
    
    do
        local old_task_spawn; old_task_spawn = hookfunction(getrenv().task.spawn, newcclosure(function(Function: (...any) -> (...any), ...)
            local Arguments = {...}
        
            if Arguments[1] == PingRemote and debug.info(Function, "n") == "InvokeServer" then
                return task.wait(9e9)
            end
        
            return old_task_spawn(Function, ...)
        end))
    end
    
    do
        local old; old = hookmetamethod(game, "__namecall", newcclosure(function(self, arg, ...)
            if self.Parent == nil and not checkcaller() and getnamecallmethod() == "Fire" and typeof(arg) == "table" then
                local userdata, _ = next(arg)
        
                if typeof(userdata) == "userdata" then
                    hookmetamethod(game, "__namecall", old)
                    return task.wait(9e9)
                end
            end
        
            return old(self, arg, ...)
        end))
    end
    
    do
        local old; old = hookmetamethod(game, "__namecall", newcclosure(function(self, arg, ...)
            if self == game and not checkcaller() and getnamecallmethod() == "FindService" and arg == "VirtualUser" then
                hookmetamethod(game, "__namecall", old)
                return task.wait(9e9)
            end
        
            return old(self, arg, ...)
        end))
    end
    
    do 
        local old; old = hookmetamethod(game, "__newindex", newcclosure(function(self, index, val)
            if self == NewLoader and not checkcaller() then
                return task.wait(9e9)
            end
        
            return old(self, index, val)
        end))
    end
end