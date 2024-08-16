local QBCore = exports['qb-core']:GetCoreObject()


--#region 本地函数
local function updateCash(src)
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMoney('cash', Player.Functions.GetItemByName('cash').amount,'update')
end
--#endregion

--#region 导出函数
exports('UpdateCash',function(src)
    updateCash(src)
end)

exports('RemoveMoney',function(PlayerData,Amount,Reason)
    if PlayerData.money['cash'] >= Amount then
        local Player=QBCore.Functions.GetPlayer(PlayerData.source)
        Player.Functions.RemoveItem('cash', Amount)
        Player.Functions.SetMoney('cash',PlayerData.money['cash']-Amount,Reason)
    end
    TriggerClientEvent('qb-inventory:client:closeinv',PlayerData.source)
end)

exports('AddMoney',function(PlayerData, Amount, Reason)
    local Player=QBCore.Functions.GetPlayer(PlayerData.source)
    Player.Functions.SetMoney('cash',PlayerData.money['cash']+Amount,Reason)
    Player.Functions.AddItem('cash', Amount,Player.Functions.GetItemByName('cash').slot)
    TriggerClientEvent('qb-inventory:client:closeinv',PlayerData.source)
end)
--#endregion
    

