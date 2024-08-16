local QBCore = exports['qb-core']:GetCoreObject()

--#region 注册服务器事件
RegisterServerEvent('qb-moonshiner:server:setupmoonshine') --安装私酒工作台
RegisterServerEvent('qb-moonshiner:server:givemoonshine') --酿酒服务器事件
-- RegisterServerEvent('qb-moonshiner:server:sellitem') --贩卖私酒
RegisterServerEvent('qb-moonshiner:server:startsmoke') --广播生成烟雾事件
--#endregion    

AddEventHandler('qb-moonshiner:server:startsmoke', function(coords)
    local src = source
    TriggerClientEvent('qb-moonshiner:client:startsmoke', -1, coords)
end)
