local QBCore = exports['qb-core']:GetCoreObject()
local isBusy = false

WaterOutlet = {
    -40350080, -- p_waterpump01x
    -717759843, -- p_wellpumpnbx01x
}

exports['qb-target']:AddTargetModel(WaterOutlet, {
    options = {
        {
            type = "client",
            event = 'qb-waterpump:client:drinking',
            icon = "far fa-eye",
            label = Lang:t('label.take_a_drink'),
            distance = 2.0
        }
    }
})

-- waterpump drink water
RegisterNetEvent('qb-waterpump:client:drinking', function()
    if isBusy then
        return
    else
        isBusy = not isBusy
        local ped = PlayerPedId()
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        if not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) then
            TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_DRINK_FLASK'), -1, true, false, false, false)
        end
        Wait(5000)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(25, 50))
        ClearPedTasks(ped)
        isBusy = not isBusy
    end
end)
