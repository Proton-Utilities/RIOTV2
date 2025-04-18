--!nocheck
--!nolint LocalUnused
--!nolint UnknownGlobal

return function(self)
	--// Imports
	local Interface = require("core/riotUi.luau")

	local ESP = require("modules/esp.luau")
	local Aiming = require("modules/aiming.luau")

	--// Variables
	local Assets = Interface.Assets
	local Colors = Interface.Colors

	local ESPShared = ESP.Shared
	local ESPTeam = ESP.Team
	local ESPEnemy = ESPTeam.Enemy
	local ESPFriendly = ESPTeam.Friendly

	local AimbotSettings = Aiming.Aimbot
	local TriggerbotSettings = Aiming.Triggerbot
	local AimbotFOVSettings = Aiming.FOVSettings

	--// UI Begin
	local Window = Interface:Window({
		Title = self.Name,
		Keybind = Enum.KeyCode.RightControl,
	})

	local Tabs = {
		Legit = Window:Tab({ Name = "Legit", Image = Assets.ShieldCheck }),
		Visuals = Window:Tab({ Name = "Visuals", Image = Assets.Bolt }),
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
					Value = 800,
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
					ESPShared.TextFont = value
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
					ESPShared.TextSize = value
				end,
			})

			ESPSection:Toggle({
				Name = "Use Team Color",
				Description = "enables ESP team color",
				State = false,
				Callback = function(self, value)
					ESPShared.UseTeamColor = value
				end,
			})

			ESPSection:Toggle({
				Name = "Limit Enabled",
				Description = "enables distance limit",
				State = false,
				Callback = function(self, value)
					ESPShared.LimitDistance = value
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
					ESPShared.MaxDistance = value
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
					Callback = function(self, value)
						ESPTarg.Enabled = value
					end,
				})

				-- Bounding Box
				Header:Toggle({
					Name = "Bounding Box",
					Description = "enables bounding box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Box = value

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
							ESPTarg.BoxColor[1], ESPTarg.BoxColor[2] = color, 1 - transparency
							ESPTarg.BoxOutlineColor[2] = 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Box Fill
				Header:Toggle({
					Name = "Box Fill",
					Description = "enables box fill ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.BoxFill = value

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
							ESPTarg.BoxFillColor[1], ESPTarg.BoxFillColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Corner Box
				Header:Toggle({
					Name = "Corner Box",
					Description = "enables corner box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.CornerBox = value

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
							ESPTarg.CornerBoxColor[1], ESPTarg.CornerBoxColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				Header:Toggle({
					Name = "3D Bounding Box",
					Description = "enables 3d bounding box ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Box3d = value

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
							ESPTarg.Box3dColor[1], ESPTarg.Box3dColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Chams
				Header:Toggle({
					Name = "Chams",
					Description = "enables player chams ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Chams = value
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
							ESPTarg.ChamsFillColor[1], ESPTarg.ChamsFillColor[2] = color, transparency

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
							ESPTarg.ChamsOutlineColor[1], ESPTarg.ChamsOutlineColor[2] = color, transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Tracers
				Header:Toggle({
					Name = "Tracers",
					Description = "enables tracers ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Tracer = value
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
							ESPTarg.TracerColor[1], ESPTarg.TracerColor[2] = color, 1 - transparency
							ESPTarg.TracerOutlineColor[2] = 1 - transparency

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
						ESPTarg.TracerOrigin = value[1]
					end,
				})

				-- Health Bars
				Header:Toggle({
					Name = "Health Bar",
					Description = "enables health bar ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.HealthBar = value

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
							ESPTarg.HealthyColor = color

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
							ESPTarg.DyingColor = color

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Off Screen Arrows
				Header:Toggle({
					Name = "Off Screen Arrows",
					Description = "enables off screen arrow ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.OffScreenArrow = value
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
							ESPTarg.OffScreenArrowColor[1], ESPTarg.OffScreenArrowColor[2] = color, 1 - transparency
							ESPTarg.OffScreenArrowOutlineColor[2] = 1 - transparency

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
						ESPShared.OffScreenArrowSize = value
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
						ESPShared.OffScreenArrowRadius = value
					end,
				})

				-- Name Text
				Header:Toggle({
					Name = "Name",
					Description = "enables name text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Name = value

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
							ESPTarg.NameColor[1], ESPTarg.NameColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Distance Text
				Header:Toggle({
					Name = "Distance",
					Description = "enables distance text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Distance = value

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
							ESPTarg.DistanceColor[1], ESPTarg.DistanceColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Weapon Text
				Header:Toggle({
					Name = "Weapon",
					Description = "enables weapon text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.Weapon = value

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
							ESPTarg.WeaponColor[1], ESPTarg.WeaponColor[2] = color, 1 - transparency

							UpdateVisualPreview(ESPTarg)
						end,
					})

				-- Health Text
				Header:Toggle({
					Name = "Health",
					Description = "enables health text ESP",
					State = false,
					Callback = function(self, value)
						ESPTarg.HealthText = value

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
							ESPTarg.HealthTextColor[1], ESPTarg.HealthTextColor[2] = color, 1 - transparency

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
	Tabs.Legit:Select()

	ESP.Load()
	Aiming.Load()

	Interface:Notification({
		Title = `RIOT V2 - {self.Name} | getriot.cc`,
		Description = `RIOT V2 Loaded!`,
		Lifetime = 5,
	})
end
