--!nocheck
--!nolint LocalUnused
--!nolint UnknownGlobal

return function(self)
	--// Imports
	local ACBypass = require("games/Arsenal/ACBypass.luau")

	local Functions = require("core/functions.luau")
	local Interface = require("core/riotUi.luau")

	local Esp = require("modules/esp.luau")
	local Aiming = require("modules/aiming.luau")
	local SilentAim = require("games/Arsenal/silentAim.luau")

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
	local AimbotFOVSettings = Aiming.FOVSettings

	local SilentAimSettings = SilentAim.SilentAim
	local SilentAimFOVSettings = SilentAimSettings.FOVSettings
	local SnaplineSettings = SilentAimSettings.SnaplineSettings

	--// References
	local LocalPlayer = Functions.GetPlayer()

	--// Methods
	local GetService = Functions.SecureService

	--// Services
	local RunService: RunService = GetService("RunService")
	local Workspace: Workspace = GetService("Workspace")
	local Players: Players = GetService("Players")
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
			local AimbotSection = Tab:Section({ Name = "Aimbot" })

			-- Settings
			do
				local AimbotSettingsSection = AimbotSection:Section({ Name = "Aimbot Settings" })

				AimbotSettingsSection:Toggle({
					Name = "Enabled",
					Description = "enables aimbot",
					State = false,
					Callback = function(self, value)
						AimbotSettings.Enabled = value
					end,
				}):Continue()
				AimbotSettingsSection:Keybind({
					Bind = Enum.UserInputType.MouseButton2,
					Blacklist = { Enum.UserInputType.MouseButton1 },
					onHeld = function(self, value, gameProcessedEvent)
						if gameProcessedEvent then
							return
						end
						AimbotSettings.SetState(value)
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Wall Check",
					Description = "the method used by wall check",
					Options = { "Off", "Sticky", "Always On" },
					Value = { "Always On" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, value)
						AimbotSettings.WallCheck = ({ ["Off"] = 1, ["Sticky"] = 2, ["Always On"] = 3 })[value[1]]
					end,
				})

				AimbotSettingsSection:Toggle({
					Name = "Team Check",
					Description = "whether to ignore friendlys",
					State = true,
					Callback = function(self, value)
						AimbotSettings.TeamCheck = value
					end,
				})

				AimbotSettingsSection:Toggle({
					Name = "Alive Check",
					Description = "whether to ignore corpses",
					State = true,
					Callback = function(self, value)
						AimbotSettings.AliveCheck = value
					end,
				}):Continue()

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
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Bone",
					Description = "selects the bone to aim at",
					Options = { "Head", "Torso" },
					Value = { "Head" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, value)
						local Part = value[1] == "Torso" and "HumanoidRootPart" or value[1]
						AimbotSettings.LockPart = Part
					end,
				})

				AimbotSettingsSection:Dropdown({
					Name = "Lock Method",
					Description = "the input used to lock onto a player",
					Options = { "Camera", "Mouse" },
					Value = { "Camera" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, value)
						AimbotSettings.LockMode = ({ Camera = 1, Mouse = 2 })[value[1]]
					end,
				})

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
					end,
				}):Continue()
			end

			-- FOV Settings
			do
				local FOVSettingsSection = AimbotSection:Section({ Name = "FOV Settings" })

				FOVSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether the aimbot radius limit is active",
					State = true,
					Callback = function(self, value)
						AimbotFOVSettings.Enabled = value
					end,
				})

				FOVSettingsSection:Toggle({
					Name = "Visible",
					Description = "draws a circle representing the aimbot FOV radius",
					State = true,
					Callback = function(self, value)
						AimbotFOVSettings.Visible = value
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
						Callback = function(color)
							AimbotFOVSettings.Color = color
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
						Callback = function(color)
							AimbotFOVSettings.LockedColor = color
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
					Callback = function(self, value)
						AimbotFOVSettings.Radius = value
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
					Callback = function(self, value)
						AimbotFOVSettings.NumSides = value
					end,
				}):Continue()
			end
		end

		-- Triggerbot
		do
			local TriggerbotSection = Tab:Section({ Name = "Triggerbot" })

			TriggerbotSection:Toggle({
				Name = "Enabled",
				Description = "enables triggerbot",
				State = false,
				Callback = function(self, value)
					TriggerbotSettings.Enabled = value
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
				Callback = function(self, value)
					TriggerbotSettings.Delay = value / 1000
				end,
			})

			TriggerbotSection:Toggle({
				Name = "Team Check",
				Description = "whether to ignore friendlys",
				State = true,
				Callback = function(self, value)
					TriggerbotSettings.TeamCheck = value
				end,
			})

			TriggerbotSection:Toggle({
				Name = "Alive Check",
				Description = "whether to ignore corpses",
				State = true,
				Callback = function(self, value)
					AimbotSettings.AliveCheck = value
				end,
			}):Continue()
		end
	end

	-- [[ Tabs.Rage ]] --
	do
		local Tab = Tabs.Rage

		-- Silent Aim
		do
			local SilentAimSection = Tab:Section({ Name = "Silent Aim" })

			-- Settings
			do
				local SilentAimSettingsSection = SilentAimSection:Section({ Name = "Silent Aim Settings" })

				SilentAimSettingsSection:Toggle({
					Name = "Enabled",
					Description = "enables silent aim",
					State = false,
					Callback = function(self, value)
						SilentAimSettings.Enabled = value
						SilentAimSettings.SetState(value)
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Trigger In Bounds",
					Description = "fires your gun while a target is within bounds\nFunctions similar to triggerbot.",
					State = false,
					Callback = function(self, value)
						SilentAimSettings.LockContinueTrigger = function()
							if value then
								TriggerbotSettings:Trigger()
							end
						end
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Wall Check",
					Description = "enables wall check",
					State = true,
					Callback = function(self, value)
						SilentAimSettings.WallCheck = value
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Team Check",
					Description = "enables team check",
					State = true,
					Callback = function(self, value)
						SilentAimSettings.TeamCheck = value
					end,
				})

				SilentAimSettingsSection:Toggle({
					Name = "Alive Check",
					Description = "enables alive check",
					State = true,
					Callback = function(self, value)
						SilentAimSettings.AliveCheck = value
					end,
				})

				SilentAimSettingsSection:Dropdown({
					Name = "Bone",
					Description = "selects the bone bullets redirect to",
					Options = { "Head", "Torso", "Random" },
					Value = { "Head" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, value)
						if value[1] == "Random" then
							SilentAimSettings.RandomLockPart = true
							return
						end
						SilentAimSettings.RandomLockPart = false
						local Part = value[1] == "Torso" and "HumanoidRootPart" or value[1]
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
					Filter = function(value)
						return tostring(value) .. "%"
					end,
					Callback = function(self, value)
						SilentAimSettings.HitChance = value
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
					Callback = function(self, value)
						SilentAimSettings.MaxDistance = value
					end,
				}):Continue()
			end

			-- FOV Settings
			do
				local FOVSettingsSection = SilentAimSection:Section({ Name = "FOV Settings" })

				FOVSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether the silent aim radius limit is active",
					State = true,
					Callback = function(self, value)
						SilentAimFOVSettings.Enabled = value
					end,
				})

				FOVSettingsSection:Toggle({
					Name = "Visible",
					Description = "draws a circle representing the silent aim FOV radius",
					State = true,
					Callback = function(self, value)
						SilentAimFOVSettings.Visible = value
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
						Callback = function(color, transparency)
							SilentAimFOVSettings.Color[1], SilentAimFOVSettings.Color[2] = color, 1 - transparency
							SilentAimFOVSettings.OutlineColor[2] = 1 - transparency
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
					Callback = function(self, value)
						SilentAimFOVSettings.Radius = value
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
					Callback = function(self, value)
						SilentAimFOVSettings.NumSides = value
					end,
				}):Continue()
			end

			-- Snapline Settings
			do
				local SnaplinesSettingsSection = SilentAimSection:Section({ Name = "Snaplines Settings" })

				SnaplinesSettingsSection:Toggle({
					Name = "Enabled",
					Description = "whether snapping point lines are enabled",
					State = true,
					Callback = function(self, value)
						SnaplineSettings.Enabled = value
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
						Callback = function(color, transparency)
							SnaplineSettings.Color[1], SnaplineSettings.Color[2] = color, 1 - transparency
							SnaplineSettings.OutlineColor[2] = 1 - transparency
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
					Callback = function(self, value)
						SnaplineSettings.Thickness = value
					end,
				}):Continue()
			end
		end

		-- Gun Modifications
		do
			local GunModificationsSection = Tab:Section({ Name = "Gun Modifications" })

			local OriginalValues = {}
			local OriginalSENVValues = {}

			local function UpdateWeaponValue(Name, NewValue, UseSENV)
				local SENVWeapons = game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons
				local Weapons: Folder = ReplicatedStorage:FindFirstChild("Weapons")

				if UseSENV then
					if SENVWeapons and getsenv(SENVWeapons)[Name] then
						OriginalSENVValues[Name] = getsenv(SENVWeapons)[Name]
						getsenv(SENVWeapons)[Name] = NewValue
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

			local function RestoreWeaponValue(Name, UseSENV)
				local SENVWeapons = game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons
				local Weapons: Folder = ReplicatedStorage:FindFirstChild("Weapons")

				if UseSENV then
					if SENVWeapons and OriginalSENVValues[Name] then
						getsenv(SENVWeapons)[Name] = OriginalSENVValues[Name]
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
				Callback = function(self, value)
					UpdateWeaponValue("Bullets", function(Type, Old)
						return Type == "number" and Old * value or Old
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
				Callback = function(self, value)
					UpdateWeaponValue("Crit", function(Type, Old)
						return Type == "number" and Old * value or Old
					end)
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Automatics",
				Description = "makes all guns automatic",
				State = false,
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					local wkspc = ReplicatedStorage.wkspc
					local CurrentCurse = wkspc and wkspc.CurrentCurse

					if CurrentCurse and CurrentCurse.Value and value then
						CurrentCurse.Value = "Infinite Ammo"
					elseif not value then
						CurrentCurse.Value = ""
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Rapid Fire",
				Description = "enables rapid fire rate",
				State = false,
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					if value then
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
				Callback = function(self, value)
					local Gui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("GUI")
					local Client = Gui and Gui:FindFirstChild("Client")
					local Variables = Client and Client:FindFirstChild("Variables")
					local Overheat = Variables and Variables:FindFirstChild("overheat")

					if not Overheat then
						return
					end

					if self._OverheatConn then
						self._OverheatConn:Disconnect()
						self._OverheatConn = nil
					end

					if value then
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
				Callback = function(self, value)
					if value then
						UpdateWeaponValue("ChargeTime", 0)
					else
						RestoreWeaponValue("ChargeTime")
					end
				end,
			})

			GunModificationsSection:Toggle({
				Name = "Haste",
				Description = "removes player slowdown",
				State = false,
				Callback = function(self, value)
					if value then
						UpdateWeaponValue("Speed%", -150)
					else
						RestoreWeaponValue("Speed%")
					end
				end,
			}):Continue()
		end
	end

	-- [[ Tabs.Visuals ]] --
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
				Callback = function(self, value)
					ESPShared.textFont = value
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
				Callback = function(self, value)
					ESPShared.textSize = value
				end,
			})

			ESPSection:Toggle({
				Name = "Use Team Color",
				Description = "enables ESP team color",
				State = false,
				Callback = function(self, value)
					ESPShared.useTeamColor = value
				end,
			})

			ESPSection:Toggle({
				Name = "Limit Enabled",
				Description = "enables distance limit",
				State = false,
				Callback = function(self, value)
					ESPShared.limitDistance = value
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
				Callback = function(self, value)
					ESPShared.maxDistance = value
				end,
			}):Continue()

			local function UpdateVisualPreview(Team)
				Window:VisualPreview({
					HealthBar = {
						Visible = Team.healthBar,
						Color = { Team.healthyColor },
					},

					Name = {
						Visible = Team.name,
						Color = { Team.nameColor[1], Team.nameColor[2] },
					},

					Distance = {
						Visible = Team.distance,
						Color = { Team.distanceColor[1], Team.distanceColor[2] },
					},

					Health = {
						Visible = Team.healthText,
						Color = { Team.healthTextColor[1], Team.healthTextColor[2] },
					},

					Weapon = {
						Visible = Team.weapon,
						Color = { Team.weaponColor[1], Team.weaponColor[2] },
					},

					BoundingBox = {
						Visible = Team.box,
						Color = { Team.boxColor[1], Team.boxColor[2] },
					},

					CornerBox = {
						Visible = Team.cornerBox,
						Color = { Team.cornerBoxColor[1], Team.cornerBoxColor[2] },
					},

					FillBox = {
						Visible = Team.boxFill,
						Color = { Team.boxFillColor[1], Team.boxFillColor[2] },
					},
				})
			end

			local function AddTeamSettings(ESPTarg, Header)
				Header:Toggle({
					Name = "Enabled",
					Description = "enables ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.enabled = value
					end,
				})

				-- Bounding Box
				Header:Toggle({
					Name = "Bounding Box",
					Description = "enables bounding box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.box = value

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
						Callback = function(color, transparency)
							ESPTarg.boxColor[1], ESPTarg.boxColor[2] = color, 1 - transparency
							ESPTarg.boxOutlineColor[2] = 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Box Fill
				Header:Toggle({
					Name = "Box Fill",
					Description = "enables box fill ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.boxFill = value

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
						Callback = function(color, transparency)
							ESPTarg.boxFillColor[1], ESPTarg.boxFillColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Corner Box
				Header:Toggle({
					Name = "Corner Box",
					Description = "enables corner box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.cornerBox = value

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
						Callback = function(color, transparency)
							ESPTarg.cornerBoxColor[1], ESPTarg.cornerBoxColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				Header:Toggle({
					Name = "3D Bounding Box",
					Description = "enables 3d bounding box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.box3d = value

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
						Callback = function(color, transparency)
							ESPTarg.box3dColor[1], ESPTarg.box3dColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Chams
				Header:Toggle({
					Name = "Chams",
					Description = "enables player chams ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.chams = value
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
						Callback = function(color, transparency)
							ESPTarg.chamsFillColor[1], ESPTarg.chamsFillColor[2] = color, transparency

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
						Callback = function(color, transparency)
							ESPTarg.chamsOutlineColor[1], ESPTarg.chamsOutlineColor[2] = color, transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Tracers
				Header:Toggle({
					Name = "Tracers",
					Description = "enables tracers ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.tracer = value
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
						Callback = function(color, transparency)
							ESPTarg.tracerColor[1], ESPTarg.tracerColor[2] = color, 1 - transparency
							ESPTarg.tracerOutlineColor[2] = 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				Header:Dropdown({
					Name = "Tracers Origin",
					Description = "selects the starting port of tracers",
					Options = { "Top", "Middle", "Bottom", "Mouse" },
					Value = { "Top" },
					Limit = 1,
					Minimum = 1,
					Callback = function(self, value)
						ESPTarg.tracerOrigin = value[1]
					end,
				})

				-- Health Bars
				Header:Toggle({
					Name = "Health Bar",
					Description = "enables health bar ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.healthBar = value

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
						Callback = function(color)
							ESPTarg.healthyColor = color

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
						Callback = function(color)
							ESPTarg.dyingColor = color

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Off Screen Arrows
				Header:Toggle({
					Name = "Off Screen Arrows",
					Description = "enables off screen arrow ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.offScreenArrow = value
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
						Callback = function(color, transparency)
							ESPTarg.offScreenArrowColor[1], ESPTarg.offScreenArrowColor[2] = color, 1 - transparency
							ESPTarg.offScreenArrowOutlineColor[2] = 1 - transparency

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
					Callback = function(self, value)
						ESPShared.offScreenArrowSize = value
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
					Callback = function(self, value)
						ESPShared.offScreenArrowRadius = value
					end,
				})

				-- Name Text
				Header:Toggle({
					Name = "Name",
					Description = "enables name text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.name = value

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
						Callback = function(color, transparency)
							ESPTarg.nameColor[1], ESPTarg.nameColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Distance Text
				Header:Toggle({
					Name = "Distance",
					Description = "enables distance text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.distance = value

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
						Callback = function(color, transparency)
							ESPTarg.distanceColor[1], ESPTarg.distanceColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Weapon Text
				Header:Toggle({
					Name = "Weapon",
					Description = "enables weapon text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.weapon = value

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
						Callback = function(color, transparency)
							ESPTarg.weaponColor[1], ESPTarg.weaponColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Health Text
				Header:Toggle({
					Name = "Health",
					Description = "enables health text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.healthText = value

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
						Callback = function(color, transparency)
							ESPTarg.healthTextColor[1], ESPTarg.healthTextColor[2] = color, 1 - transparency

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
	end

	-- [[ Tabs.Misc ]] --
	do
		local Tab = Tabs.Misc

		--[[
		-- Viewmodel
		do
			local ViewmodelSection = Tab:Section({ Name = "Viewmodel" })

			Header:Dropdown({
				Name = "Arms Material",
				Description = "selects the material for viewmodel arms",
				Options = Enum.Material:GetEnumItems(),
				Value = { "Plastic" },
				Limit = 1,
				Minimum = 1,
				Callback = function(self, value)
					
				end,
			})
			ViewmodelSection:Dropdown({
				Name = "Arms Material"
			})
		end]]
	end

	-- [[ Tabs.Cfg ]] --
	do
		local Tab = Tabs.Cfg

		Tab:Toggle({
			Name = "Visual preview",
			Description = "enables a visual preview of your esp",
			State = true,
			Callback = function(self, state)
				Window:VisualPreview({
					Visible = state,
				})
			end,
		}):Continue()

		Tab:Keybind({
			Bind = Window.Settings.Keybind,
			Blacklist = { Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2 },
			onChanged = function(self, key)
				Window:UpdateSettings({
					Keybind = key,
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
	ACBypass()
	Tabs.Legit:Select()

	Interface:Notification({
		Title = `RIOT V2 - {self.Name} | getriot.cc`,
		Description = `RIOT V2 Loaded!`,
		Lifetime = 5,
	})

	-- ESP Init
	do
		Esp.Load()

		Esp.getWeapon = function(Player)
			local weapon = "None"

			if Player then
				local tool = Player.NRPBS and Player.NRPBS.EquippedTool
				if tool and tool.Value then
					weapon = tool.Value
				end
			end

			return string.upper(weapon)
		end

		Esp.getHealth = function(Player)
			local Nrbps = Player.NRPBS
			local Health = Nrbps and Nrbps.Health
			local MaxHealth = Nrbps and Nrbps.MaxHealth
			if Health and MaxHealth then
				return Health.Value, MaxHealth.Value
			end
			return 100, 100
		end
	end

	-- Aiming Init
	do
		Aiming.Load()
		Aiming.PlayerAlive = function(Player)
			return Player.NRPBS and Player.NRPBS.Health and Player.NRPBS.Health.Value < 0
		end
	end
end
