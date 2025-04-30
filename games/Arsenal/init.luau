--!nocheck
--!nolint LocalUnused
--!nolint UnknownGlobal

return function(self)
	repeat
		task.wait()
	until getrenv()._G.ClientLoaded

	--// Imports
	local Functions = require("core/functions.luau")
	local Interface = require("riotLib/library.luau")

	local Esp = require("modules/esp.luau")
	local Aiming = require("modules/aiming.luau")
	local SilentAim = require("./silentAim.luau")

	--// Methods
	local GetService = Functions.SecureService

	--// Services
	local Workspace: Workspace = GetService("Workspace")
	local Lighting: Lighting = GetService("Lighting")
	local ReplicatedStorage: ReplicatedStorage = GetService("ReplicatedStorage")
	local RunService: RunService = GetService("RunService")

	--// References
	local LocalPlayer: Player = Functions.GetPlayer()

	--// Variables
	local Components = Interface.Components
	local Assets = Interface.Assets
	local Colors = Interface.Colors

	local ESPShared = Esp.Shared
	local ESPTeam = Esp.Team
	local ESPEnemy = ESPTeam.Enemy
	local ESPFriendly = ESPTeam.Friendly

	local AimbotSettings = Aiming.Aimbot
	local TriggerbotSettings = Aiming.Triggerbot
	local AimbotFOVSettings = Aiming.FOVSettings

	local SilentAimSettings = SilentAim.SilentAim
	local SilentAimFOVSettings = SilentAimSettings.FOVSettings
	local SilentAimSnaplineSettings = SilentAimSettings.SnaplineSettings

	local Utility = {
		GetClient = function(): (ScreenGui, Script)
			local Gui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer["PlayerGui"]:FindFirstChild("GUI")
			local Client = Gui and Gui:FindFirstChild("Client")

			return Client, getsenv(Client)
		end,
	}

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

	-- Legit
	do
		local Tab = Tabs.Legit

		-- Aimbot
		do
			local AimbotSection = Tab:Section({ Name = "Aimbot" })

			-- Settings
			do
				local AimbotSettingsSection = AimbotSection:Section({ Name = "Settings" })

				AimbotSettingsSection:Toggle({
					Name = "Enabled",
					Description = "enables aimbot",
					State = false,
					Callback = function(self, Value)
						AimbotSettings.Enabled = Value
					end,
				}):Continue()
				AimbotSettingsSection:Keybind({
					Bind = Enum.UserInputType.MouseButton2,
					Blacklist = { Enum.UserInputType.MouseButton1 },
					onHeld = function(self, Value, gameProcessedEvent)
						if gameProcessedEvent then
							return
						end
						AimbotSettings.SetState(Value)
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Wall Check",
					Description = "the method used by wall check",
					Options = { "Off", "Sticky", "Always On" },
					Value = { "Always On" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, Value)
						AimbotSettings.WallCheck = ({ ["Off"] = 1, ["Sticky"] = 2, ["Always On"] = 3 })[Value[1]]
					end,
				})

				AimbotSettingsSection:Toggle({
					Name = "Team Check",
					Description = "whether to ignore friendlys",
					State = true,
					Callback = function(self, Value)
						AimbotSettings.TeamCheck = Value
					end,
				})

				AimbotSettingsSection:Slider({
					Name = "Smoothing",
					Description = "aimbot smoothness",
					Value = 1,
					Minimum = 1,
					Maximum = 20,
					Step = 0.1,
					Precision = 1,
					Callback = function(self, Value)
						AimbotSettings.Sensitivity = (Value - 1) / (self.Settings.Maximum - 1) * 0.15
						AimbotSettings.Sensitivity2 = Value
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Bone",
					Description = "selects the bone to aim at",
					Options = { "Head", "Torso" },
					Value = { "Head" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, Value)
						AimbotSettings.LockPart = Value[1] == "Torso" and "HumanoidRootPart" or Value[1]
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Input Method",
					Description = "the input used to lock onto a player",
					Options = { "Camera", "Mouse" },
					Value = { "Camera" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, Value)
						AimbotSettings.LockMode = ({ Camera = 1, Mouse = 2 })[Value[1]]
					end,
				})

				AimbotSettingsSection:Slider({
					Name = "Max Distance",
					Description = "the distance aimbot stops locking onto players",
					Value = 800,
					Minimum = 1,
					Maximum = 2000,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						AimbotSettings.MaxDistance = Value
					end,
				}):Continue()
			end

			-- FOV Settings
			do
				local FOVSettingsSection = AimbotSection:Section({ Name = "FOV" })

				FOVSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether the aimbot radius limit is active",
					State = true,
					Callback = function(self, Value)
						AimbotFOVSettings.Enabled = Value
					end,
				})

				FOVSettingsSection:Toggle({
					Name = "Visible",
					Description = "draws a circle representing the aimbot FOV radius",
					State = true,
					Callback = function(self, Value)
						AimbotFOVSettings.Visible = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Description = "Unlocked Color",
						AlphaEnabled = false,
						Color = { Color3.fromRGB(255, 150, 150), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color)
							AimbotFOVSettings.Color = Color
						end,
					})
					:Continue()
					:Colorpicker({
						Description = "Locked Color",
						AlphaEnabled = false,
						Color = { Color3.fromRGB(150, 255, 150), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color)
							AimbotFOVSettings.LockedColor = Color
						end,
					})

				FOVSettingsSection:Slider({
					Name = "Radius",
					Description = "aimbot FOV limit radius",
					Value = 120,
					Minimum = 1,
					Maximum = 500,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						AimbotFOVSettings.Radius = Value
					end,
				})

				FOVSettingsSection:Slider({
					Name = "Circle Sides",
					Description = "the amount of points the drawn circle has",
					Value = 45,
					Minimum = 3,
					Maximum = 80,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						AimbotFOVSettings.NumSides = Value
					end,
				}):Continue()
			end
		end

		-- Triggerbot
		do
			local TriggerbotSection = Tab:Section({ Name = "Triggerbot" })

			TriggerbotSection:Toggle({
				Name = "Enabled",
				Description = "enables triggerbot. fires your gun when a target is in bounds",
				State = false,
				Callback = function(self, Value)
					TriggerbotSettings.Enabled = Value
				end,
			})

			TriggerbotSection:Slider({
				Name = "Reaction Time",
				Description = "the time it takes for triggerbot to react to targets (ms)",
				Value = 0,
				Minimum = 0,
				Maximum = 500,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					TriggerbotSettings.Delay = Value / 1000
				end,
			})

			TriggerbotSection:Toggle({
				Name = "Team Check",
				Description = "whether to ignore friendlys",
				State = true,
				Callback = function(self, Value)
					TriggerbotSettings.TeamCheck = Value
				end,
			}):Continue()
		end
	end

	-- Rage
	do
		local Tab = Tabs.Rage

		-- Silent Aim
		do
			local SilentAimSection = Tab:Section({ Name = "Silent Aim" })

			-- Settings
			do
				local SilentAimSettingsSection = SilentAimSection:Section({ Name = "Settings" })

				SilentAimSettingsSection:Toggle({
					Name = "Enabled",
					Description = "enables silent aim",
					State = false,
					Callback = function(self, Value)
						SilentAimSettings.Enabled = Value
						SilentAimSettings.SetState(Value)
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Auto Fire",
					Description = "enabled automatic fire when a target is in bounds",
					State = false,
					Callback = function(self, Value)
						if Value then
							SilentAimSettings.LockContinueTrigger = function()
								TriggerbotSettings.Trigger()
							end
						else
							SilentAimSettings.LockContinueTrigger = nil
						end
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Wall Check",
					Description = "enables wall check",
					State = true,
					Callback = function(self, Value)
						SilentAimSettings.WallCheck = Value
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Team Check",
					Description = "enables team check",
					State = true,
					Callback = function(self, Value)
						SilentAimSettings.TeamCheck = Value
					end,
				})

				SilentAimSettingsSection:Dropdown({
					Name = "Bone",
					Description = "selects the bone bullets redirect to",
					Options = { "Head", "Torso" },
					Value = { "Head" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, Value)
						local Part = Value[1] == "Torso" and "HumanoidRootPart" or Value[1]
						SilentAimSettings.LockPart = Part
					end,
				})

				SilentAimSettingsSection:Slider({
					Name = "Hit Chance",
					Description = "the chance bullets will hit when shot with silent aim",
					Value = 100,
					Minimum = 0,
					Maximum = 100,
					Step = 1,
					Precision = 0,
					Filter = function(Value)
						return tostring(Value) .. "%"
					end,
					Callback = function(self, Value)
						SilentAimSettings.HitChance = Value
					end,
				})

				SilentAimSettingsSection:Slider({
					Name = "Max Distance",
					Description = "the distance silent aim stops redirecting bullets",
					Value = 500,
					Minimum = 1,
					Maximum = 2000,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						SilentAimSettings.MaxDistance = Value
					end,
				}):Continue()
			end

			-- FOV Settings
			do
				local FOVSettingsSection = SilentAimSection:Section({ Name = "FOV" })

				FOVSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether the silent aim radius limit is active",
					State = true,
					Callback = function(self, Value)
						SilentAimFOVSettings.Enabled = Value
					end,
				})

				FOVSettingsSection:Toggle({
					Name = "Visible",
					Description = "draws a circle representing the silent aim FOV radius",
					State = true,
					Callback = function(self, Value)
						SilentAimFOVSettings.Visible = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(100, 50, 255), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							SilentAimFOVSettings.Color[1], SilentAimFOVSettings.Color[2] = Color, 1 - Transparency
							SilentAimFOVSettings.OutlineColor[2] = 1 - Transparency
						end,
					})

				FOVSettingsSection:Slider({
					Name = "Radius",
					Description = "silent aim FOV limit radius",
					Value = 120,
					Minimum = 1,
					Maximum = 500,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						SilentAimFOVSettings.Radius = Value
					end,
				})

				FOVSettingsSection:Slider({
					Name = "Circle Sides",
					Description = "the amount of points the drawn circle has",
					Value = 45,
					Minimum = 3,
					Maximum = 80,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						SilentAimFOVSettings.NumSides = Value
					end,
				}):Continue()
			end

			-- Snapline Settings
			do
				local SnaplinesSettingsSection = SilentAimSection:Section({ Name = "Snaplines" })

				SnaplinesSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether snapping point lines are enabled",
					State = true,
					Callback = function(self, Value)
						SilentAimSnaplineSettings.Enabled = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(200, 230, 255), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							SilentAimSnaplineSettings.Color[1], SilentAimSnaplineSettings.Color[2] =
								Color, 1 - Transparency
							SilentAimSnaplineSettings.OutlineColor[2] = 1 - Transparency
						end,
					})

				SnaplinesSettingsSection:Slider({
					Name = "Thickness",
					Description = "how thick the snapping point line is",
					Value = 2,
					Minimum = 1,
					Maximum = 6,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						SilentAimSnaplineSettings.Thickness = Value
					end,
				}):Continue()
			end
		end

		-- Gun Modifications
		do
			local GunModificationsSection = Tab:Section({ Name = "Gun Modifications" })

			local OriginalValues = {}
			local OriginalEnvValues = {}

			local function UpdateWeaponValue(Name, NewValue, UseSEnv)
				local Client = Utility.GetClient()
				local Weapons_Env = Client.Functions.Weapons
				local Weapons = ReplicatedStorage:FindFirstChild("Weapons")

				if UseSEnv then
					if Weapons_Env and getsenv(Weapons_Env)[Name] then
						OriginalEnvValues[Name] = getsenv(Weapons_Env)[Name]
						getsenv(Weapons_Env)[Name] = NewValue
					end
				else
					if Weapons then
						for _, Modifier in pairs(Weapons:GetDescendants()) do
							if
								Modifier.Name == Name
								and Modifier.Parent.Parent == Weapons
								and Modifier:IsA("ValueBase")
							then
								if OriginalValues[Modifier] == nil then
									OriginalValues[Modifier] = Modifier.Value
								end

								if typeof(NewValue) == "function" then
									Modifier.Value = NewValue(typeof(Modifier.Value), OriginalValues[Modifier])
								else
									Modifier.Value = NewValue
								end
							end
						end
					end
				end
			end

			local function RestoreWeaponValue(Name, UseSEnv)
				local Client = Utility.GetClient()
				local Weapons_Env = Client.Functions.Weapons
				local Weapons = ReplicatedStorage:FindFirstChild("Weapons")

				if UseSEnv then
					if Weapons_Env and OriginalEnvValues[Name] then
						getsenv(Weapons_Env)[Name] = OriginalEnvValues[Name]
					end
				else
					if Weapons then
						for _, Modifier in pairs(Weapons:GetDescendants()) do
							if Modifier.Name == Name and OriginalValues[Modifier] ~= nil then
								Modifier.Value = OriginalValues[Modifier]
								OriginalValues[Modifier] = nil
							end
						end
					end
				end
			end

			GunModificationsSection:Slider({
				Name = "Bullet Multiplier",
				Description = "Multiplies the bullets fired per shot\n⚠️ This can lag your game with high values⚠️",
				Value = 1,
				Minimum = 1,
				Maximum = 8,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					UpdateWeaponValue("Bullets", function(Type, Old)
						return Type == "number" and Old * Value or Old
					end)
				end,
			})

			GunModificationsSection:Slider({
				Name = "Critical Multiplier",
				Description = "Multiplies the crit multiplier for your gun",
				Value = 1,
				Minimum = 1,
				Maximum = 100,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					UpdateWeaponValue("Crit", function(Type, Old)
						return Type == "number" and Old * Value or Old
					end)
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Automatics",
				Description = "makes all guns automatic",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("mode", "automatic", true)
						UpdateWeaponValue("Auto", true)
					else
						RestoreWeaponValue("automatic", true)
						RestoreWeaponValue("Auto")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Infinite Ammo",
				Description = "enables infinite ammo",
				State = false,
				Callback = function(self, Value)
					local Wkspc = ReplicatedStorage:FindFirstChild("wkspc")
					local CurrentCurse = Wkspc and Wkspc.CurrentCurse

					if CurrentCurse and CurrentCurse.Value and Value then
						CurrentCurse.Value = "Infinite Ammo" -- Use the method in Client > Weapons module if this gets patched
					elseif not Value then
						CurrentCurse.Value = ""
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Rapid Fire",
				Description = "enables rapid fire rate",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("FireRate", 0.02)
					else
						RestoreWeaponValue("FireRate")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Equip Timer",
				Description = "removes the delay from equipping to shooting",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("EquipTime", 0)
					else
						RestoreWeaponValue("EquipTime")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Instant Reload",
				Description = "removes reload timer",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("ReloadTime", 0)
					else
						RestoreWeaponValue("ReloadTime")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Spread",
				Description = "removes gun spread",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("MaxSpread", 0)
						UpdateWeaponValue("Spread", 0)
					else
						RestoreWeaponValue("MaxSpread")
						RestoreWeaponValue("Spread")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Recoil",
				Description = "removes gun recoil",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("recoil", 0, true)
						UpdateWeaponValue("RecoilControl", 0)
					else
						RestoreWeaponValue("recoil", true)
						RestoreWeaponValue("RecoilControl")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Overheating",
				Description = "removes overheating for the Z80",
				State = false,
				Callback = function(self, Value)
					local Client = Utility.GetClient()
					local Variables = Client and Client:FindFirstChild("Variables")
					local Overheat = Variables and Variables:FindFirstChild("overheat")

					if not Overheat then
						return
					end

					if self._OverheatConn then
						self._OverheatConn:Disconnect()
						self._OverheatConn = nil
					end

					if Value then
						self._OverheatConn = Overheat:GetPropertyChangedSignal("Value"):Connect(function()
							if Overheat.Value > 0 then
								Overheat.Value = 0
							end
						end)
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Projectile Charging",
				Description = "removes charge timer for projectiles",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("ChargeTime", 0)
					else
						RestoreWeaponValue("ChargeTime")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "No Slow",
				Description = "removes gun slowdown",
				State = false,
				Callback = function(self, Value)
					if Value then
						UpdateWeaponValue("Speed%", function(Type, Old)
							return Type == "number" and Old > 0 and 0
						end)
					else
						RestoreWeaponValue("Speed%")
					end
				end,
			}):Continue()
		end
	end

	-- Visuals
	do
		local Tab = Tabs.Visuals

		-- ESP
		do
			local ESPSection = Tab:Section({ Name = "ESP" })

			ESPSection:Slider({
				Name = "Text Font",
				Description = "the font ESP text uses",
				Value = 3,
				Minimum = 0,
				Maximum = 3,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					ESPShared.TextFont = Value
				end,
			})
			ESPSection:Slider({
				Name = "Text Size",
				Description = "the size of ESP text",
				Value = 13,
				Minimum = 1,
				Maximum = 20,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					ESPShared.TextSize = Value
				end,
			})

			ESPSection:Toggle({
				Name = "Use Team Color",
				Description = "enables ESP team color",
				State = false,
				Callback = function(self, Value)
					ESPShared.UseTeamColor = Value
				end,
			})

			ESPSection:Toggle({
				Name = "Limit Enabled",
				Description = "enables distance limit",
				State = false,
				Callback = function(self, Value)
					ESPShared.LimitDistance = Value
				end,
			}):Continue()
			ESPSection:Slider({
				Name = "Max Distance",
				Description = "the maximum distance that ESP will render at",
				Value = 500,
				Minimum = 1,
				Maximum = 2000,
				Step = 1,
				Precision = 0,
				Callback = function(self, Value)
					ESPShared.MaxDistance = Value
				end,
			}):Continue()

			local function UpdateVisualPreview(Team)
				Window:VisualPreview({
					HealthBar = {
						Visible = Team.HealthBar,
						Color = { Team.HealthyColor },
					},

					Name = {
						Visible = Team.Name,
						Color = { Team.NameColor[1], Team.NameColor[2] },
					},

					Distance = {
						Visible = Team.Distance,
						Color = { Team.DistanceColor[1], Team.DistanceColor[2] },
					},

					Health = {
						Visible = Team.HealthText,
						Color = { Team.HealthTextColor[1], Team.HealthTextColor[2] },
					},

					Weapon = {
						Visible = Team.Weapon,
						Color = { Team.WeaponColor[1], Team.WeaponColor[2] },
					},

					BoundingBox = {
						Visible = Team.Box,
						Color = { Team.BoxColor[1], Team.BoxColor[2] },
					},

					CornerBox = {
						Visible = Team.CornerBox,
						Color = { Team.CornerBoxColor[1], Team.CornerBoxColor[2] },
					},

					FillBox = {
						Visible = Team.BoxFill,
						Color = { Team.BoxFillColor[1], Team.BoxFillColor[2] },
					},
				})
			end

			local function AddTeamSettings(ESPTarg, Header)
				Header:Toggle({
					Name = "Enabled",
					Description = "enables ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Enabled = Value
					end,
				})

				-- Bounding Box
				Header:Toggle({
					Name = "Bounding Box",
					Description = "enables bounding box ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Box = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(77, 92, 143), 0.5 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.BoxColor[1], ESPTarg.BoxColor[2] = Color, 1 - Transparency
							ESPTarg.BoxOutlineColor[2] = 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Box Fill
				Header:Toggle({
					Name = "Box Fill",
					Description = "enables box fill ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.BoxFill = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(0, 0, 0), 0.8 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.BoxFillColor[1], ESPTarg.BoxFillColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Corner Box
				Header:Toggle({
					Name = "Corner Box",
					Description = "enables corner box ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.CornerBox = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(123, 124, 2433), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.CornerBoxColor[1], ESPTarg.CornerBoxColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Bounding Box
				Header:Toggle({
					Name = "3D Bounding Box",
					Description = "enables 3d bounding box ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Box3d = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(141, 149, 192), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.Box3dColor[1], ESPTarg.Box3dColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Chams
				Header:Toggle({
					Name = "Chams",
					Description = "enables player chams ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Chams = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Description = "Fill Color",
						Color = { Color3.fromRGB(100, 120, 250), 0.8 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.ChamsFillColor[1], ESPTarg.ChamsFillColor[2] = Color, Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()
					:Colorpicker({
						Description = "Outline Color",
						Color = { Color3.fromRGB(25, 85, 255), 0.5 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.ChamsOutlineColor[1], ESPTarg.ChamsOutlineColor[2] = Color, Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Skeletons
				Header:Toggle({
					Name = "Skeletons",
					Description = "enables skeleton/bone ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Skeleton = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(123, 124, 243), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.SkeletonColor[1], ESPTarg.SkeletonColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()

				Header:Slider({
					Name = "Thickness",
					Description = "the thickness of skeleton lines",
					Value = 1,
					Minimum = 1,
					Maximum = 4,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						ESPTarg.SkeletonThickness = Value
					end,
				})

				-- Tracers
				Header:Toggle({
					Name = "Tracers",
					Description = "enables tracers ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Tracer = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(123, 124, 243), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.TracerColor[1], ESPTarg.TracerColor[2] = Color, 1 - Transparency
							ESPTarg.TracerOutlineColor[2] = 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()

				Header:Dropdown({
					Name = "Tracers Origin",
					Description = "selects the starting port of tracers",
					Options = { "Top", "Middle", "Bottom", "Mouse" },
					Value = { "Top" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, Value)
						ESPTarg.TracerOrigin = Value[1]
					end,
				})

				-- Health Bars
				Header:Toggle({
					Name = "Health Bar",
					Description = "enables health bar ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.HealthBar = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Description = "Healthy Color",
						AlphaEnabled = false,
						Color = { Color3.fromRGB(58, 161, 47), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color)
							ESPTarg.HealthyColor = Color

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()
					:Colorpicker({
						Description = "Dying Color",
						AlphaEnabled = false,
						Color = { Color3.fromRGB(161, 47, 47), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color)
							ESPTarg.DyingColor = Color

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Off Screen Arrows
				Header:Toggle({
					Name = "Off Screen Arrows",
					Description = "enables off screen arrow ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.OffScreenArrow = Value
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(255, 255, 255), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.OffScreenArrowColor[1], ESPTarg.OffScreenArrowColor[2] = Color, 1 - Transparency
							ESPTarg.OffScreenArrowOutlineColor[2] = 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()

				Header:Slider({
					Name = "Arrow Size",
					Description = "changes the size of the individual off screen arrows",
					Value = 15,
					Minimum = 1,
					Maximum = 50,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						ESPShared.OffScreenArrowSize = Value
					end,
				}):Continue()

				Header:Slider({
					Name = "Radius",
					Description = "changes the radius limit of offscreen arrows",
					Value = 150,
					Minimum = 1,
					Maximum = 500,
					Step = 1,
					Precision = 0,
					Callback = function(self, Value)
						ESPShared.OffScreenArrowRadius = Value
					end,
				})

				-- Name Text
				Header:Toggle({
					Name = "Name",
					Description = "enables name text ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Name = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(221, 215, 148), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.NameColor[1], ESPTarg.NameColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Distance Text
				Header:Toggle({
					Name = "Distance",
					Description = "enables distance text ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Distance = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(221, 215, 148), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.DistanceColor[1], ESPTarg.DistanceColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Weapon Text
				Header:Toggle({
					Name = "Weapon",
					Description = "enables weapon text ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.Weapon = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(200, 173, 182), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.WeaponColor[1], ESPTarg.WeaponColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Health Text
				Header:Toggle({
					Name = "Health",
					Description = "enables health text ESP",
					State = false,
					Callback = function(self, Value)
						ESPTarg.HealthText = Value

						UpdateVisualPreview(ESPTarg)
					end,
				})
					:Continue()
					:Colorpicker({
						Color = { Color3.fromRGB(200, 173, 182), 0 },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
						Callback = function(self, Color, Transparency)
							ESPTarg.HealthTextColor[1], ESPTarg.HealthTextColor[2] = Color, 1 - Transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})
					:Continue()
			end

			local EnemiesSection = ESPSection:Section({ Name = "Enemies" })
			AddTeamSettings(ESPEnemy, EnemiesSection)

			local FriendliesSection = ESPSection:Section({ Name = "Friendlies" })
			AddTeamSettings(ESPFriendly, FriendliesSection)
		end

		-- World
		do
			local WorldSection = Tab:Section({ Name = "World" })

			WorldSection:Toggle({
				Name = "Night mode",
				Description = "enables night mode",
				State = false,
				Callback = function(self, Value)
					if self.__NightModeConn then
						self.__NightModeConn:Disconnect()
						self.__NightModeConn = nil
					end

					if Value then
						self.__OldClockTime = Lighting.ClockTime
						self.__NightModeConn = RunService.Heartbeat:Connect(function()
							if Lighting.ClockTime ~= 0 then
								self.__OldClockTime = Lighting.ClockTime
								Lighting.ClockTime = 0
							end
						end)
					else
						if self.__OldClockTime then
							Lighting.ClockTime = self.__OldClockTime
						end
					end
				end,
			})

			-- Color Correction
			do
				local ColorCorrectionSection = WorldSection:Section({ Name = "Color Correction" })

				local Effect: ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
				Effect.Parent = Lighting

				ColorCorrectionSection:Toggle({
					Name = "Enabled",
					Description = "enables world color correction",
					State = false,
					Callback = function(self, Value)
						Effect.Enabled = Value
					end,
				})

				ColorCorrectionSection:Colorpicker({
					AlphaEnabled = false,
					Name = "Tint",
					Description = "changes world color correction tint",
					Color = { Color3.fromRGB(255, 255, 255) },
					SuggestionColors = {
						{ Color3.fromRGB(171, 81, 83) },
						{ Color3.fromRGB(123, 124, 243) },
						{ Color3.fromRGB(208, 246, 111) },
						{ Color3.fromRGB(255, 197, 100) },
						{ Color3.fromRGB(49, 220, 195) },
					},
					Callback = function(self, Color)
						Effect.TintColor = Color
					end,
				})

				ColorCorrectionSection:Slider({
					Name = "Brightness",
					Description = "changes world color correction brightness",
					Value = 0,
					Minimum = -1,
					Maximum = 1,
					Step = 0.01,
					Precision = 2,
					Callback = function(self, Value)
						Effect.Brightness = Value
					end,
				})

				ColorCorrectionSection:Slider({
					Name = "Contrast",
					Description = "changes world color correction contrast",
					Value = 0,
					Minimum = -2,
					Maximum = 5,
					Step = 0.01,
					Precision = 2,
					Callback = function(self, Value)
						Effect.Contrast = Value
					end,
				})

				ColorCorrectionSection:Slider({
					Name = "Saturation",
					Description = "changes world color correction saturation",
					Value = 0,
					Minimum = -10,
					Maximum = 10,
					Step = 0.01,
					Precision = 2,
					Callback = function(self, Value)
						Effect.Saturation = Value
					end,
				})
			end
		end

		--[[ -- Effects
		do
			local EffectsSection = Tab:Section({ Name = "Effects" })

			-- Bullet Tracers
			do
				local BulletTracersSection = EffectsSection:Section({ Name = "Bullet Tracers" })

				BulletTracersSection:Toggle({
					Name = "Enabled",
					Description = "enables bullet tracers",
					State = false,
				}, "Visuals/Effects/BulletTracers/Enabled")
					:Continue()
					:Colorpicker({
						Description = "Gradient Start",
						Color = { Color3.fromRGB(161, 188, 229) },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
					}, "Visuals/Effects/BulletTracers/Gradient Start")
					:Continue()
					:Colorpicker({
						Description = "Gradient End",
						Color = { Color3.fromRGB(221, 224, 136) },
						SuggestionColors = {
							{ Color3.fromRGB(171, 81, 83) },
							{ Color3.fromRGB(123, 124, 243) },
							{ Color3.fromRGB(208, 246, 111) },
							{ Color3.fromRGB(255, 197, 100) },
							{ Color3.fromRGB(49, 220, 195) },
						},
					}, "Visuals/Effects/BulletTracers/Gradient End")

				BulletTracersSection:Slider({
					Name = "Duration",
					Description = "how long bullet tracers will last for",
					Value = 2,
					Minimum = 1,
					Maximum = 50,
					Step = 1,
					Precision = 0,
				})

				BulletTracersSection:Slider({
					Name = "Fade Duration",
					Description = "how long bullet tracers will take to fade out when they expire",
					Value = 1,
					Minimum = 0,
					Maximum = 10,
					Step = 1,
					Precision = 0,
				})
			end

			-- Hitmarkers
			do
				local HitmarkersSection = EffectsSection:Section({ Name = "Hitmarkers" })
			end
		end ]]
	end

	-- Misc
	do
		local Tab = Tabs.Misc

		-- Local Player
		do
			local LocalPlayerSection = Tab:Section({ Name = "Local Player" })

			LocalPlayerSection:Slider({
				Name = "Speed Multiplier",
				Description = "multiplies your movement speed",
				Value = 1,
				Minimum = 1,
				Maximum = 4,
				Step = 0.1,
				Precision = 1,
				Callback = function(self, Value)
					local Character = Functions.GetCharacter(LocalPlayer)
					if Character then
						Character.Humanoid.WalkSpeed *= Value
					end
				end,
			}, "Misc/LocalPlayer/SpeedMultiplier")

			LocalPlayerSection:Slider({
				Name = "Jump Multiplier",
				Description = "multiplies your jump power",
				Value = 1,
				Minimum = 1,
				Maximum = 15,
				Step = 0.1,
				Precision = 1,
				Callback = function(self, Value)
					local Humanoid = Functions.GetHumanoid(LocalPlayer)
					if Humanoid then
						local Method = Humanoid.UseJumpPower and "JumpPower" or "JumpHeight"
						Humanoid[Method] *= Value
					end
				end,
			}, "Misc/LocalPlayer/JumpMultiplier")

			LocalPlayerSection:Toggle({
				Name = "Third Person",
				Description = "enables third person perspective",
				State = false,
				Callback = function(self, Value)
					if self._ThirdPersonConn then
						self._ThirdPersonConn:Disconnect()
						self._ThirdPersonConn = nil
					end

					if Value then
						LocalPlayer.CameraMode = Enum.CameraMode.Classic
						self._ThirdPersonConn = LocalPlayer:GetPropertyChangedSignal("CameraMode"):Connect(function()
							LocalPlayer.CameraMode = Enum.CameraMode.Classic
						end)
					else
						LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
					end
				end,
			}):Continue()
		end
	end

	-- Cfg
	do
		local Tab = Tabs.Cfg

		Tab:Toggle({
			Name = "Visual preview",
			Description = "enables a visual preview of your esp",
			State = true,
			Callback = function(self, State)
				Window:VisualPreview({
					Visible = State,
				})
			end,
		}):Continue()

		Tab:Keybind({
			Bind = Window.Settings.Keybind,
			Blacklist = { Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2 },
			onChanged = function(self, Key)
				Window:UpdateSettings({
					Keybind = Key,
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
	-- ESP
	do
		Esp.GetWeapon = function(Player)
			if not Player then
				return "NONE"
			end

			local NRPBS = Player:FindFirstChild("NRPBS")
			if not NRPBS then
				return "NONE"
			end

			local EquippedTool = NRPBS:FindFirstChild("EquippedTool")
			if not EquippedTool or not EquippedTool.Value then
				return "NONE"
			end

			return string.upper(EquippedTool.Value)
		end

		Esp.GetHealth = function(Player)
			if not Player then
				return 100, 100
			end

			local NRPBS = Player:FindFirstChild("NRPBS")
			if not NRPBS then
				return 100, 100
			end

			local Health = NRPBS:FindFirstChild("Health")
			local MaxHealth = NRPBS:FindFirstChild("MaxHealth")

			if not Health or not MaxHealth then
				return 100, 100
			end

			return Health.Value, MaxHealth.Value
		end

		Esp.Load()
	end

	-- Aiming
	do
		Aiming.GetHealth = function(Player)
			if not Player then
				return 0
			end

			local NRPBS = Player:FindFirstChild("NRPBS")
			if not NRPBS then
				return 0
			end

			local Health = NRPBS:FindFirstChild("Health")
			if not Health then
				return 0
			end

			return Health.Value
		end

		local WasMingiun = false
		TriggerbotSettings.Trigger = function()
			local _, Client = Utility.GetClient()
			local Deployed = Client and Client.deployed
			local Equipped = Client and Client.equipped
			local Primary = Client and Client.primary

			if Deployed then
				if Equipped.Value == "primary" and Primary.Value == "Minigun" then
					mouse1press()
					WasMingiun = true
					return
				elseif WasMingiun then
					mouse1release()
					WasMingiun = false
				end

				mouse1press()
				wait()
				mouse1release()
			end
		end

		--[[ TriggerbotSettings.TargetChanged = function()
			mouse1release()
		end ]]

		--[[ TriggerbotSettings.Trigger = function()
			local Gui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("GUI")
			local Client = Gui and Gui:FindFirstChild("Client")
			local Weapon = Client and getsenv(Client).wep
			local Equipped = Client and getsenv(Client).equipped
			local Primary = Client and getsenv(Client).primary

			if Weapon then
				local PrevCheck = Equipped.Value == "melee"
				Weapon.firebullet()
				task.wait() -- firebullet is too fast it's gotta be nerfed
				if not PrevCheck and Equipped.Value == "" or Equipped.Value == "melee" and Primary == "Railgun" then
					Weapon.autoequip()
				end
			end
		end ]]

		Aiming.Load()

		local function AddToIgnoreQuery(IgnoreGroup)
			if IgnoreGroup then
				Aiming.AddToIgnoreQuery(IgnoreGroup)
				SilentAim.AddToIgnoreQuery(IgnoreGroup)
			end
		end

		Workspace.ChildAdded:Connect(function(Child)
			if Child.Name == "Map" then
				local MapIgnore = Child:FindFirstChild("Ignore")
				if MapIgnore then
					AddToIgnoreQuery(MapIgnore)
				end
			end
		end)

		local Map = Workspace:FindFirstChild("Map")
		if Map then
			local MapIgnore = Map:FindFirstChild("Ignore")
			if MapIgnore then
				AddToIgnoreQuery(MapIgnore)
			end
		end

		for _, Name in ipairs({ "Ray_Ignore", "Debris" }) do
			local Folder = Workspace:FindFirstChild(Name)
			if Folder then
				AddToIgnoreQuery(Folder)
			end
		end
	end

	-- Interface
	do
		Tabs.Legit:Select()
		Interface:Notification({
			Title = `RIOT {RIOT.VERSION} - getriot.cc`,
			Description = `RIOT for {self.Name} loaded!`,
			Lifetime = 5,
		})
	end

	-- Hooks
	do
		-- __newindex
		do
			local Original
			Original = hookmetamethod(
				game,
				"__newindex",
				newcclosure(function(Object, Key, Value)
					if not checkcaller() and typeof(Object) == "Instance" and Object:IsA("Humanoid") then
						if Key == "WalkSpeed" and typeof(Value) == "number" then
							return Original(
								Object,
								Key,
								Value * Components["Misc/LocalPlayer/SpeedMultiplier"].Settings.Value
							)
						elseif (Key == "JumpPower" or Key == "JumpHeight") and typeof(Value) == "number" then
							return Original(
								Object,
								Key,
								Value * Components["Misc/LocalPlayer/JumpMultiplier"].Settings.Value
							)
						end
					end
					return Original(Object, Key, Value)
				end)
			)
		end
	end
end
