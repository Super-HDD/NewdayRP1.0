local QBCore = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false
local volume = Config.DukeBoxDefaultVolume
local radius = Config.DukeBoxRadius


Citizen.CreateThread(function()
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..Config.MusicPath..'" /b'):lines() do
        i = i + 1
        -- t[i] = filename
        print(filename)
        table.insert(Config.Music,filename)
    end
    print(QBCore.Debug(Config.Music))
end)

QBCore.Functions.CreateCallback('qb-saloontendeer:server:load-music-list', function(source, cb, args)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..Config.MusicPath..'" /b'):lines() do
        i = i + 1
        t[i] = filename
    end
    cb(t)
end)

RegisterNetEvent('qb-saloontendeer:server:playMusic', function(song, name, zone)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local boothCoords = zone
    print(QBCore.Debug(coords))
    local dist = #(coords - boothCoords)
    local mysong = song
    print(mysong)
    if dist > 3 then return end
    xSound:PlayUrlPos(-1, name, mysong, volume, coords)
    xSound:Distance(-1, name, radius)
    isPlaying = true
end)

RegisterNetEvent('qb-saloontendeer:server:changeVolume', function(volume, currentname, currentzone)
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

RegisterNetEvent('qb-saloontendeer:server:pauseMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-saloontendeer:server:resumeMusic', function(currentname, currentzone)
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

RegisterNetEvent('qb-saloontendeer:server:stopMusic', function(currentname, currentzone)
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


-- 下面就是 本脚本的 主要内容了
RegisterServerEvent('qb-crafting:server:kafei')--这一行 就是 在 客户端(client.lua)那边 提到的 触发函数 必须跟 客户端 那边 触发的 函数 一致
AddEventHandler('qb-crafting:server:kafei', function()--这一行 前面也提到了 函数 必须跟 上一行 一致
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
   --上面这两行只是 框架 函数 牵引 不用管
    
        -- 这两行 是 制作 进度条完成后 从 玩家背包 删除 的物品
        Player.Functions.RemoveItem('kafeifen', 1)--这一行 单引号 里面填写的 就是 需要删除的 物品 ，数字 是 需要删除的 数量
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kafeifen'], "remove")-- 这一行 ['kafeifen'] 也是 跟上一行 填写的 物品一致
        --可以 删除多个 物品 以此类推 往下写就行
        --Player.Functions.RemoveItem('kafeifen', 1)
        --TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kafeifen'], "remove")
        
        -- 下面 是 制作进度条结束后 添加到 背包的 物品 
        Player.Functions.AddItem('kafei', 1)--这一行  也 跟上面 删除 物品 是一样的 单引号里面 填写 需要添加的 物品 名 即可 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kafei'], "add") --这一行 ['kafei'] 也是 跟上一行 填写的 物品一致
        --可以 添加多个 物品 以此类推 往下写就行
        --Player.Functions.AddItem('kafei', 1)
        --TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kafei'], "add")


        --下面这一行是 全部 内容完成后 提示 的通知 
        TriggerClientEvent('QBCore:Notify', src, '已做好咖啡', 'success')

        --下面这个 不用管 不要删掉 就行
        Wait(5000)
       
   
       
   
end)

--往下也是一样  需要 添加新内容的话 以此类推 往下写就行

RegisterServerEvent('qb-crafting:server:niunai')
AddEventHandler('qb-crafting:server:niunai', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
        Player.Functions.RemoveItem('shengniunai', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['shengniunai'], "remove")
       
        
        -- add items
        Player.Functions.AddItem('niunai', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['niunai'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好牛奶', 'success')
        Wait(5000)
        
   
       
   
end)

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
        
        TriggerClientEvent('QBCore:Notify', src, '已做好伊莎贝拉葡萄酒*12', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:huangyoujianlongxia')
AddEventHandler('qb-crafting:server:huangyoujianlongxia', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('raw_meat', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "remove")

        Player.Functions.RemoveItem('jungu', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['jungu'], "remove")

        Player.Functions.RemoveItem('midiexiang', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['midiexiang'], "remove")
       
        
        -- add items
        Player.Functions.AddItem('huangyoujianlongxia', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['huangyoujianlongxia'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 黄油煎龙虾', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:xiangkaoeyupai')
AddEventHandler('qb-crafting:server:xiangkaoeyupai', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('raw_meat', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['raw_meat'], "remove")

        Player.Functions.RemoveItem('potato', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['potato'], "remove")
       
        Player.Functions.RemoveItem('bailixiang', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bailixiang'], "remove")
		
		
        -- add items
        Player.Functions.AddItem('xiangkaoeyupai', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['xiangkaoeyupai'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 香烤鳄鱼排', 'success')
        Wait(5000)
        
   
       
   
end)


RegisterServerEvent('qb-crafting:server:lingmengmulicishi')
AddEventHandler('qb-crafting:server:lingmengmulicishi', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    
        -- remove items
       
        Player.Functions.RemoveItem('muli', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['muli'], "remove")

        Player.Functions.RemoveItem('ninmeng', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['ninmeng'], "remove")

        
       
        
        -- add items
        Player.Functions.AddItem('lingmengmulicishi', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lingmengmulicishi'], "add")
        
        TriggerClientEvent('QBCore:Notify', src, '已做好 柠檬牡蛎刺身', 'success')
        Wait(5000)
        
   
       
   
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
