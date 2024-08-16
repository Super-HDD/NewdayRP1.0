local QBCore = exports['qb-core']:GetCoreObject()

local collecting = false

---------------------------------------------------------------------------------

-- collect water
CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.WaterProps, {
        options = {
            {
                type = "client",
                event = 'qb-farmer:client:collectwater',
                icon = "far fa-eye",
                label = Lang:t('text.collect_water'),
                distance = 2.0
            }
        }
    })
end)

---------------------------------------------------------------------------------

-- collect poo
CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.FertilizerProps, {
        options = {
            {
                type = "client",
                event = 'qb-farmer:client:collectpoo',
                icon = "far fa-eye",
                label = Lang:t('text.pickup_poo'),
                distance = 2.0
            }
        }
    })
end)

---------------------------------------------------------------------------------

-- do collecting water
RegisterNetEvent('qb-farmer:client:collectwater')
AddEventHandler('qb-farmer:client:collectwater', function()
    if collecting then return end

    local hasItem = QBCore.Functions.HasItem('bucket', 1)
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name

    -- Job required
    if Config.EnableJob and PlayerJob ~= Config.JobRequired and LocalPlayer.state.isLoggedIn then
        QBCore.Functions.Notify( Lang:t('error.only_farmers_can_collect_water'), 'error', 3000)
        return
    end

    if not hasItem then
        QBCore.Functions.Notify(Lang:t('error.you_need_bucket_collect_water'), 'error', 3000)
        return
    end

    collecting = true

    QBCore.Functions.Progressbar("collecting-water", Lang:t('progressbar.collecting_water'), Config.CollectWaterTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-farmer:server:giveitem', 'water', 1)
        QBCore.Functions.Notify(Lang:t('success.youve_got_bucketful_water'), 'success', 3000)

        collecting = false
    end)
end)

-- do collecting poo
RegisterNetEvent('qb-farmer:client:collectpoo')
AddEventHandler('qb-farmer:client:collectpoo', function()
    if collecting then return end

    local hasItem = QBCore.Functions.HasItem('bucket', 1)
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name

    -- Job required
    if Config.EnableJob and PlayerJob ~= Config.JobRequired and LocalPlayer.state.isLoggedIn then
        QBCore.Functions.Notify(Lang:t('error.only_farmers_can_collect_poo'), 'error', 3000)

        return
    end

    if not hasItem then
        QBCore.Functions.Notify(Lang:t('error.you_need_a_bucket_collect_fertilizer'), 'error', 3000)

        return
    end

    local ped = PlayerPedId()
    collecting = true
    local pooObject = nil
    local coords = nil

    FreezeEntityPosition(ped, true)

    for i = 1, #Config.FertilizerProps do
        local obj = Config.FertilizerProps[i]
        local pos = GetEntityCoords(PlayerPedId())
        local poo = GetClosestObjectOfType(pos, 2.5, obj, false, false, false)

        if poo and poo ~= 0 then
            pooObject = poo
            coords = GetEntityCoords(pooObject)

            if coords then break end
        end
    end

    QBCore.Functions.Progressbar("collecting-poo", Lang:t('progressbar.collecting_poo'), Config.CollectPooTime, false, true,
    {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if coords then
            QBCore.Functions.TriggerCallback('qb-farmer:server:CheckCollectedPoop', function(exists)
                if not exists then
                    DeleteEntity(pooObject)
                    SetObjectAsNoLongerNeeded(pooObject)

                    TriggerServerEvent('qb-farmer:server:CollectedPoop', coords)
                    TriggerServerEvent('qb-farmer:server:giveitem', 'fertilizer', 1)

                    QBCore.Functions.Notify(Lang:t('success.youve_got_bucketful_fertilizer'), 'success', 3000)
                else
                    DeleteEntity(pooObject)
                    SetObjectAsNoLongerNeeded(pooObject)

                    QBCore.Functions.Notify('Already taken by you or someone else previously!', 'error', 3000)
                end
            end, coords)
        end

        collecting = false

        FreezeEntityPosition(ped, false)
    end)
end)

---------------------------------------------------------------------------------