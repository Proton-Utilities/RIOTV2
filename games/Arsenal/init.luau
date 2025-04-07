--!nocheck
--!nolint LocalUnused

return function(self)
	--// Imports
    local _ACBypass = require("games/Arsenal/ACBypass.luau")
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

    --// Services
    local Workspace: Workspace = GetService("Workspace")
    local ReplicatedStorage: ReplicatedStorage = GetService("ReplicatedStorage")

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
        do
            local AimbotSection = Tab:Section{ Name = "Aimbot" }

            -- Settings
            do
                local AimbotSettingsSection = AimbotSection:Section{ Name = "Aimbot Settings" }

                AimbotSettingsSection:Toggle({
                    Name = "Enabled",
                    Description = "enables aimbot",
                    State = false,
                    Callback = function(self, value)
                        AimbotSettings.Enabled = value
                    end
                }, "Aimbot"):Continue()
        
                AimbotSettingsSection:Keybind({
                    Bind = Enum.UserInputType.MouseButton2,
                    Blacklist = {Enum.UserInputType.MouseButton1},
                    onHeld = function(self, value, gameProcessedEvent)
                        if gameProcessedEvent then return end
                        AimbotSettings.SetState(value)
                    end
                }, "AimbotKeybind")
        
                AimbotSettingsSection:Slider({
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
        
                AimbotSettingsSection:Dropdown({
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
        
                AimbotSettingsSection:Slider({
                    Name = "Max Distance",
                    Description = "the distance aimbot stops locking onto players",
                    Value = 500,
                    Minimum = 1,
                    Maximum = 2000,
                    Step = 1,
                    Precision = 0,
                    Callback = function(self, value)
                        AimbotSettings.MaxDistance = value
                    end
                }, "MaxDistance")
        
                AimbotSettingsSection:Dropdown({
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
        
                AimbotSettingsSection:Dropdown({
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
        
                AimbotSettingsSection:Toggle({
                    Name = "Team Check", 
                    Description = "whether to ignore friendlys", 
                    State = true,
                    Callback = function(self, Value)
                        AimbotSettings.TeamCheck = Value
                    end
                })
        
                AimbotSettingsSection:Toggle({
                    Name = "Alive Check", 
                    Description = "whether to ignore corpses", 
                    State = true,
                    Callback = function(self, Value)
                        AimbotSettings.AliveCheck = Value
                    end
                }):Continue()
            end

            -- FOV Settings
            do
                local FOVSettingsSection = AimbotSection:Section{ Name = "FOV Settings" }

                FOVSettingsSection:Toggle({
                    Name = "Enabled", 
                    Description = "whether the aimbot radius limit is active", 
                    State = true,
                    Callback = function(self, Value)
                        FOVSettings.Enabled = Value
                    end
                })

                FOVSettingsSection:Slider({
                    Name = "Radius",
                    Description = "aimbot FOV limit radius",
                    Value = 120,
                    Minimum = 1,
                    Maximum = 500,
                    Step = 1,
                    Precision = 0,
                    Callback = function(self, value)
                        FOVSettings.Radius = value
                    end
                }, "AimbotFOVRadiusSlider")

                FOVSettingsSection:Toggle({
                    Name = "Visible", 
                    Description = "draws a circle representing the aimbot FOV radius", 
                    State = true,
                    Callback = function(self, Value)
                        FOVSettings.Visible = Value
                    end
                })

                FOVSettingsSection:Slider({
                    Name = "Circle Sides",
                    Description = "the amount of points the drawn circle has",
                    Value = 45,
                    Minimum = 3,
                    Maximum = 80,
                    Step = 1,
                    Precision = 0,
                    Callback = function(self, value)
                        FOVSettings.NumSides = value
                    end
                }, "AimbotFOVCircleSidesSlider")
            end
        end

        -- Triggerbot
        do
            local TriggerbotSection = Tab:Section{ Name = "Triggerbot" }

            TriggerbotSection:Toggle({
                Name = "Enabled",
                Description = "enables triggerbot",
                State = false,
                Callback = function(self, value)
                    TriggerbotSettings.Enabled = value
                end
            }, "TriggerbotEnabled")

            TriggerbotSection:Slider({
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

            TriggerbotSection:Toggle({
                Name = "Team Check", 
                Description = "whether to ignore friendlys", 
                State = true,
                Callback = function(self, Value)
                    TriggerbotSettings.TeamCheck = Value
                end
            })
    
            TriggerbotSection:Toggle({
                Name = "Alive Check", 
                Description = "whether to ignore corpses", 
                State = true,
                Callback = function(self, Value)
                    AimbotSettings.AliveChecl = Value
                end
            }):Continue()
        end
    end

    -- [[ Tabs.Rage ]] --
    do
        local Tab = Tabs.Rage
    end

    -- [[ Tabs.Visuals ]] --
    do
        local Tab = Tabs.Visuals
    end

    -- [[ Tabs.Misc ]] --
    do
        local Tab = Tabs.Misc

        -- Gun Modifications
        do
            local GunModificationsSection = Tab:Section{ Name = "Gun Modifications" }

            local OriginalValues = {}

            local function UpdateModification(Name, NewValue)
                local Weapons = ReplicatedStorage:FindFirstChild("Weapons")
            
                if Weapons then
                    for _, v in pairs(Weapons:GetDescendants()) do
                        if v.Name == Name and v.Parent.Parent == Weapons then
                            if OriginalValues[v] == nil then
                                OriginalValues[v] = v.Value
                            end
            
                            v.Value = NewValue
                        end
                    end
                end
            end
            
            local function RestoreModification(Name)
                local Weapons = ReplicatedStorage:FindFirstChild("Weapons")
            
                if Weapons then
                    for _, v in pairs(Weapons:GetDescendants()) do
                        if v.Name == Name and OriginalValues[v] ~= nil then
                            v.Value = OriginalValues[v]
                            OriginalValues[v] = nil
                        end
                    end
                end
            end

            GunModificationsSection:Toggle({
                Name = "Automatics",
                Description = "makes all guns automatic", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("Auto", true)
                    else
                        RestoreModification("Auto")
                    end
                end
            })

            GunModificationsSection:Toggle({
                Name = "Max Ammo",
                Description = "stores maximum ammo", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("Ammo", 300)
                        UpdateModification("StoredAmmo", 300)
                    else
                        RestoreModification("Ammo")
                        RestoreModification("StoredAmmo")
                    end
                end
            }, "InfAmmoToggle")

            GunModificationsSection:Toggle({
                Name = "Fast Fire",
                Description = "enables fast fire rate", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("FireRate", 0.05)
                    else
                        RestoreModification("FireRate")
                    end
                end
            })

            GunModificationsSection:Toggle({
                Name = "No Equip Timer", 
                Description = "removes the delay from equipping to shooting", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("EquipTime", 0)
                    else
                        RestoreModification("EquipTime")
                    end
                end
            })
            
            GunModificationsSection:Toggle({
                Name = "Instant Reload", 
                Description = "instantly reloads your ammo", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("ReloadTime", 0)
                    else
                        RestoreModification("ReloadTime")
                    end
                end
            })

            GunModificationsSection:Toggle({
                Name = "No Spread", 
                Description = "removes gun spread", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("MaxSpread", 0)
                        UpdateModification("Spread", 0)
                    else
                        RestoreModification("MaxSpread")
                        RestoreModification("Spread")
                    end
                end
            })

            GunModificationsSection:Toggle({
                Name = "No Recoil",
                Description = "removes gun recoil", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("RecoilControl", 0)
                    else
                        RestoreModification("RecoilControl")
                    end
                end
            })

            GunModificationsSection:Toggle({
                Name = "No Projectile Charging",
                Description = "removes charge timer for projectiles", 
                State = false,
                Callback = function(self, Value)
                    if Value then
                        UpdateModification("ChargeTime", 0)
                    else
                        RestoreModification("ChargeTime")
                    end
                end
            })
        end
    end

    -- [[ Tabs.Cfg ]] --
    do
        local Tab = Tabs.Cfg

        Tab:Toggle({
            Name = "Visual preview",
            Description = "enables a visual preview of your esp",
            State = false,
            Callback = function(self, state)
                Window:VisualPreview({
                    Visible = state
                })
            end,
        }):Continue()
        
        Tab:Keybind({
            Bind = Window.Settings.Keybind,
            Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2},
            onChanged = function(self, key)
                Window:UpdateSettings({
                    Keybind = key
                })
            end,
        }):Continue()
        
        Tab:Button({
            Color = Colors.SystemDarkRed,
            Name = "Unload Menu",
            Callback = function(self)
                Interface:Unload()
            end,
        }):Continue()
    end

	--// Initialize
    -- ACBypass()
	Esp.Load()
	Aiming.Load()

    Tabs.Legit:Select()

    do
        local Map: Folder = Workspace:FindFirstChild("Map")
        local IgnoreFolder: Folder = Map and Map:FindFirstChild("Ignore")

        if IgnoreFolder then
            for _, child in ipairs(IgnoreFolder:GetChildren()) do
                Aiming.AddIgnoreInstance(child)
                print(#Aiming.Ignored)
            end

            IgnoreFolder.ChildAdded:Connect(function(child)
                Aiming.AddIgnoreInstance(child)
                print(#Aiming.Ignored)
            end)
        end
    end
end
