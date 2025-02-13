--[[
    Author: Igromanru
    Date: 13.02.2025
    Mod Name: Always Outline
]]

-- Possible outline colors --
local None = 0
local Blue = 1 -- Cyan
local White = 2
local Red = 8
-----------------------------

---------- Configurations ----------
PlayerOutlineColor = White
------------------------------------

------------------------------
-- Don't change code below --
------------------------------
local AFUtils = require("AFUtils.AFUtils")

ModName = "AlwaysOutline"
ModVersion = "1.0.0"
DebugMode = true

LogInfo("Starting mod initialization")

---@param OutlineComponent UOutlineComponent_C
---@param Mask integer|OutlineMask
local function SetOutlineMask(OutlineComponent, Mask)
    if IsValid(OutlineComponent) and OutlineComponent.OutlineMask ~= Mask then
        OutlineComponent.OutlineMask = Mask
        OutlineComponent.ComponentEnabled = true
        OutlineComponent:UpdateHighlightedComponents()
    end
end

local function HighlightPlayers()
    local gameState = AFUtils.GetSurvivalGameState()
    if IsValid(gameState) and gameState.PlayerCharacterInGame and #gameState.PlayerCharacterInGame > 1 then
        local myPlayer = AFUtils.GetMyPlayer()
        if IsValid(myPlayer) then
            local myPlayerAddress = myPlayer:GetAddress()
            for i = 1, #gameState.PlayerCharacterInGame do
                local player = gameState.PlayerCharacterInGame[i]
                if IsValid(player) and player:GetAddress() ~= myPlayerAddress then
                    SetOutlineMask(player.OutlineComponent, PlayerOutlineColor)
                end
            end
        end
    end
end

-- Main loop
LoopAsync(500, function()
    ExecuteInGameThread(function ()
        HighlightPlayers()
    end)
    return false
end)

LogInfo("Mod loaded successfully")