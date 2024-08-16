local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local currentname
local currentzone

-----------------------------------------------------------------------------------

-- job prompts and blips
Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qb-core']:createPrompt(v.location, vector3(2311.3784, -1427.2915, 46.9322), QBCore.Shared.Keybinds['J'], '访问 烟草加工台', {
            type = 'client',
            event = 'qb-yancaogongsi:client:gzmenu',
            args = { v.location, v.coords },
        })
       
    end
end)


Citizen.CreateThread(function()
  for saloontender, v in pairs(Config.SaloonTenderLocations) do
      exports['qb-core']:createPrompt(v.location, vector3(2304.0620, -1427.1178, 46.9229), QBCore.Shared.Keybinds['J'], '访问 烟草加工台', {
          type = 'client',
          event = 'qb-yancaogongsi:client:gzmenu',
          args = { v.location, v.coords },
      })
      
  end
end)


Citizen.CreateThread(function()
  for saloontender, v in pairs(Config.SaloonTenderLocations) do
      exports['qb-core']:createPrompt(v.location, vector3(2297.1038, -1428.4025, 46.9278), QBCore.Shared.Keybinds['J'], '访问 烟草加工台', {
          type = 'client',
          event = 'qb-yancaogongsi:client:gzmenu',
          args = { v.location, v.coords },
      })
      
  end
end)

Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qb-core']:createPrompt(v.location, vector3(2290.1353, -1429.6808, 46.9299), QBCore.Shared.Keybinds['J'], '访问 烟草加工台', {
            type = 'client',
            event = 'qb-yancaogongsi:client:gzmenu',
            args = { v.location, v.coords },
        })
        
    end
  end)


Citizen.CreateThread(function()
  for saloontender, v in pairs(Config.SaloonTenderLocations) do
      exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
          type = 'client',
          event = 'qb-yancaogongsi:client:mainmenu',
          args = { v.location, v.coords },
      })
      
  end
end)


-----------------------------------------------------------------------------------

-- saloontender menu
RegisterNetEvent('qb-yancaogongsi:client:mainmenu', function(name, zone)
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == name then
        currentname = name
        currentzone = zone
        
        lib.registerContext({
            id = 'yancaogongsi_menu',
            title = '黑水镇烟草公司办事处',
            options = {
              
              {
                title = '储藏室',
                
                icon = 'fas fa-box',
                event = 'qb-yancaogongsi:client:storage',
                
              },
              

              
              {
                title = '老板菜单',
                
                event = 'qb-bossmenu:client:OpenMenu',
                icon = 'fas fa-user-circle'
              },
              
            }
          })
          lib.showContext('yancaogongsi_menu')
    else
        QBCore.Functions.Notify('你没有被授权!', 'error')
    end
end)


RegisterNetEvent('qb-yancaogongsi:client:gzmenu', function(name, zone)
  local job = QBCore.Functions.GetPlayerData().job.name
  if job == name then
      currentname = name
      currentzone = zone
      
      lib.registerContext({
          id = 'yancaogongsigz_menu',
          title = '黑水镇烟草公司制烟厂',
          options = {
            
            {
              title = '烟草制作菜单',
              
              icon = 'fas fa-box',
              menu = 'yancao_menu'
              
            }
            
          }
        })
        lib.showContext('yancaogongsigz_menu')
  else
      QBCore.Functions.Notify('你没有被授权!', 'error')
  end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('qb-yancaogongsi:client:storage', function()
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

RegisterNetEvent('qb-yancaogongsi:client:musicmenu', function()
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
            
            event = 'qb-yancaogongsi:client:playMusic',
            
          },
          {
            title = '⏸️ | 暂停音乐',
            description = '暂停当前播放的音乐',
            
            event = 'qb-yancaogongsi:client:pauseMusic',
            
           
          },
          {
            title = '▶️ | 恢复音乐',
            description = '继续播放暂停的音乐',
            event = 'qb-yancaogongsi:client:resumeMusic',
           
          },
          {
            title = '🔈 | 改变音量',
            description = '调节音乐音量',
            event = 'qb-yancaogongsi:client:changeVolume',
           
          },

          {
            title = '❌ | 关闭音乐',
            description = '停止音乐并选择一首新歌曲',
            event = 'qb-yancaogongsi:client:stopMusic',
           
          },
          
        }
      })
      lib.showContext('salonyy_menu')
end)

RegisterNetEvent('qb-yancaogongsi:client:playMusic', function()
    local input = lib.inputDialog('歌曲选择', {'YouTube 网址'})
    
    if input then
        local yinyue = input[1]
        TriggerServerEvent('qb-yancaogongsi:server:playMusic', yinyue, currentname, currentzone)
    end
end)

