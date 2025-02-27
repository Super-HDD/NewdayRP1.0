local QBCore = exports['qb-core']:GetCoreObject()

local horsename = nil
local horsexp = 0
local newxp = 0
local horseid = nil

-----------------------------------------------------------------------------------

-- use horse trainer brush
QBCore.Functions.CreateUseableItem("horsetrainingbrush", function(source, item)
    local src = source

    TriggerClientEvent('qb-horsetrainer:client:brushHorse', src, item.name)
end)

-- use horse trainer carrot
QBCore.Functions.CreateUseableItem("horsetrainingcarrot", function(source, item)
    local src = source

    TriggerClientEvent('qb-horsetrainer:client:feedHorse', src, item.name)
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('qb-horsetrainer:server:updatexp',function(action)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    local expRiding = Config.RidingXpIncreaseTrainer

    local result = MySQL.query.await('SELECT * FROM player_horses WHERE citizenid = @citizenid AND active = @active',
    {
        ['@citizenid'] = cid,
        ['@active'] = 1
    })

    if result[1] then
        horsename = result[1].name
        horseid = result[1].horseid
        horsexp = result[1].horsexp
    end

    if action == 'riding' and horsexp <= Config.FullyTrained then
        newxp = horsexp + expRiding

        MySQL.update('UPDATE player_horses SET horsexp = ? WHERE horseid = ? AND active = ?', {newxp, horseid, 1})

        return
    end

    if action == 'leading' and horsexp <= Config.FullyTrained then
        newxp = horsexp + Config.LeadingXpIncrease

        MySQL.update('UPDATE player_horses SET horsexp = ? WHERE horseid = ? AND active = ?', {newxp, horseid, 1})

        if Config.TrainingEXPNotification then
            TriggerClientEvent('QBCore:Notify', src, horsename..'\'s'..Lang:t('success.xp_now')..newxp, 'success')
        end

        return
    end

    if action == 'cleaning' and horsexp <= Config.FullyTrained then
        newxp = horsexp + Config.CleaningXpIncrease

        MySQL.update('UPDATE player_horses SET horsexp = ? WHERE horseid = ? AND active = ?', {newxp, horseid, 1})

        if Config.TrainingEXPNotification then
            TriggerClientEvent('QBCore:Notify', src, horsename..'\'s'..Lang:t('success.xp_now')..newxp, 'success')
        end

        return
    end

    if action == 'feeding' and horsexp <= Config.FullyTrained then
        newxp = horsexp + Config.FeedingXpIncrease

        MySQL.update('UPDATE player_horses SET horsexp = ? WHERE horseid = ? AND active = ?', {newxp, horseid, 1})

        if Config.TrainingEXPNotification then
            TriggerClientEvent('QBCore:Notify', src, horsename..'\'s'..Lang:t('success.xp_now')..newxp, 'success')
        end

        return
    end
end)

-----------------------------------------------------------------------------------

-- remove item
RegisterNetEvent('qb-horsetrainer:server:deleteItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
end)

-----------------------------------------------------------------------------------
