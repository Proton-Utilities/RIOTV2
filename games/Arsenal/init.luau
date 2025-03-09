--!nocheck

local file = {}

--// Modules
local Functions = require("core/functions.luau"); 	GetService 	= Functions.SecureService
local UI 		= require("core/ui.luau"); 			UIName	 	= "RIOT V2";
local ESP 		= require("modules/esp.luau"); 		ESP_E 		= ESP.team.enemy; 	ESP_F 		= ESP.team.friendly;
local Aimbot 	= require("modules/aimbot.luau"); 	Aimbot_S 	= Aimbot.Settings; 	Aimbot_F 	= Aimbot.FOVSettings

function file.init(gameName)
	local Main = UI:TabsWindow({
		Title = UIName .. " | " .. gameName .. " - getriot.cc",
		Size = UDim2.new(0, 350, 0, 550),
		Position = UDim2.new(0.5, 0, 0, 70)
	})

	local Log = nil
	local LogStates = {
		Success = `<font color="rgb(40, 240, 10)">[Success]</font>`,
		Init = `<font color="rgb(240, 140, 10)">[Init]</font>`,
		Info = `<font color="rgb(10, 140, 240)">[Info]</font>`,
	}

	local Tabs = {
		Console = Main:CreateTab({
			Name = "Console"
		}),
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

	--[[ CONSOLE ]]--
	Log = Tabs.Console:Console({
		Value = LogStates.Init .. " UI Initialized",
		ReadOnly = true,
		AutoScroll = true,
		RichText = true,
		MaxLines = 250,
		Size = UDim2.new(1, 0, 0, 480)
	}); local consPrint = function(...) return Log:AppendText(...)  end

	--[[ AIMING ]]--
	local AimingTabSelector = Tabs.Combat:TabSelector({Size = UDim2.new(1, 0, 0, 500)})
	local AimbotTab = AimingTabSelector:CreateTab({
		Name="Aimbot",
	})
	AimbotTab:Separator({Text = "Aimbot Settings"})

	-- Aimbot Settings
	local ActiveLabel = nil
	local ActiveLabelStates = {
		[true] = 'Active: <font color="rgb(40, 240, 10)">true</font>',
		[false] = 'Active: <font color="rgb(240, 40, 10)">false</font>'
	}

	local AimbotToggle = AimbotTab:Checkbox({
		Label = "Enabled",
		Value = false,
		Callback = function(self, Value)
			Aimbot_S.Enabled = Value
			if ActiveLabel and ActiveLabel.Text == ActiveLabelStates[true] and Value == false then
				ActiveLabel.Text = ActiveLabelStates[false]
			end

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	ActiveLabel = AimbotTab:Label({
		RichText = true,
		Text = ActiveLabelStates[false]
	}); Aimbot_S.AutoStateLabel = function(State)
		if AimbotToggle.Value then
			ActiveLabel.Text = ActiveLabelStates[State]
		end
	end

	local LockedLabel = AimbotTab:Label({
		RichText = true,
		Text = 'Locked to: <font color="rgb(240, 40, 10)">none</font>'
	}); Aimbot_S.AutoLockedLabel = function(Player)
		if Player then
			LockedLabel.Text = string.format('Locked to: <font color="rgb(40, 240, 10)">%q</font>', Player.Name)
		else
			LockedLabel.Text = 'Locked to: <font color="rgb(240, 40, 10)">None</font>'
		end
	end

    local CamSmoother, MouseSmoother = nil, nil; 
	AimbotTab:Combo({
		Selected = "Camera",
		Label = "Lock Mode",
		Items = {
			"Camera",
			"Mouse"
		},
		Callback = function(self, Value)
			local lmLookup = { Camera = 1, Mouse = 2 }

			Aimbot_S.LockMode = lmLookup[Value]

			local function setSmoothers(st1, st2)
				if CamSmoother and MouseSmoother then
					CamSmoother:SetDisabled(st1)
					MouseSmoother:SetDisabled(st2)
				end
			end

			if Value == "Camera" then
				setSmoothers(false, true)
			elseif Value == "Mouse" then
				setSmoothers(true, false)
			end
			
			consPrint(LogStates.Info, self.Label, ":", Value)
		end,
	})
	
	AimbotTab:Keybind({
		Label = "Trigger Keybind",
		Value = Enum.KeyCode.E,
		IgnoreGameProcessed = false,
		OnKeybindSet = function(self, KeyCode)
			Aimbot_S.TriggerKey = KeyCode
		end,
	})

	AimbotTab:Checkbox({
		Label = "Toggle Activation",
		Value = true,
		Callback = function(self, Value)
			Aimbot_S.Toggle = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:Combo({
		Selected = "Head",
		Label = "Aiming Bone",
		Items = {
			"Head",
			"Torso"
		},
		Callback = function(self, Value)
			Aimbot_S.LockPart = Value
			
			consPrint(LogStates.Info, self.Label, ":", Value)
		end,
	})

	AimbotTab:Checkbox({
		Label = "Team Check",
		Value = true,
		Callback = function(self, Value)
			Aimbot_S.TeamCheck = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:Checkbox({
		Label = "Alive Check",
		Value = true,
		Callback = function(self, Value)
			Aimbot_S.AliveCheck = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:Checkbox({
		Label = "Wall Check",
		Value = true,
		Callback = function(self, Value)
			Aimbot_S.WallCheck = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	CamSmoother = AimbotTab:SliderFloat({
		Label = "Smoothing (Camera)", 
		Minimum = 0.0, 
		Maximum = 1.0,
		Value = 0.0,
		Format = "Smoothing = %.3f",
		Callback = function(self, Value)
			Aimbot_S.Sensitivity = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	MouseSmoother = AimbotTab:SliderFloat({
		Label = "Smoothing (Mouse)", 
		Minimum = 1.0, 
		Maximum = 20.0,
		Value = 1.0,
		Format = "Smoothing = %.1f",
		Callback = function(self, Value)
			Aimbot_S.Sensitivity2 = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})
	MouseSmoother:SetDisabled(true)

	AimbotTab:Separator({Text = "FOV Settings"})

	-- FOV Settings
	AimbotTab:Checkbox({
		Label = "Enabled",
		Value = true,
		Callback = function(self, Value)
			Aimbot_F.Enabled = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:Checkbox({
		Label = "Visible",
		Value = true,
		Callback = function(self, Value)
			Aimbot_F.Visible = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:SliderFloat({
		Label = "Radius", 
		Minimum = 0, 
		Maximum = 500,
		Value = 120,
		Format = "Radius = %.0f",
		Callback = function(self, Value)
			Aimbot_F.Radius = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:SliderFloat({
		Label = "Circle Sides", 
		Minimum = 3, 
		Maximum = 80,
		Value = 25,
		Format = "Sides = %.0f",
		Callback = function(self, Value)
			Aimbot_F.NumSides = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:SliderFloat({
		Label = "Transparency", 
		Minimum = 0.0, 
		Maximum = 1.0,
		Value = 0,
		Format = "Transparency = %.3f",
		Callback = function(self, Value)
			Aimbot_F.Transparency = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:DragColor3({
		Value = Color3.fromRGB(240, 40, 10),
		Label = "Color",
		Callback = function(self, Value)
			Aimbot_F.Color = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

	AimbotTab:DragColor3({
		Value = Color3.fromRGB(40, 240, 10),
		Label = "Color (Locked)",
		Callback = function(self, Value)
			Aimbot_F.LockedColor = Value

			consPrint(LogStates.Info, self.Label, ":", Value)
		end
	})

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

			consPrint(LogStates.Info, self.Label, ":", Value)
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

			consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Boxes"})
		
		-- Boxes
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.box = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(77, 92, 143),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.boxColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Box Fill"})
		
		-- Box Fill
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.boxFill = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(0, 0, 0),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.boxFillColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})

		Header:Separator({Text = "Chams"})

		-- Chams
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.chams = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:Checkbox({
			Label = "Always On Top",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.chamsVisibleOnly = not Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(100, 120, 250),
			Label = "Color (Fill)",
			Callback = function(self, Value)
				ESPTarg.chamsFillColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(25, 85, 255),
			Label = "Color (Outline)",
			Callback = function(self, Value)
				ESPTarg.chamsOutlineColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Tracers"})
		
		-- Tracers
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.tracer = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(77, 92, 143),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.tracerColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end,
		})
		
		Header:Separator({Text = "Health Bars"})
		
		-- Health Bars
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.healthBar = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Off Screen Arrows"})
		
		-- Off Screen Arrows
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.offScreenArrow = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(255, 255, 255),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.offScreenArrowColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:SliderInt({
			Label = "Size",
			Value = 15,
			Minimum = 1,
			Maximum = 50,
			Callback = function(self, Value)
				ESPTarg.offScreenArrowSize = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:SliderInt({
			Label = "Radius",
			Value = 150,
			Minimum = 1,
			Maximum = 800,
			Callback = function(self, Value)
				ESPTarg.offScreenArrowRadius = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})

		Header:Separator({Text = "Names"})
		
		-- Names
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.name = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(221, 215, 148),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.nameColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Distance Text"})
		
		-- Distance Text
		Header:Checkbox({
			Label = "Enabled",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.distance = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(221, 215, 148),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.distanceColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Weapon Text"})
		
		-- Weapon Text
		Header:Checkbox({
			Label = "Weapon Text",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.weapon = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(200, 173, 182),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.weaponColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		
		Header:Separator({Text = "Health Text"})
		
		-- Health Text
		Header:Checkbox({
			Label = "Health Text",
			Value = true,
			Callback = function(self, Value)
				ESPTarg.healthText = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
		Header:DragColor3({
			Value = Color3.fromRGB(200, 173, 182),
			Label = "Color",
			Callback = function(self, Value)
				ESPTarg.healthTextColor[1] = Value
		
				consPrint(LogStates.Info, self.Label, ":", Value)
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
		
				consPrint(LogStates.Info, self.Label, ":", Value)
			end
		})
	end

	local Enemy = ESPTabs:CreateTab({
		Name="Enemy",
	}); insertSets(ESP_E, Enemy)

	local Friendly = ESPTabs:CreateTab({
		Name="Friendly",
	}); insertSets(ESP_F, Friendly)
	
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
	Aimbot.Load()

	consPrint(LogStates.Success, UIName .. " loaded successfully.")
end

return file