-- change volume
RegisterNetEvent('qb-yancaogongsi:client:changeVolume', function()
    local input = lib.inputDialog('音乐音量', {'最小值：0.01 - 最大值：1'})
    
    if input then
        local volume = input[1]
        TriggerServerEvent('qb-yancaogongsi:server:changeVolume', volume, currentname, currentzone)
    end
end)

-- pause music
RegisterNetEvent('qb-yancaogongsi:client:pauseMusic', function()
    TriggerServerEvent('qb-yancaogongsi:server:pauseMusic', currentname, currentzone)
end)

RegisterNetEvent('qb-yancaogongsi:client:crafting', function()
    lib.showContext('zuofan_menu')
end)

-- resume music
RegisterNetEvent('qb-yancaogongsi:client:resumeMusic', function()
    TriggerServerEvent('qb-yancaogongsi:server:resumeMusic', currentname, currentzone)
end)

-- stop music
RegisterNetEvent('qb-yancaogongsi:client:stopMusic', function()
    TriggerServerEvent('qb-yancaogongsi:server:stopMusic', currentname, currentzone)
end)



lib.registerContext({
    id = 'yancao_menu',
    title = '制作香烟',
    menu = 'yancaogongsigz_menu',
    options = {
      
      {
        title = '雪茄盒',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yihexuejia',
        
      },

      {
        title = '香烟',
        
        icon = 'fa-solid fa-wine-bottle',
        event = 'qb-crafting:client:yihexiangyan',
        
      },

    }
  })


--烟草制作

RegisterNetEvent('qb-crafting:client:cigarbox')
AddEventHandler('qb-crafting:client:cigarbox', function()
    
    local hasItem = QBCore.Functions.HasItem('tobacco', 15)
    

    
    
    
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar("crafting-cigarbox", '正在制作 一盒雪茄 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:cigarbox')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(烟草x15)', 'error')
    end
end)

RegisterNetEvent('qb-crafting:client:yixiangnapolun')
AddEventHandler('qb-crafting:client:yixiangnapolun', function()
    
    local hasItem = QBCore.Functions.HasItem('tobacco', 15)
    

    
    
    
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar("crafting-cigarettebox", '正在制作 一盒香烟 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:cigarettebox')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(烟草x15)', 'error')
    end
end)



--烟草拆分

RegisterNetEvent('qb-crafting:client:cigar')
AddEventHandler('qb-crafting:client:cigar', function()
    
    local hasItem = QBCore.Functions.HasItem('cigarbox', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-cigar", '正在拆开 一盒雪茄  ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:cigar')
        end)
    
    end
end)

RegisterNetEvent('qb-crafting:client:cigarette')
AddEventHandler('qb-crafting:client:cigarette', function()
    
    local hasItem = QBCore.Functions.HasItem('cigarettebox', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-cigarette", '正在拆开 一盒香烟  ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:cigarette')
        end)
    
    end
end)



    -- tobacco factory
--    ['drytobacco'] = {['name'] = 'drytobacco', ['label'] = '干烟草', ['weight'] = 100,  ['type'] = 'item', ['image'] = 'drytobacco.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的干烟草'},
--    ['cigar']      = {['name'] = 'cigar',      ['label'] = '雪茄',       ['weight'] = 200,  ['type'] = 'item', ['image'] = 'cigar.png',      ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的雪茄'},
--    ['cigarette']      = {['name'] = 'cigarette',      ['label'] = '香烟',       ['weight'] = 200,  ['type'] = 'item', ['image'] = 'cigarette.png',      ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的香烟'},
--    ['cigarbox']   = {['name'] = 'cigarbox',   ['label'] = '雪茄盒',   ['weight'] = 2000, ['type'] = 'item', ['image'] = 'cigarbox.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '一盒雪茄'},
--    ['cigarettebox']   = {['name'] = 'cigarettebox',   ['label'] = '香烟盒',   ['weight'] = 2000, ['type'] = 'item', ['image'] = 'cigarettebox.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '一盒香烟'},

--    ['tobaccoseed']  = {['name'] = 'tobaccoseed',  ['label'] = '烟草种子',  ['weight'] = 0,   ['type'] = 'item', ['image'] = 'seeds.png',       ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'used in farming'},
--    ['tobacco']      = {['name'] = 'tobacco',      ['label'] = '烟草',       ['weight'] = 1000, ['type'] = 'item', ['image'] = 'tobacco.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'product from farming'},