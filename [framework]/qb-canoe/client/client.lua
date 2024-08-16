local QBCore = exports['qb-core']:GetCoreObject()
local boatout = false

RegisterNetEvent('qb-canoe:client:lauchcanoe')
AddEventHandler('qb-canoe:client:lauchcanoe', function()
    local hasItem = QBCore.Functions.HasItem('canoe', 1)
    if hasItem then
        if boatout == false then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x+3, coords.y+3, coords.z)
            local canLauch = false
            for k,v in pairs(Config.WaterTypes) do 
                if water == Config.WaterTypes[k]["waterhash"]  then
                    canLauch = true           
                    break            
                end
            end
            if canLauch then
                local ped = PlayerPedId()
                local canoe = `CANOE`
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.5 ))
                local heading = GetEntityHeading(ped)
                RequestModel(canoe)
                while not HasModelLoaded(canoe) do
                    Citizen.Wait(500)
                end
                activeboat = CreateVehicle(canoe, x, y, z, heading, 1, 1)
                SetVehicleOnGroundProperly(activeboat)
                SetPedIntoVehicle(ped, activeboat, -1)
                SetModelAsNoLongerNeeded(canoe)
                boatout = true
            else
                QBCore.Functions.Notify(Lang:t('error.不能在这里取出独木舟'), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t('error.独木舟已经被你放置了'), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t('error.没有物品'), 'error')
    end
end)

-- delete canoe
RegisterCommand('delcanoe', function()
    SetEntityAsMissionEntity(activeboat, true, true)
    DeleteVehicle(activeboat)
    boatout = false
end)
