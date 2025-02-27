local QBCore = exports['qb-core']:GetCoreObject()


------------------------------------------------------- COMMANDS -------------------------------------------------------


-- Admin Revive Player
QBCore.Commands.Add("revive", Lang:t('info.revive_player_a'), {{name = "id", help = Lang:t('info.player_id')}}, false, function(source, args)
    local src = source

    if not args[1] then
        TriggerClientEvent('qb-medic:client:playerRevive', src)
        TriggerClientEvent('bone:client:stop-death-timer',src)

        return
    end

    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

    if not Player then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')

        return
    end

    TriggerClientEvent('qb-medic:client:adminRevive', Player.PlayerData.source)
    TriggerClientEvent('bone:client:stop-death-timer',Player.PlayerData.source)
end, "admin")

-- Admin Kill Player
QBCore.Commands.Add("kill", Lang:t('info.kill_player'), {{name = "id", help = Lang:t('info.player_id')}}, true, function(source, args)
    local src = source
    local target = tonumber(args[1])

    local Player = QBCore.Functions.GetPlayer(target)

    if not Player then
        QBCore.Functions.Notify(src, Lang:t('error.not_online'), 'error')

        return
    end

    TriggerClientEvent('qb-medic:client:KillPlayer', Player.PlayerData.source)
end, "admin")


-------------------------------------------------------- EVENTS --------------------------------------------------------


-- Death Actions: Remove Inventory / Cash
RegisterNetEvent('qb-medic:server:deathactions', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.WipeInventoryOnRespawn then
        Player.Functions.ClearInventory()

        MySQL.Async.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })

        TriggerClientEvent('QBCore:Notify', src, 'you lost all your possessions!', 'primary')
    end

    if Config.WipeCashOnRespawn then
        Player.Functions.SetMoney('cash', 0)

        TriggerClientEvent('QBCore:Notify', src, 'you lost all your cash!', 'primary')
    end
end)

-- Set Player Health
RegisterNetEvent('qb-medic:server:SetHealth', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    amount = tonumber(amount)

    if amount < 1 then
        amount = 1
    elseif amount > Config.MaxHealth then
        amount = Config.MaxHealth
    end

    Player.Functions.SetMetaData("health", amount)
end)

-- Medic Revive Player
RegisterNetEvent('qb-medic:server:RevivePlayer', function(playerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Patient = QBCore.Functions.GetPlayer(playerId)

    if not Patient then return end

    if Player.PlayerData.job.name ~= Config.JobRequired then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_medic'), 'error')
        return
    end

    if Player.Functions.RemoveItem('firstaid', 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['firstaid'], "remove")
        TriggerClientEvent('qb-medic:client:playerRevive', Patient.PlayerData.source)
        TriggerClientEvent('bone:client:stop-death-timer',Patient.PlayerData.source)
    end
end)

-- Medic Treat Wounds
RegisterNetEvent('qb-medic:server:TreatWounds', function(playerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Patient = QBCore.Functions.GetPlayer(playerId)

    if not Patient then return end
    
    if Player.PlayerData.job.name ~= Config.JobRequired then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_medic'), 'error') 
        return
    end
    

    if Player.Functions.RemoveItem('bandage', 1) then
        
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bandage'], "remove")
        TriggerClientEvent('qb-medic:client:HealInjuries', Patient.PlayerData.source, "full")
    end
end)

-- Medic Alert
RegisterNetEvent('qb-medic:server:medicAlert', function(text)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()

    for _, v in pairs(players) do
        if v.PlayerData.job.name == 'medic' and v.PlayerData.job.onduty then
            TriggerClientEvent('qb-medic:client:medicAlert', v.PlayerData.source, coords, text)
        end
    end
end)


------------------------------------------------------ CALLBACKS -------------------------------------------------------


-- Medics On-Duty Callback
QBCore.Functions.CreateCallback('qb-medic:server:getmedics', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if v.PlayerData.job.name == Config.JobRequired and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)