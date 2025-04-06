--!nocheck
--!nolint LocalUnused

return function(gameName)
	--// Imports
	local Functions = require("core/functions.luau");
	local UI = require("core/ui.luau");	
	local ESP = require("modules/esp.luau");
	local Aiming = require("modules/aiming.luau"); 

	--// Variables
	local ESPEnemy = ESP.team.enemy; 	
	local ESPFriendly = ESP.team.friendly;	

	local AimbotSettings = Aiming.Aimbot; 
	local TriggerbotSettings = Aiming.Triggerbot;
	local FOVSettings = Aiming.FOVSettings; 

	--// Methods
	local GetService = Functions.SecureService	

	--// UI Begin
	local Main = UI:TabsWindow({
		Title = `RIOT V2 | {gameName} - getriot.cc`,
		Size = UDim2.new(0, 350, 0, 550),
		Position = UDim2.new(0.5, 0, 0, 70)
	})

	local Tabs = {
		Combat = Main:CreateTab({
			Name = "Combat"
		}),
		Visuals = Main:CreateTab({
			Name = "Visuals"
		}),
		Settings = Main:CreateTab({
			Name = "Settings"
		})
	}

	--[[ AIMING ]]--
	local AimingTabSelector = Tabs.Combat:TabSelector({Size = UDim2.new(1, 0, 0, 310)})

	-- Aimbot Tab
	local AimbotTab = AimingTabSelector:CreateTab({ Name = "Aimbot" })

	local ActiveLabel
	local ActiveLabelStates = {
		[true] = 'Active: <font color="rgb(40, 240, 10)">true</font>',
		[false] = 'Active: <font color="rgb(240, 40, 10)">false</font>'
	}

	local AimbotToggle = AimbotTab:Checkbox({
		Label = "Enabled", Value = false,
		Callback = function(self, Value)
			AimbotSettings.Enabled = Value
			if ActiveLabel and ActiveLabel.Text == ActiveLabelStates[true] and not Value then
				ActiveLabel.Text = ActiveLabelStates[false]
			end
		end
	})

	ActiveLabel = AimbotTab:Label({ RichText = true, Text = ActiveLabelStates[false] })
	AimbotSettings.AutoStateLabel = function(State)
		if AimbotToggle.Value then
			ActiveLabel.Text = ActiveLabelStates[State]
		end
	end

	local LockedLabel = AimbotTab:Label({ RichText = true, Text = 'Target: <font color="rgb(240, 40, 10)">none</font>' })
	AimbotSettings.AutoLockedLabel = function(Player)
		LockedLabel.Text = Player and string.format('Target: <font color="rgb(40, 240, 10)">%q</font>', Player.Name) or 'Target: <font color="rgb(240, 40, 10)">None</font>'
	end

	local CamSmoother, MouseSmoother
	AimbotTab:Combo({
		Selected = "Camera", Label = "Lock Mode", Items = {"Camera", "Mouse"},
		Callback = function(self, Value)
			AimbotSettings.LockMode = ({ Camera = 1, Mouse = 2 })[Value]
			if CamSmoother and MouseSmoother then
				CamSmoother:SetDisabled(Value ~= "Camera")
				MouseSmoother:SetDisabled(Value ~= "Mouse")
			end
		end
	})

	AimbotTab:Keybind({
		Label = "Trigger Keybind", Value = Enum.KeyCode.E,
		OnKeybindSet = function(self, KeyCode)
			AimbotSettings.TriggerKey = KeyCode
		end
	})

	for _, setting in ipairs({
		{ "Toggle Activation", "ToggleTrigger", nil },
		{ "Team Check", "TeamCheck", true },
		{ "Alive Check", "AliveCheck", true }
	}) do
		AimbotTab:Checkbox({
			Label = setting[1], Value = setting[3],
			Callback = function(self, Value)
				AimbotSettings[setting[2]] = Value
			end
		})
	end

	AimbotTab:Combo({
		Label = "Wall Check",
		Selected = "Always On",
		Items = {
			"Off",
			"Sticky",
			"Always On"
		},
		Callback = function(self, Value)
			local Index = table.find(self.Items, Value)
			if Index then
				AimbotSettings.WallCheck = Index
			end
		end
	})

	AimbotTab:Combo({
		Selected = "Head", Label = "Aiming Bone", Items = {"Head", "Torso"},
		Callback = function(self, Value)
			AimbotSettings.LockPart = Value
		end
	})

	CamSmoother = AimbotTab:SliderFloat({
		Label = "Smoothing (Camera)", Minimum = 0.0, Maximum = 1.0, Value = 0.0,
		Format = "Smoothing = %.3f",
		Callback = function(self, Value)
			AimbotSettings.Sensitivity = Value
		end
	})

	MouseSmoother = AimbotTab:SliderFloat({
		Label = "Smoothing (Mouse)", Minimum = 1.0, Maximum = 20.0, Value = 1.0,
		Format = "Smoothing = %.1f",
		Callback = function(self, Value)
			AimbotSettings.Sensitivity2 = Value
		end
	}); MouseSmoother:SetDisabled(true)

	-- Triggerbot Tab
	local TriggerbotTab = AimingTabSelector:CreateTab({ Name = "Triggerbot" })

	TriggerbotTab:Checkbox({
		Label = "Enabled", Value = false,
		Callback = function(self, Value)
			TriggerbotSettings.Enabled = Value
		end
	})

	local TargetLabel = TriggerbotTab:Label({ RichText = true, Text = 'Trigger Target: <font color="rgb(240, 40, 10)">none</font>' })
	TriggerbotSettings.TargetChanged = function(Target: Player)
		if not Target then
			TargetLabel.Text = 'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'
		else
			TargetLabel.Text = `Trigger Target: <font color="rgb(40, 240, 10)">{Target.Name}</font>`
		end
	end

	for _, setting in ipairs({
		{ "Team Check", "TeamCheck", true },
		{ "Alive Check", "AliveCheck", true }
	}) do
		TriggerbotTab:Checkbox({
			Label = setting[1], Value = setting[3],
			Callback = function(self, Value)
				TriggerbotSettings[setting[2]] = Value
			end
		})
	end

	TriggerbotTab:InputInt({
		Label = "Trigger Delay (ms)", 
		Value = 0, 
		Minimum = 0, 
		Increment = 25,
		Callback = function(self, Value)
			TriggerbotSettings.Delay = Value / 1000
		end
	})

	-- FOV Settings
	Tabs.Combat:Separator({Text = "FOV Settings"})
	for _, setting in ipairs({
		{ "Enabled", "Enabled", true },
		{ "Visible", "Visible", true }
	}) do
		Tabs.Combat:Checkbox({
			Label = setting[1], Value = setting[3],
			Callback = function(self, Value)
				FOVSettings[setting[2]] = Value
			end
		})
	end

	for _, setting in ipairs({
		{ "Radius", "Radius", 0, 500, 120, "%.0f" },
		{ "Circle Sides", "NumSides", 3, 80, 25, "%.0f" },
		{ "Transparency", "Transparency", 0.0, 1.0, 0, "%.3f" }
	}) do
		Tabs.Combat:SliderFloat({
			Label = setting[1], Minimum = setting[3], Maximum = setting[4], Value = setting[5],
			Format = setting[1] .. " = " .. setting[6],
			Callback = function(self, Value)
				FOVSettings[setting[2]] = Value
			end
		})
	end

	for _, setting in ipairs({
		{ "Color", "Color", Color3.fromRGB(240, 40, 10) },
		{ "Color (Locked)", "LockedColor", Color3.fromRGB(40, 240, 10) }
	}) do
		Tabs.Combat:DragColor3({
			Label = setting[1], Value = setting[3],
			Callback = function(self, Value)
				FOVSettings[setting[2]] = Value
				
			end
		})
	end

	--[[ VISUALS ]]--
	-- Shared Settings
	Tabs.Visuals:Separator({Text = "Shared Settings"})

	local DistanceLimit = nil;
	local LimitDistance = Tabs.Visuals:Checkbox({
		Label = "Limit Distance",
		Value = false,
		Callback = function(self, Value)
			ESP.shared.limitDistance = Value;
			if DistanceLimit then
				DistanceLimit:SetDisabled(not Value)
			end
		end
	})

	DistanceLimit = Tabs.Visuals:SliderFloat({
		Label = "Limit", 
		Minimum = 1, 
		Maximum = 500,
		Value = 150,
		Format = "Distance Limit = %.0f",
		Callback = function(self, Value)
			ESP.shared.maxDistance = Value
		end
	}); DistanceLimit:SetDisabled(not LimitDistance.Value)

	-- ESP
	Tabs.Visuals:Separator({Text = "ESP"})

	local ESPTabs = Tabs.Visuals:TabSelector({Size = UDim2.new(1, 0, 0, 400)})

	local function insertSets(ESPTarg, Header)
		Header:Checkbox({
			Label = "Enabled",
			Value = false,
			Callback = function(self, Value)
				ESPTarg.enabled = Value
			end
		})
		
		Header:Separator({Text = "Boxes"})
		
		-- Boxes
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.box = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(77, 92, 143),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.boxColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.boxColor[2] = 1-Value
				ESPTarg.boxOutlineColor[2] = 1-Value
			end
		})

		Header:Separator({Text = "3D Boxes"})
		
		-- 3D Boxes
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.box3d = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(155, 205, 255),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.box3dColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.box3dColor[2] = 1-Value
			end
		})
		
		Header:Separator({Text = "Box Fill"})
		
		-- Box Fill
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.boxFill = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(0, 0, 0),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.boxFillColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0.2,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.boxFillColor[2] = Value
			end
		})

		Header:Separator({Text = "Chams"})

		-- Chams
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.chams = Value
			end
		})
		Header:Checkbox({
			Label = "Always On Top",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.chamsVisibleOnly = not Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(100, 120, 250),
			Label = "Color (Fill)",
			Callback = function(self, Value)
				ESPTarg.chamsFillColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency (Fill)", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0.8,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.chamsFillColor[2] = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(25, 85, 255),
			Label = "Color (Outline)",
			Callback = function(self, Value)
				ESPTarg.chamsOutlineColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency (Outline)", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0.5,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.chamsOutlineColor[2] = Value
			end
		})
		
		Header:Separator({Text = "Tracers"})
		
		-- Tracers
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.tracer = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(77, 92, 143),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.tracerColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.tracerColor[2] = 1-Value
				ESPTarg.tracerOutlineColor[2] = 1-Value
			end
		})
		Header:Combo({
			Selected = "Top",
			Label = "Tracer Origin",
			Items = {
				"Top",
				"Middle",
				"Bottom",
				"Mouse"
			},
			Callback = function(self, Value)
				ESPTarg.tracerOrigin = Value
			end,
		})
		
		Header:Separator({Text = "Health Bars"})
		
		-- Health Bars
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.healthBar = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(58, 161, 47),
			Label = "Healthy Color",
			Callback = function(self, Value)
				ESPTarg.healthyColor = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(161, 47, 47),
			Label = "Dying Color",
			Callback = function(self, Value)
				ESPTarg.dyingColor = Value
			end
		})
		
		Header:Separator({Text = "Off Screen Arrows"})
		
		-- Off Screen Arrows
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.offScreenArrow = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(255, 255, 255),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.offScreenArrowColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.offScreenArrowColor[2] = 1-Value
				ESPTarg.offScreenArrowOutlineColor[2] = 1-Value
			end
		})
		Header:SliderInt({
			Label = "Size",
			Value = 15,
			Minimum = 1,
			Maximum = 50,
			Callback = function(self, Value)
				ESPTarg.offScreenArrowSize = Value
			end
		})
		Header:SliderInt({
			Label = "Radius",
			Value = 150,
			Minimum = 1,
			Maximum = 800,
			Callback = function(self, Value)
				ESPTarg.offScreenArrowRadius = Value
			end
		})

		Header:Separator({Text = "Names"})
		
		-- Names
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.name = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(221, 215, 148),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.nameColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.nameColor[2] = 1-Value
			end
		})
		
		Header:Separator({Text = "Distance Text"})
		
		-- Distance Text
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.distance = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(221, 215, 148),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.distanceColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.distanceColor[2] = 1-Value
			end
		})
		
		Header:Separator({Text = "Weapon Text"})
		
		-- Weapon Text
		Header:Checkbox({
			Label = "Weapon Text",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.weapon = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(200, 173, 182),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.weaponColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.weaponColor[2] = 1-Value
			end
		})
		
		Header:Separator({Text = "Health Text"})
		
		-- Health Text
		Header:Checkbox({
			Label = "Health Text",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.healthText = Value
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(200, 173, 182),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.healthTextColor[1] = Value
			end
		})
		Header:SliderFloat({
			Label = "Transparency", 
			Minimum = 0.0, 
			Maximum = 1.0,
			Value = 0,
			Format = "Transparency = %.3f",
			Callback = function(self, Value)
				ESPTarg.healthTextColor[2] = 1-Value
			end
		})
	end

	local Enemy = ESPTabs:CreateTab({
		Name="Enemy",
	}); insertSets(ESPEnemy, Enemy)

	local Friendly = ESPTabs:CreateTab({
		Name="Friendly",
	}); insertSets(ESPFriendly, Friendly)

	--[[ SETTINGS ]]--
	Tabs.Settings:Keybind({
		Label = "Menu Keybind",
		Value = Enum.KeyCode.Home,
		IgnoreGameProcessed = false,
		Callback = function(self, KeyCode)
			Main:SetVisible(not Main.Visible)
		end,
	})

	--// Initialize
	ESP.Load()
	--[[Aiming.Triggerbot.Bones = {
		"Head", "HumanoidRootPart", -- Both
		"Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg", -- R6
		"UpperTorso", "LowerTorso", "RightUpperArm", "LeftUpperArm", "RightLowerArm", "LeftLowerArm", "RightHand", "LeftHand", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg", "RightFoot", "LeftFoot" -- R15
	}]]
	Aiming.Load()
end