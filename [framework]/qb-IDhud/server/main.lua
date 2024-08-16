local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    if cashamount ~= nil then
        TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
    else
        return
    end
end)

QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    if bankamount ~= nil then
        TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
    else
        return
    end
end)

QBCore.Commands.Add('bloodmoney', 'Check Bloodmoney Balance', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local bloodmoneyamount = Player.PlayerData.money.bloodmoney
    if bloodmoneyamount ~= nil then
        TriggerClientEvent('hud:client:ShowAccounts', source, 'bloodmoney', bloodmoneyamount)
    else
        return
    end
end)

--QBCore.Commands.Add('gold', 'Check Gold Balance', {}, false, function(source, args)
 --   local Player = QBCore.Functions.GetPlayer(source)
 --   local goldamount = Player.PlayerData.money.gold
 --   if goldamount ~= nil then
 --       TriggerClientEvent('hud:client:ShowAccounts', source, 'gold', goldamount)
 --   else
 --       return
 --   end
--end)

