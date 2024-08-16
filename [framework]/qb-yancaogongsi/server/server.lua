local QBCore = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false
local volume = Config.DukeBoxDefaultVolume
local radius = Config.DukeBoxRadius

RegisterNetEvent('qb-yancaogongsi:server:playMusic', function(song, name, zone)
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

RegisterNetEvent('qb-yancaogongsi:server:changeVolume', function(volume, currentname, currentzone)
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

RegisterNetEvent('qb-yancaogongsi:server:pauseMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-yancaogongsi:server:resumeMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-yancaogongsi:server:stopMusic', function(currentname, currentzone)
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





RegisterServerEvent('qb-crafting:server:cigar')
AddEventHandler('qb-crafting:server:cigar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('tobacco', 15)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tobacco'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('cigarbox', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigarbox'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 雪茄盒', 'success')
        Wait(5000)
        
   
       
   
end)

RegisterServerEvent('qb-crafting:server:cigarette')
AddEventHandler('qb-crafting:server:cigarette', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('tobacco', 15)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tobacco'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('cigarettebox', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigarettebox'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 香烟盒', 'success')
        Wait(5000)
        
   
       
   
end)







RegisterServerEvent('qb-crafting:server:cigar')
AddEventHandler('qb-crafting:server:cigar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('cigarbox', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigarbox'], "remove")

        

        
       
        
        -- add items
        Player.Functions.AddItem('cigar', 15)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigar'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 雪茄盒   ', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:cigarette')
AddEventHandler('qb-crafting:server:cigarette', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('cigarettebox', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigarettebox'], "remove")

        

        
       
        
        -- add items
        Player.Functions.AddItem('cigarette', 15)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cigarette'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已拆开 香烟盒  ', 'success')
        Wait(5000)
        
   
       
   
end)






