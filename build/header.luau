--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/RIOTV2

    @name RIOT V2
    @author Proton Utilities

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local Self = [=====[
    local Resolution = game:GetService("GuiService"):GetScreenResolution()

    local Loading = Drawing.new("Text")
    Loading.Text = "Loading RIOT - Waiting on game..."
    Loading.Size = 30
    Loading.Color = Color3.fromRGB(255, 80, 0)
    Loading.Center = true
    Loading.Outline = true
    Loading.Position = Vector2.new(300, 300)
    Loading.Visible = true
    Loading.Font = 1
    Loading.Position = Vector2.new(Resolution.X / 2, Resolution.Y / 2)

    repeat
        task.wait()
    until game:IsLoaded()

    local ROA_Id = {
        UniverseId = {
            113491250,
            2132866904,
        },
    }

    local Push = function(File)
        local Actor = getactors and getactors()[1]

        if
            Actor and (ROA_Id.PlaceId and table.find(ROA_Id.PlaceId, game.PlaceId))
            or (ROA_Id.UniverseId and table.find(ROA_Id.UniverseId, game.GameId))
        then
            return run_on_actor(Actor, File)
        else
            return loadstring(File)()
        end
    end

    Push([====[
            getgenv().RIOT = {
                BUILD = __COMPOSER : INSERT 'GET BUILD_TYPE',
                VERSION = __COMPOSER : INSERT 'GET BUILD_VERSION' or 'v0.0.0'
            }

            __COMPOSER : INSERT 'GET BUILD'
        ]====])

    Loading.Text = "RIOT Loaded!"
    Loading.Color = Color3.fromRGB(0, 255, 0)
    
    task.delay(1, function()
        Loading:Remove()
    end)
]=====]

loadstring(Self)()
if queue_on_teleport then
    queue_on_teleport(Self)
end