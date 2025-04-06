--!nocheck
--!nolint LocalUnused

return function(self)
    --// Imports
    local Functions = require("core/functions.luau");
    local UIManager = require("core/linoriaManager.luau");
    local UI = UIManager.GetUI();
    local UISaveManager = UIManager.GetSaveManager();
    local UIThemeManager = UIManager.GetThemeManager();

    local Esp = require("modules/esp.luau");
	local Aiming = require("modules/aiming.luau");

    --// Variables
    local Options = getgenv().Options
    local Toggles = getgenv().Toggles
    
    local ESPShared = Esp.shared;
    local ESPTeam = Esp.team;
	local ESPEnemy = ESPTeam.enemy; 	
	local ESPFriendly = ESPTeam.friendly;	

	local AimbotSettings = Aiming.Aimbot; 
	local TriggerbotSettings = Aiming.Triggerbot;
	local FOVSettings = Aiming.FOVSettings; 

	--// Methods
	local GetService = Functions.SecureService;

    --// References
    local Stats: Stats = GetService("Stats")
    local RunService: RunService = GetService("RunService")

    --// UI Start
    local Window = UI:CreateWindow({
        Title = `RIOT V2 | {self.Name} - getriot.cc`,
        Center = true,
        AutoShow = true,
        TabPadding = 5,
        MenuFadeTime = 0.1,
    })

    local Tabs = {
        Combat = Window:AddTab("Combat"),
        Visuals = Window:AddTab("Visuals"),
        Settings = Window:AddTab("Settings"),
    }

    -- [[ COMBAT TAB ]] --
    do
        local Sections = {
            Aimbot = Tabs.Combat:AddGroupbox({ Side = 1; Name = "Aimbot"; });
        }
        
        -- Aimbot Section
        Sections.Aimbot:AddToggle('AimbotEnabled', {
            Text = 'Enabled',
            Default = false,
            Callback = function(Value)
                AimbotSettings.Enabled = Value
            end
        }):AddKeyPicker('AimbotEnabledKeybind', {
            Default = "MB2",
            Mode = "Hold",
            Text = "Aimbot",
            NoUI = false,
            Callback = function(Value)
                AimbotSettings.SetState(Value)
            end
        })

        Sections.Aimbot:AddDropdown('AimbotLockMethod', {
            Values = { 'Camera', 'Mouse' },
            Default = 1,
            Multi = false,
        
            Text = 'Lock Method',
            Tooltip = 'Camera: Orients your camera to face the player | Mouse: Moves your mouse to the player',
        
            Callback = function(Value)
                AimbotSettings.LockMode = ({ Camera = 1, Mouse = 2 })[Value]
            end
        })

        Sections.Aimbot:AddSlider('AimbotSmoothingCamera', { 
            Text = 'Smoothing (Camera)', 
            Tooltip = "Smoothing for the Camera lock method",
            Default = 0, 
            Min = 0, 
            Max = 0.5, 
            Rounding = 3,
            Callback = function(Value)
                AimbotSettings.Sensitivity = Value
            end
        });
        Sections.Aimbot:AddSlider('AimbotSmoothingMouse', { 
            Text = 'Smoothing (Mouse)', 
            Tooltip = "Smoothing for the Mouse lock method",
            Default = 1, 
            Min = 1, 
            Max = 20, 
            Rounding = 1,
            Callback = function(Value)
                AimbotSettings.Sensitivity2 = Value
            end
        });

        Sections.Aimbot:AddDropdown('AimbotWallCheckMode', {
            Values = { "Off", "Sticky", "Always On" },
            Default = 3,
            Multi = false,
        
            Text = 'Wall Check',
        
            Callback = function(Value)
                local Index = table.find(Options.AimbotWallCheckMode.Values, Value)
                if Index then
                    AimbotSettings.WallCheck = Index
                end
            end
        })

        Sections.Aimbot:AddDropdown('AimbotAimingBone', {
            Values = { "Head", "Torso" },
            Default = 1,
            Multi = false,
        
            Text = 'Lock Bone',
            Tooltip = "The bone aimbot locks to",
        
            Callback = function(Value)
                AimbotSettings.LockPart = Value
            end
        })

        Sections.Aimbot:AddDivider()

        Sections.Aimbot:AddToggle('AimbotFOVEnabled', {
            Text = 'FOV Enabled',
            Default = true,
            Callback = function(Value)
                FOVSettings.Enabled = Value
            end
        })

        Sections.Aimbot:AddToggle('AimbotFOVVisible', {
            Text = 'FOV Visible',
            Default = true,
            Callback = function(Value)
                FOVSettings.Visible = Value
            end
        }):AddColorPicker('AimbotFOVLockedColor', {
            Default = Color3.new(0, 1, 0),
            Title = 'Locked color',
        
            Callback = function(Value)
                FOVSettings.LockedColor = Value
            end
        }):AddColorPicker('AimbotFOVUnlockedColor', {
            Default = Color3.new(1, 0, 0),
            Title = 'Unlocked color',
        
            Callback = function(Value)
                FOVSettings.Color = Value
            end
        })

        Sections.Aimbot:AddSlider('AimbotFOVCirclePoints', { 
            Text = 'FOV Circle Points', 
            Tooltip = "The amount of points the circle is made of",
            Default = 60, 
            Min = 3, 
            Max = 60,
            Rounding = 0,
            Callback = function(Value)
                FOVSettings.NumSides = Value
            end
        });

        Sections.Aimbot:AddSlider('AimbotFOVCircleTransparency', { 
            Text = 'FOV Circle Transparency', 
            Tooltip = "The transparency of the circle",
            Default = 0, 
            Min = 0, 
            Max = 1,
            Rounding = 3,
            Callback = function(Value)
                FOVSettings.Transparency = Value
            end
        });
    end

     -- [[ SETTINGS TAB ]] --
    do
        local Sections = {
            Menu = Tabs.Settings:AddGroupbox({ Side = 1; Name = "Menu"; });
        }

        -- Menu Section
        Sections.Menu:AddButton('Unload', function() UI:Unload() end)
        Sections.Menu:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
    end

    --// UI Initialize
    local FrameTimer = tick()
    local FrameCounter = 0
    local FPS = 60

    local WatermarkConnection = RunService.RenderStepped:Connect(function()
        FrameCounter += 1

        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter
            FrameTimer = tick()
            FrameCounter = 0
        end

        UI:SetWatermark(`RIOT V2 | framerate: {math.floor(FPS)} fps | rtt: {math.round(Stats.Network.ServerStatsItem['Data Ping']:GetValue())}ms`)
    end)

    local function sendCB(table: {})
        for i, v in pairs(table) do
            if v.Callback then
                if v.Type == "KeyPicker" then
                    v.Challback(false)
                elseif v.Value then
                    v.Callback(v.Value)
                end
            end
        end
    end
    sendCB(Toggles)
    sendCB(Options)

    Esp.Load()
	Aiming.Load()

    UI.KeybindFrame.Visible = true;
    UI.ToggleKeybind = Options.MenuKeybind

    UI:SetWatermarkVisibility(true)

    UIThemeManager:SetLibrary(UI)
    UISaveManager:SetLibrary(UI)

    UISaveManager:IgnoreThemeSettings()
    UISaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

    UIThemeManager:SetFolder(`RIOTV2`)
    UISaveManager:SetFolder(`RIOTV2/{self.Name}`)

    UISaveManager:BuildConfigSection(Tabs.Settings)
    UIThemeManager:ApplyToTab(Tabs.Settings)

    UISaveManager:LoadAutoloadConfig()

    UI:OnUnload(function()
        WatermarkConnection:Disconnect()
    end)
end