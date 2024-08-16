local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ndrp-drinker:client:jiekedanni',function()
    local modelhash = GetHashKey('p_mugCoffee01x')
        RequestModel(modelhash)
        while not HasModelLoaded(modelhash) do
            Wait(10)
        end
        print('model loaded')
        local propEntity = CreateObject(modelhash, GetEntityCoords(PlayerPedId()), false, true, false, false, true)
        TaskItemInteraction_2(PlayerPedId(), GetHashKey("CONSUMABLE_COFFEE"), propEntity, GetHashKey("P_MUGCOFFEE01X_PH_R_HAND"), GetHashKey("DRINK_COFFEE_HOLD"), 1, 0, -1)
        --TaskItemInteraction_2(PlayerPedId(), -1199896558, propEntity, GetHashKey('p_glass001x_ph_r_hand'),  GetHashKey("DRINK_CHAMPAGNE_HOLD"), 1, 0, -1.0)
        while true do
            Wait(500)
            if Citizen.InvokeNative(0x6AA3DCA2C6F5EB6D, PlayerPedId()) == 1204708816 then
                TriggerEvent("qb-drink:client:add-alcohol-count",Config.Alcohol['jiekedanni'])
                TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.AddThurst)            
            end
        end
end)