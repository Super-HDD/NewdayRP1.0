local QBCore = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false
local volume = Config.DukeBoxDefaultVolume
local radius = Config.DukeBoxRadius

RegisterNetEvent('qb-saloonrodes:server:playMusic', function(song, name, zone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = zone
    local dist = #(coords - boothCoords)
    local mysong = song
    if dist > 3 then return end
    xSound:PlayUrlPos(-1, name, mysong, volume, coords)
    xSound:Distance(-1, name, radius)
    isPlaying = true
end)

RegisterNetEvent('qb-saloonrodes:server:changeVolume', function(volume, currentname, currentzone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = currentzone
    local dist = #(coords - boothCoords)
    if dist > 3 then return end
    if not tonumber(volume) then return end
    if isPlaying then
        xSound:setVolume(-1, currentname, volume)
    end
end)

RegisterNetEvent('qb-saloonrodes:server:pauseMusic', function(currentname, currentzone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = currentzone
    local dist = #(coords - boothCoords)
    if dist > 3 then return end
    if isPlaying then
        isPlaying = false
        xSound:Pause(-1, currentname)
    end
end)

RegisterNetEvent('qb-saloonrodes:server:resumeMusic', function(currentname, currentzone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = currentzone
    local dist = #(coords - boothCoords)
    if dist > 3 then return end
    if not isPlaying then
        isPlaying = true
        xSound:Resume(-1, currentname)
    end
end)

RegisterNetEvent('qb-saloonrodes:server:stopMusic', function(currentname, currentzone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = currentzone
    local dist = #(coords - boothCoords)
    if dist > 3 then return end
    if isPlaying then
        isPlaying = false
        xSound:Destroy(-1, currentname)
    end
end)





RegisterServerEvent('qb-crafting:server:juwuba')
AddEventHandler('qb-crafting:server:juwuba', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('raw_meat', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "remove")

        Player.Functions.RemoveItem('shengcai', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['shengcai'], "remove")

        Player.Functions.RemoveItem('corn', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['corn'], "remove")
       
        
        -- add items
        Player.Functions.AddItem('juwuba', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['juwuba'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 海陆空巨无霸', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:kaoquanyang')
AddEventHandler('qb-crafting:server:kaoquanyang', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('carrot', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carrot'], "remove")

        Player.Functions.RemoveItem('jungu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['jungu'], "remove")

        Player.Functions.RemoveItem('raw_meat', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "remove")
       
        
        -- add items
        Player.Functions.AddItem('kaoquanyang', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kaoquanyang'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 烤全羊', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:daxianaiyoumogutang')
AddEventHandler('qb-crafting:server:daxianaiyoumogutang', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('jungu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['jungu'], "remove")

        Player.Functions.RemoveItem('naiyou', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['naiyou'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('daxianaiyoumogutang', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['daxianaiyoumogutang'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 大虾奶油蘑菇汤 ', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:kaozhuzhupai')
AddEventHandler('qb-crafting:server:kaozhuzhupai', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('raw_meat', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "remove")

        Player.Functions.RemoveItem('corn', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['corn'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('kaozhuzhupai', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kaozhuzhupai'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 烤猪肋排  ', 'success')
        Wait(5000)
        
   
       
   
end)

-- 酒品制作

RegisterServerEvent('qb-crafting:server:yishabeilaputaojiu')
AddEventHandler('qb-crafting:server:yishabeilaputaojiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangyishabeilaputaojiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangyishabeilaputaojiu'], "remove")

        -- add items
        Player.Functions.AddItem('yishabeilaputaojiu', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yishabeilaputaojiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 伊莎贝拉葡萄酒  ', 'success')
        Wait(5000)     
   
end)

RegisterServerEvent('qb-crafting:server:baiweipijiu')
AddEventHandler('qb-crafting:server:baiweipijiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangbaiweipijiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangbaiweipijiu'], "remove")

        -- add items
        Player.Functions.AddItem('baiweipijiu', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['baiweipijiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 百威啤酒  ', 'success')
        Wait(5000)     
   
end)

RegisterServerEvent('qb-crafting:server:jiekedanni')
AddEventHandler('qb-crafting:server:jiekedanni', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangjiekedanni', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangjiekedanni'], "remove")

        -- add items
        Player.Functions.AddItem('jiekedanni', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['jiekedanni'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 杰克丹尼  ', 'success')
        Wait(5000)     
   
end)

RegisterServerEvent('qb-crafting:server:napolunganyi')
AddEventHandler('qb-crafting:server:napolunganyi', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangnapolunganyi', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangnapolunganyi'], "remove")

        -- add items
        Player.Functions.AddItem('napolunganyi', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['napolunganyi'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 拿破仑干邑  ', 'success')
        Wait(5000)     
   
end)







