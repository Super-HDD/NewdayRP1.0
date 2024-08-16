local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local currentname
local currentzone

-----------------------------------------------------------------------------------

-- job prompts and blips
Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
            type = 'client',
            event = 'qb-saloonrodes:client:mainmenu',
            args = { v.location, v.coords },
        })
        if v.showblip == true then
            local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, Config.Blip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------

-- saloontender menu
RegisterNetEvent('qb-saloonrodes:client:mainmenu', function(name, zone)
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == name then
        currentname = name
        currentzone = zone
        
        lib.registerContext({
            id = 'salonrd_menu',
            title = '罗德镇酒馆',
            options = {
              
              {
                title = '储藏室',
                
                icon = 'fas fa-box',
                event = 'qb-saloonrodes:client:storage',
                
              },
              {
                title = '杜克盒子',
                
                icon = 'fas fa-music',
                event = 'qb-saloonrodes:client:musicmenu',
                
               
              },
              {
                title = '制作食品',
                
                icon = 'fa-solid fa-burger',
                
                menu = 'zuofanrd_menu'
                
               
              },

              {
                title = '制作酒品',
                
                icon = 'fa-solid fa-beer-mug-empty',
                menu = 'jiupinrd_menu',
                
               
              },
              {
                title = '职位管理',
                
                event = 'qb-bossmenu:client:OpenMenu',
                icon = 'fas fa-user-circle'
              },
              
            }
          })
          lib.showContext('salonrd_menu')
    else
        QBCore.Functions.Notify('你没有被授权!', 'error')
    end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('qb-saloonrodes:client:storage', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    local stashloc = currentname
    if job == currentname then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashloc, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashloc)
    end
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('qb-saloonrodes:client:musicmenu', function()
    local name = currentname
    local zone = currentzone
    

    lib.registerContext({
        id = 'salonyyrd_menu',
        title = '💿 | 杜克盒子菜单',
        menu = 'salonrd_menu',
        options = {
          
          {
            title = '🎶 | 播放音乐',
            description = '输入 YouTube 网址',
            
            event = 'qb-saloonrodes:client:playMusic',
            
          },
          {
            title = '⏸️ | 暂停音乐',
            description = '暂停当前播放的音乐',
            
            event = 'qb-saloonrodes:client:pauseMusic',
            
           
          },
          {
            title = '▶️ | 恢复音乐',
            description = '继续播放暂停的音乐',
            event = 'qb-saloonrodes:client:resumeMusic',
           
          },
          {
            title = '🔈 | 改变音量',
            description = '调节音乐音量',
            event = 'qb-saloonrodes:client:changeVolume',
           
          },

          {
            title = '❌ | 关闭音乐',
            description = '停止音乐并选择一首新歌曲',
            event = 'qb-saloonrodes:client:stopMusic',
           
          },
          
        }
      })
      lib.showContext('salonyyrd_menu')
end)

RegisterNetEvent('qb-saloonrodes:client:playMusic', function()
    local input = lib.inputDialog('歌曲选择', {'YouTube 网址'})
    
    if input then
        local yinyue = input[1]
        TriggerServerEvent('qb-saloonrodes:server:playMusic', yinyue, currentname, currentzone)
    end
end)

-- change volume
RegisterNetEvent('qb-saloonrodes:client:changeVolume', function()
    local input = lib.inputDialog('音乐音量', {'最小值：0.01 - 最大值：1'})
    
    if input then
        local volume = input[1]
        TriggerServerEvent('qb-saloonrodes:server:changeVolume', volume, currentname, currentzone)
    end
end)

-- pause music
RegisterNetEvent('qb-saloonrodes:client:pauseMusic', function()
    TriggerServerEvent('qb-saloonrodes:server:pauseMusic', currentname, currentzone)
end)

RegisterNetEvent('qb-saloonrodes:client:crafting', function()
    lib.showContext('zuofan_menu')
end)

-- resume music
RegisterNetEvent('qb-saloonrodes:client:resumeMusic', function()
    TriggerServerEvent('qb-saloonrodes:server:resumeMusic', currentname, currentzone)
end)

-- stop music
RegisterNetEvent('qb-saloonrodes:client:stopMusic', function()
    TriggerServerEvent('qb-saloonrodes:server:stopMusic', currentname, currentzone)
end)



lib.registerContext({
    id = 'zuofanrd_menu',
    title = '制作食品',
    menu = 'salonrd_menu',
    options = {
      
      {
        title = '海陆空巨无霸',
        
        icon = 'fa-solid fa-bowl-rice',
        event = 'qb-crafting:client:juwuba',
        
      },

      {
        title = '烤全羊 ',
        
        icon = 'fa-solid fa-bowl-rice',
        event = 'qb-crafting:client:kaoquanyang',
        
      },
      {
        title = '大虾奶油蘑菇汤',
        
        icon = 'fa-solid fa-bowl-rice',
        event = 'qb-crafting:client:daxianaiyoumogutang',
        
      },
      {
        title = '烤猪肋排',
        
        icon = 'fa-solid fa-bowl-rice',
        event = 'qb-crafting:client:kaozhuzhupai',
        
       
      },

      
      
      
    }
  })

  lib.registerContext({
    id = 'jiupinrd_menu',
    title = '制作酒品',
    menu = 'salonrd_menu',
    options = {
      
      {
        title = '暂无内容',
        
        icon = 'fa-solid fa-xmark',
        
        
      },
      
      
      
      
    }
  })



 

--------------------------------------------------------------------------

-- axe crafting



RegisterNetEvent('qb-crafting:client:juwuba')
AddEventHandler('qb-crafting:client:juwuba', function()
    
    local hasItem = QBCore.Functions.HasItem('raw_meat', 1)
    local hasItem1 = QBCore.Functions.HasItem('shengcai', 1)
    local hasItem2 = QBCore.Functions.HasItem('corn', 1)
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-juwuba", '正在做海陆空巨无霸 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:juwuba')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生肉x1+生菜x1+玉米x1)', 'error')
    end
end)

RegisterNetEvent('qb-crafting:client:kaoquanyang')
AddEventHandler('qb-crafting:client:kaoquanyang', function()
    
    local hasItem = QBCore.Functions.HasItem('raw_meat', 1)
    local hasItem1 = QBCore.Functions.HasItem('jungu', 1)
    local hasItem2 = QBCore.Functions.HasItem('corn', 1)
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-kaoquanyang", '正在做烤全羊 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:kaoquanyang')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生肉x1+菌菇x1+玉米x1)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:daxianaiyoumogutang')
AddEventHandler('qb-crafting:client:daxianaiyoumogutang', function()
    
    local hasItem = QBCore.Functions.HasItem('jungu', 1)
    local hasItem1 = QBCore.Functions.HasItem('naiyou', 1)
    
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-daxianaiyoumogutang", '正在做 大虾奶油蘑菇汤', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:daxianaiyoumogutang')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(菌菇x1,奶油x1)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:kaozhuzhupai')
AddEventHandler('qb-crafting:client:kaozhuzhupai', function()
    
    local hasItem = QBCore.Functions.HasItem('raw_meat', 1)
    
    local hasItem2 = QBCore.Functions.HasItem('corn', 1)
    
    
    
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar("crafting-kaozhuzhupai", '正在做烤猪肋排 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:kaozhuzhupai')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生肉x1,玉米x1)', 'error')
    end
end)

