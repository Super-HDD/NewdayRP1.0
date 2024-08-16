local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local currentname
local currentzone

-----------------------------------------------------------------------------------

-- job prompts and blips
Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qb-core']:createPrompt(v.location, vector3(2682.9343, -852.3103, 23.7694), QBCore.Shared.Keybinds['J'], '访问 酿酒台', {
            type = 'client',
            event = 'qb-jiuchang:client:brewing',
            args = { v.location, v.coords },
        })
       
    end
end)


-----------------------------------------------------------------------------------

-- saloontender menu
RegisterNetEvent('qb-jiuchang:client:mainmenu', function(name, zone)
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == name then
        currentname = name
        currentzone = zone
        
        lib.registerContext({
            id = 'jiuchang_menu',
            title = '圣丹尼斯艾丁格酒厂办事处',
            options = {
              
              {
                title = '储藏室',
                
                icon = 'fas fa-box',
                event = 'qb-jiuchang:client:storage',
                
              },
              

              
              {
                title = '老板菜单',
                
                event = 'qb-bossmenu:client:OpenMenu',
                icon = 'fas fa-user-circle'
              },
              
            }
          })
          lib.showContext('jiuchang_menu')
    else
        QBCore.Functions.Notify('你没有被授权!', 'error')
    end
end)


