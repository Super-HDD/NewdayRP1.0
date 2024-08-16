local QBCore = exports['qb-core']:GetCoreObject()

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("pocketmirror", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName("pocketmirror") ~= nil then
        -- Trigger the server-side event to start the camera
        TriggerClientEvent("mirror:startCameraEvent", src)
    else
        print("Player does not have the pocketmirror item.")
    end
end)