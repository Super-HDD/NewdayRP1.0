local QBCore = exports['qb-core']:GetCoreObject()

local DoorInfo	= {}

QBCore.Functions.CreateUseableItem('keys_container', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('ndrp-doorlock:client:open-keys-container-menu',src,item)
    end
end)

RegisterServerEvent('qb-doorlock:updatedoorsv')
AddEventHandler('qb-doorlock:updatedoorsv', function(doorID, state, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not IsAuthorized(Player.PlayerData.job.name, Config.DoorList[doorID]) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nokey"), 'error')
            return
        else
            TriggerClientEvent('qb-doorlock:changedoor', src, doorID, state)
        end
end)

RegisterServerEvent('qb-doorlock:updateState')
AddEventHandler('qb-doorlock:updateState', function(doorID, state, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if type(doorID) ~= 'number' then
            return
        end
        if IsAuthorized(Player.PlayerData.job.name, Config.DoorList[doorID]) or CheckKeys(doorID) then
            DoorInfo[doorID] = {}
            TriggerClientEvent('qb-doorlock:setState', -1, doorID, state)
        end

end)

function IsAuthorized(jobName, doorID)
    for _,job in pairs(doorID.authorizedJobs) do
        if job == jobName then
            return true
        end
    end
    return false
end

function CheckKeys(doorID)
    local src =source
    local player = QBCore.Functions.GetPlayer(src)
    local keys=player.Functions.GetItemsByName('key')
    for i=1,#keys do
        if keys[i].info.doorID==doorID then
            return true
        end
    end
    return false
end
