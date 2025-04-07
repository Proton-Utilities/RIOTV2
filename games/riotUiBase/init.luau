--!nocheck
--!nolint LocalUnused

return function(self)
	--// Imports
	local Functions = require("core/functions.luau")
	local Interface = require("core/riotUi.luau")

	local Esp = require("modules/esp.luau")
	local Aiming = require("modules/aiming.luau")

	--// Variables
	local Components = Interface.Components
	local Assets = Interface.Assets
	local Colors = Interface.Colors

	local ESPShared = Esp.shared
	local ESPTeam = Esp.team
	local ESPEnemy = ESPTeam.enemy
	local ESPFriendly = ESPTeam.friendly

	local AimbotSettings = Aiming.Aimbot
	local TriggerbotSettings = Aiming.Triggerbot
	local FOVSettings = Aiming.FOVSettings

	--// Methods
	local GetService = Functions.SecureService

	--// UI Begin
	local Window = Interface:Window({
		Title = self.Name,
		Keybind = Enum.KeyCode.RightControl,
	})

	local Tabs = {
		Legit = Window:Tab({ Name = "Legit", Image = Assets.ShieldCheck }),
		Rage = Window:Tab({ Name = "Rage", Image = Assets.Shield }),
		Visuals = Window:Tab({ Name = "Visuals", Image = Assets.Bolt }),
		Misc = Window:Tab({ Name = "Misc", Image = Assets.Folder }),
		Cfg = Window:Tab({ Name = "Cfg", Image = Assets.Archive }),
	}

    -- [[ Tabs.Legit ]] --
    do
        local Tab = Tabs.Legit

        -- Aimbot
        local Aimbot = Tab:Section{ Name = "Aimbot" }

        Aimbot:Toggle({
            Name = "Enabled",
            Description = "enables aimbot",
            State = false,
            Callback = function(self, value)
                AimbotSettings.Enabled = value
            end
        }, "Aimbot"):Continue()

        Aimbot:Keybind({
            Bind = Enum.UserInputType.MouseButton2,
            Blacklist = {Enum.UserInputType.MouseButton1},
            onHeld = function(self, value, gameProcessedEvent)
                if gameProcessedEvent then return end
                AimbotSettings.SetState(value)
            end
        }, "AimbotKeybind")

        Aimbot:Slider({
            Name = "Smoothing",
            Description = "aimbot smoothness",
            Value = 1,
            Minimum = 1,
            Maximum = 20,
            Step = 0.1,
            Precision = 1,
            Callback = function(self, value)
                AimbotSettings.Sensitivity = (value - 1) / (self.Settings.Maximum - 1) * 0.15
                AimbotSettings.Sensitivity2 = value
            end
        }, "AimbotSmoothing")

        Aimbot:Dropdown({
            Name = "Bone",
            Description = "selects the bone to aim at",
            Options = {"Head", "Torso"},
            Value = {"Head"},
            Limit = 1,
            Minimum = 1,
            Callback = function(self, value)
                AimbotSettings.LockPart = value[1]
            end,
        }, "Bone")

        Aimbot:Slider({
            Name = "Max Distance",
            Description = "the distance aimbot stops locking onto players",
            Value = 100,
            Minimum = 1,
            Maximum = 500,
            Step = 1,
            Precision = 0,
            Callback = function(self, value)
                AimbotSettings.MaxDistance = value*4
            end
        }, "MaxDistance")

        Aimbot:Dropdown({
            Name = "Lock Method",
            Description = "the input used to lock onto a player",
            Options = { "Camera", "Mouse" },
            Value = {"Camera"},
            Limit = 1,
            Minimum = 1,
            Callback = function(self, value)
                AimbotSettings.LockMode = ({ Camera = 1, Mouse = 2 })[value[1]]
            end
        }, "AimbotLockMethod")

        Aimbot:Dropdown({
            Name = "Wall Check",
            Description = "the method used by wall check",
            Options = { "Off", "Sticky", "Always On" },
            Value = {"Always On"},
            Limit = 1,
            Minimum = 1,
            Callback = function(self, value)
                AimbotSettings.WallCheck = ({ ["Off"] = 1, ["Sticky"] = 2, ["Always On"] = 3 })[value[1]]
            end
        }, "AimbotWallCheckMode")

        Aimbot:Toggle({
            Name = "Team Check", 
            Description = "whether to ignore friendlys", 
            State = true,
            Callback = function(self, Value)
                AimbotSettings.TeamCheck = Value
            end
        })

        Aimbot:Toggle({
            Name = "Alive Check", 
            Description = "whether to ignore corpses", 
            State = true,
            Callback = function(self, Value)
                AimbotSettings.AliveChecl = Value
            end
        }):Continue()

        -- Triggerbot
        local Triggerbot = Tab:Section{ Name = "Triggerbot" }

        Triggerbot:Toggle({
            Name = "Enabled",
            Description = "enables triggerbot",
            State = false,
            Callback = function(self, value)
                TriggerbotSettings.Enabled = value
            end
        }, "TriggerbotEnabled")

        Triggerbot:Slider({
            Name = "Trigger Delay",
            Description = "in miliseconds, the reaction time of triggerbot",
            Value = 0,
            Minimum = 1,
            Maximum = 500,
            Step = 1,
            Precision = 0,
            Callback = function(self, value)
                TriggerbotSettings.Delay = value / 1000
            end
        }, "TriggerbotDelay")

        for _, Settings in ipairs({
            { "Team Check", "whether to ignore friendlys", "TeamCheck", true },
            { "Alive Check", "whether to ignore corpses", "AliveCheck", true }
        }) do
            Triggerbot:Toggle({
                Name = Settings[1], Description = Settings[2], State = Settings[4],
                Callback = function(self, Value)
                    TriggerbotSettings[Settings[3]] = Value
                end
            })
        end
    end

	--// Initialize
	Esp.Load()
	Aiming.Load()

    Tabs.Legit:Select()
end