RegisterNetEvent('qb-jiuchang:client:gzmenu', function(name, zone)
  local job = QBCore.Functions.GetPlayerData().job.name
  if job == name then
      currentname = name
      currentzone = zone
      
      lib.registerContext({
          id = 'jiuchanggz_menu',
          title = '艾丁格酒厂生产基地',
          options = {
            
            {
              title = '酿酒',
              
              icon = 'fas fa-box',
              menu = 'niangjiu_menu'
              
            }
            
          }
        })
        lib.showContext('jiuchanggz_menu')
  else
      QBCore.Functions.Notify('你没有被授权!', 'error')
  end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('qb-jiuchang:client:storage', function()
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

RegisterNetEvent('qb-jiuchang:client:musicmenu', function()
    local name = currentname
    local zone = currentzone
    

    lib.registerContext({
        id = 'salonyydn_menu',
        title = '💿 | 杜克盒子菜单',
        menu = 'salon_menu',
        options = {
          
          {
            title = '🎶 | 播放音乐',
            description = '输入 YouTube 网址',
            
            event = 'qb-jiuchang:client:playMusic',
            
          },
          {
            title = '⏸️ | 暂停音乐',
            description = '暂停当前播放的音乐',
            
            event = 'qb-jiuchang:client:pauseMusic',
            
           
          },
          {
            title = '▶️ | 恢复音乐',
            description = '继续播放暂停的音乐',
            event = 'qb-jiuchang:client:resumeMusic',
           
          },
          {
            title = '🔈 | 改变音量',
            description = '调节音乐音量',
            event = 'qb-jiuchang:client:changeVolume',
           
          },

          {
            title = '❌ | 关闭音乐',
            description = '停止音乐并选择一首新歌曲',
            event = 'qb-jiuchang:client:stopMusic',
           
          },
          
        }
      })
      lib.showContext('salonyy_menu')
end)

RegisterNetEvent('qb-jiuchang:client:playMusic', function()
    local input = lib.inputDialog('歌曲选择', {'YouTube 网址'})
    
    if input then
        local yinyue = input[1]
        TriggerServerEvent('qb-jiuchang:server:playMusic', yinyue, currentname, currentzone)
    end
end)

-- change volume
RegisterNetEvent('qb-jiuchang:client:changeVolume', function()
    local input = lib.inputDialog('音乐音量', {'最小值：0.01 - 最大值：1'})
    
    if input then
        local volume = input[1]
        TriggerServerEvent('qb-jiuchang:server:changeVolume', volume, currentname, currentzone)
    end
end)

-- pause music
RegisterNetEvent('qb-jiuchang:client:pauseMusic', function()
    TriggerServerEvent('qb-jiuchang:server:pauseMusic', currentname, currentzone)
end)

RegisterNetEvent('qb-jiuchang:client:crafting', function()
    lib.showContext('zuofan_menu')
end)

-- resume music
RegisterNetEvent('qb-jiuchang:client:resumeMusic', function()
    TriggerServerEvent('qb-jiuchang:server:resumeMusic', currentname, currentzone)
end)

-- stop music
RegisterNetEvent('qb-jiuchang:client:stopMusic', function()
    TriggerServerEvent('qb-jiuchang:server:stopMusic', currentname, currentzone)
end)



lib.registerContext({
    id = 'niangjiu_menu',
    title = '制作酒品',
    menu = 'jiuchanggz_menu',
    options = {
      
      {
        title = '百威啤酒',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yixiangpijiu',
        
      },

      {
        title = '伊莎贝拉葡萄酒 ',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yixiangputaojiu',
        
      },
      
      {
        title = '杰克丹尼',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yixiangjiekedanni',
        
       
      },

      {
        title = '拿破仑干邑',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yixiangnapolun',
        
      },

      
      
      
    }
  })



 

RegisterNetEvent('qb-crafting:client:yixiangpijiu')
AddEventHandler('qb-crafting:client:yixiangpijiu', function()
    
    local hasItem = QBCore.Functions.HasItem('beer_hua', 12)
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-yixiangpijiu", '正在制作 一箱百威啤酒 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:yixiangpijiu')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(啤酒花x12)', 'error')
    end
end)

RegisterNetEvent('qb-crafting:client:yixiangputaojiu')
AddEventHandler('qb-crafting:client:yixiangputaojiu', function()
    
    local hasItem = QBCore.Functions.HasItem('xiaomai', 12)
    local hasItem1 = QBCore.Functions.HasItem('putao', 3)
    
    
    if hasItem and hasItem1 then
        QBCore.Functions.Progressbar("crafting-yixiangputaojiu", '正在 一箱伊莎贝拉葡萄酒 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:yixiangputaojiu')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(小麦x12+葡萄x3)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:yixiangjiekedanni')
AddEventHandler('qb-crafting:client:yixiangjiekedanni', function()
    
    local hasItem = QBCore.Functions.HasItem('xiaomai', 12)
    local hasItem1 = QBCore.Functions.HasItem('beer_hua', 12)
    
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-yixiangjiekedanni", '正在做 一箱杰克丹尼', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:yixiangjiekedanni')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(啤酒花x12,小麦x12)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:yixiangnapolun')
AddEventHandler('qb-crafting:client:yixiangnapolun', function()
    
    local hasItem = QBCore.Functions.HasItem('beer_hua', 12)
    
    local hasItem2 = QBCore.Functions.HasItem('putao', 3)
    
    
    
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar("crafting-yixiangnapolun", '正在 一箱拿破仑干邑 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:yixiangnapolun')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(啤酒花x12,葡萄x3)', 'error')
    end
end)



























RegisterNetEvent('qb-crafting:client:baiwepijiu')
AddEventHandler('qb-crafting:client:baiwepijiu', function()
    
    local hasItem = QBCore.Functions.HasItem('yixiangbaiweipijiu', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-baiwepijiu", '正在拆开 一箱百威啤酒  ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:baiwepijiu')
        end)
    
    end
end)


RegisterNetEvent('qb-crafting:client:putaojiu')
AddEventHandler('qb-crafting:client:putaojiu', function()
    
    local hasItem = QBCore.Functions.HasItem('yixiangyishabeilaputaojiu', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-putaojiu", '正在拆开 一箱伊莎贝拉葡萄酒 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:putaojiu')
        end)
    end
end)


RegisterNetEvent('qb-crafting:client:jiekedanni')
AddEventHandler('qb-crafting:client:jiekedanni', function()
    
    local hasItem = QBCore.Functions.HasItem('yixiangjiekedanni', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-jiekedanni", '正在拆开 一箱杰克丹尼 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:jiekedanni')
        end)
     end
end)


RegisterNetEvent('qb-crafting:client:napolunganyi')
AddEventHandler('qb-crafting:client:napolunganyi', function()
    
    local hasItem = QBCore.Functions.HasItem('yixiangnapolunganyi', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-napolunganyi", '正在拆开 一箱杰克丹尼 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:napolunganyi')
        end)
    end
end)

