local QBCore = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false
local volume = Config.DukeBoxDefaultVolume
local radius = Config.DukeBoxRadius

RegisterNetEvent('qb-jiuchang:server:playMusic', function(song, name, zone)
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

RegisterNetEvent('qb-jiuchang:server:changeVolume', function(volume, currentname, currentzone)
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

RegisterNetEvent('qb-jiuchang:server:pauseMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-jiuchang:server:resumeMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-jiuchang:server:stopMusic', function(currentname, currentzone)
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





RegisterServerEvent('qb-crafting:server:yixiangpijiu')
AddEventHandler('qb-crafting:server:yixiangpijiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('beer_hua', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['beer_hua'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('yixiangbaiweipijiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangbaiweipijiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 一箱百威啤酒', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:yixiangputaojiu')
AddEventHandler('qb-crafting:server:yixiangputaojiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('xiaomai', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['xiaomai'], "remove")

        Player.Functions.RemoveItem('putao', 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['putao'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('yixiangyishabeilaputaojiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangyishabeilaputaojiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 一箱伊莎贝拉葡萄酒', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:yixiangjiekedanni')
AddEventHandler('qb-crafting:server:yixiangjiekedanni', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('xiaomai', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['xiaomai'], "remove")

        Player.Functions.RemoveItem('beer_hua', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['beer_hua'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('yixiangjiekedanni', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangjiekedanni'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 一箱杰克丹尼 ', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:yixiangnapolun')
AddEventHandler('qb-crafting:server:yixiangnapolun', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('beer_hua', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['beer_hua'], "remove")

        Player.Functions.RemoveItem('putao', 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['putao'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('yixiangnapolunganyi', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangnapolunganyi'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 一箱拿破仑干邑  ', 'success')
        Wait(5000)
        
   
       
   
end)
































RegisterServerEvent('qb-crafting:server:baiwepijiu')
AddEventHandler('qb-crafting:server:baiwepijiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangbaiweipijiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangbaiweipijiu'], "remove")

        

        
       
        
        -- add items
        Player.Functions.AddItem('baiweipijiu', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['baiweipijiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 一箱百威啤酒   ', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:putaojiu')
AddEventHandler('qb-crafting:server:putaojiu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('yixiangyishabeilaputaojiu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yixiangyishabeilaputaojiu'], "remove")

        

        
       
        
        -- add items
        Player.Functions.AddItem('yishabeilaputaojiu', 12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yishabeilaputaojiu'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 一箱伊莎贝拉葡萄酒  ', 'success')
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
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 一箱杰克丹尼  ', 'success')
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
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 一箱杰克丹尼  ', 'success')
        Wait(5000)
        
   
       
   
end)



