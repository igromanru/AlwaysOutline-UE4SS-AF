--[[
    Author: Igromanru
    Date: 13.02.2025
    Mod Name: Always Outline
]]

---------- Configurations ----------

------------------------------------

------------------------------
-- Don't change code below --
------------------------------
local AFUtils = require("AFUtils.AFUtils")

ModName = "AlwaysOutline"
ModVersion = "1.0.0"
DebugMode = true

LogInfo("Starting mod initialization")

-- Hooks --
ExecuteInGameThread(function()
    LogInfo("Initializing hooks")
    -- LoadAsset("/Game/Blueprints/Widgets/Inventory/W_InventoryItemSlot.W_InventoryItemSlot_C")
    -- RegisterHook("/Game/Blueprints/Widgets/Inventory/W_InventoryItemSlot.W_InventoryItemSlot_C:OnMouseEnter", OnMouseEnter)
    LogInfo("Hooks initialized")
end)

LogInfo("Mod loaded successfully")