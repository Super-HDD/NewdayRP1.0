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
            event = 'qb-saloontendeer:client:mainmenu',
            args = { v.location, v.coords },
        })
        if v.showblip == true then
            local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, v.name)
        end
    end
end)
-----------------------------------------------------------------------------------


RegisterNetEvent('qb-saloontendeer:client:mainmenu', function(name, zone)
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == name then
        currentname = name
        currentzone = zone
        
        lib.registerContext({
            id = 'salondn_menu',
            title = '酒馆菜单',
            options = {
              --这个 是 酒馆 总菜单 可以在这儿 添加或者 删除 主要内容 (跟下面菜单 同理)
              {
                title = '储藏室',
                
                icon = 'fas fa-box',
                event = 'qb-saloontendeer:client:storage',
                
              },
              {
                title = '杜克盒子',
                
                icon = 'fas fa-music',
                event = 'qb-saloontendeer:client:musicmenu',
                
               
              },
              {
                title = '酒水',
                
                icon = 'fa-solid fa-burger',
                
                menu = 'zaofan_menu'
                
               
              },

              {
                title = '正餐',
                
                icon = 'fa-solid fa-burger',
                
                menu = 'wucan_menu'
                
               
              },

              
              {
                title = '职位管理',
                
                event = 'qb-bossmenu:client:OpenMenu',
                icon = 'fas fa-user-circle'
              },
              
            }
          })
          lib.showContext('salondn_menu')
    else
        QBCore.Functions.Notify('你没有被授权!', 'error')
    end
end
end)

-----------------------------------------------------------------------------------

-- saloon general storage
RegisterNetEvent('qb-saloontendeer:client:storage', function()
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

RegisterNetEvent('qb-saloontendeer:client:musicmenu', function()
    local name = currentname
    local zone = currentzone
    

    lib.registerContext({
        id = 'salonyydn_menu',--这个 基本没有用 (需要输入 youtube 链接)  不需要的话 可以 从 主菜单  注释掉
        title = '💿 | 杜克盒子菜单',
        menu = 'salon_menu',
        options = {
          
        --   {
        --     title = '🎶 | 播放音乐',
        --     description = '输入 YouTube 网址',
            
        --     event = 'qb-saloontendeer:client:playMusic',
            
        --   },
          {
            title = '🎶 | 播放音乐',
            description = '打开音乐列表',
            
            event = 'qb-saloontendeer:client:show-music-list',
            
          },
          {
            title = '⏸️ | 暂停音乐',
            description = '暂停当前播放的音乐',
            
            event = 'qb-saloontendeer:client:pauseMusic',
            
           
          },
          {
            title = '▶️ | 恢复音乐',
            description = '继续播放暂停的音乐',
            event = 'qb-saloontendeer:client:resumeMusic',
           
          },
          {
            title = '🔈 | 改变音量',
            description = '调节音乐音量',
            event = 'qb-saloontendeer:client:changeVolume',
           
          },

          {
            title = '❌ | 关闭音乐',
            description = '停止音乐并选择一首新歌曲',
            event = 'qb-saloontendeer:client:stopMusic',
           
          },
          
        }
      })
      lib.showContext('salonyydn_menu')
end)

RegisterNetEvent('qb-saloontendeer:client:playMusic', function()
    local input = lib.inputDialog('歌曲选择', {'音乐文件名（带后缀）'})
    
    if input then
        local MusicPath = './sounds/'..input[1]
        
        TriggerServerEvent('qb-saloontendeer:server:playMusic', MusicPath , currentname, currentzone)
    end
end)


RegisterNetEvent('qb-saloontendeer:client:show-music-list',function()
    local MusicList={}
    QBCore.Functions.TriggerCallback('qb-saloontendeer:server:load-music-list', function(musics)
        print(QBCore.Debug(musics))
        if musics[1] then
            for i=1,#musics do
                MusicList[#MusicList+1] = {
                    title=musics[i],
                    event='qb-saloontender:client:play-music-by-name',
                    args={
                        filename=musics[i],
                    }
                }
            end
        end
        lib.registerContext({
            id = 'music_list',
            title = '💿 | 音乐列表',
            menu = 'music_menu',
            --options = MusicList
            options=MusicList
        })
        
        lib.showContext('music_list')
    end)
   
end)

RegisterNetEvent('qb-saloontender:client:play-music-by-name', function(args)
    local filename=args.filename
    print(QBCore.Debug(filename))
    local MusicPath = './sounds/'..filename
    TriggerServerEvent('qb-saloontendeer:server:playMusic', MusicPath , currentname, currentzone)

end)

-- change volume
RegisterNetEvent('qb-saloontendeer:client:changeVolume', function()
    local input = lib.inputDialog('音乐音量', {'最小值：0.01 - 最大值：1'})
    
    if input then
        local volume = input[1]
        TriggerServerEvent('qb-saloontendeer:server:changeVolume', volume, currentname, currentzone)
    end
end)

-- pause music
RegisterNetEvent('qb-saloontendeer:client:pauseMusic', function()
    TriggerServerEvent('qb-saloontendeer:server:pauseMusic', currentname, currentzone)
end)

RegisterNetEvent('qb-saloontendeer:client:crafting', function()
    lib.showContext('zuofan_menu')
end)

-- resume music
RegisterNetEvent('qb-saloontendeer:client:resumeMusic', function()
    TriggerServerEvent('qb-saloontendeer:server:resumeMusic', currentname, currentzone)
end)

-- stop music
RegisterNetEvent('qb-saloontendeer:client:stopMusic', function()
    TriggerServerEvent('qb-saloontendeer:server:stopMusic', currentname, currentzone)
end)



lib.registerContext({
    id = 'zaofan_menu',
    title = '酒水',
    menu = 'salondn_menu',
    options = {

        --示例
          --{
         --   title = '伊莎贝拉葡萄酒*12',  --这是菜单标题
         --   description = '一箱伊莎贝拉葡萄酒x1', --这是 副标题 ()
          --  icon = 'fa-solid fa-pause', --这是 图标 可以用 该 网站上的 图标 https://fontawesome.com/search
          --  event = 'qb-crafting:client:yishabeilaputaojiu*12' -- 这个 event 是 触发函数 用这个 来继续编写 一段 制作脚本
            
         -- },  
      
        {
            title = '咖啡',
            description = '咖啡粉',
            icon = 'fa-solid fa-pause',
            event = 'ndrp-crafting:client:start-crafting',
            args={
                
                    Name={{name='coffee',amount=1}},
                    CraftTime=Config.RecipeList['coffee'].crafttime,
                    CraftItems=Config.RecipeList['coffee'].craftitems,
                    Label='咖啡'
                
            }
        },
		  
		  
        {
            title = '牛奶',
            description = '生牛奶',
            icon = 'fa-solid fa-pause',
            event = 'qb-crafting:client:niunai'
            
          },
		  
	    {
            title = '伊莎贝拉葡萄酒*12',
            description = '一箱伊莎贝拉葡萄酒x1',
            icon = 'fa-solid fa-pause',
            event = 'qb-crafting:client:yishabeilaputaojiu*12'
            
        },  
    }
  })



  lib.registerContext({
    id = 'wucan_menu',
    title = '正餐',
    menu = 'salondn_menu',
    options = {

        --示例
          --{
         --   title = '伊莎贝拉葡萄酒*12',  --这是菜单标题
         --   description = '一箱伊莎贝拉葡萄酒x1', --这是 副标题 ()
          --  icon = 'fa-solid fa-pause', --这是 图标 可以用 该 网站上的 图标 https://fontawesome.com/search
          --  event = 'qb-crafting:client:yishabeilaputaojiu*12' -- 这个 event 是 触发函数 用这个 来继续编写 一段 制作脚本
            
         -- },  
      
      {
        title = '黄油煎龙虾',
        description = '生肉x1,菌菇x1,迷迭香x1',
        icon = 'fa-solid fa-pause',
        event = 'qb-crafting:client:huangyoujianlongxia'
        
      },
	  
	  
	  {
        title = '香烤鳄鱼排',
        description = '生肉x1,土豆x1,百里香x1',
        icon = 'fa-solid fa-pause',
        event = 'qb-crafting:client:xiangkaoeyupai'
        
      },
	  
	  {
        title = '柠檬牡蛎刺身',
        description = '牡蛎x1,柠檬x1',
        icon = 'fa-solid fa-pause',
        event = 'qb-crafting:client:lingmengmulicishi'
        
      },

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


  



 

--------------------------------------------------------------------------



-- 下面就是 制作物品的 准备工作

RegisterNetEvent('qb-crafting:client:kafei')--这个 是 上面 菜单中 提到的 触发函数 
AddEventHandler('qb-crafting:client:kafei', function()-- 在这里面的函数 必须跟 上一行的 一致
    
    local hasItem = QBCore.Functions.HasItem('kafeifen', 1) -- 制作需要的 物品 --就是 必须拥有 这个物品 才能开始 制作 
    --这个 可以是很多 物品 比如
    --我们上面 第一个依赖 物品 对应函数 写的是 hasItem 所以 第二个 的 函数 不能重复 可以这样写  hasItem1 以此类推
    --local hasItem1 = QBCore.Functions.HasItem('kafeifen', 1)
    --定义完 所需物品后 需要 拉取 
    --下面这一行  (if hasItem then)  就是 需要改物品才能 运行下一行 
    --我们 上面示例 里面 多写了一个 hasItem1 所以 我们 下面这 一行 代码 也得做出更改 
    --if hasItem and hasItem1 then 这样  以此类推 
        if hasItem then
            --下面是 进度条 第一个 双引号 里面为 定义名(每个进度条的 名 都不能重复) ，第二个 双引号 里面 为 进度条上显示的 文字(随意更改) ，后面这个 数字为 进度条时长 1000 = 一秒钟  其他项 一律不用管
        QBCore.Functions.Progressbar("crafting-kafei", '正在做咖啡 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- 进度条 到这儿就结束了  到下一个步骤 
            --一面一行 为 服务端 那边 代码的 触发 
            --客户端这边 只写了 一些 前引 制作 还是在 服务端那边完成(server.lua)
             
            TriggerServerEvent('qb-crafting:server:kafei')
        end)
    else
        --下面这一行 为 没有足够的 物品 提示的 通知
        QBCore.Functions.Notify('你没有足够的材料(咖啡粉x1)', 'error')
    end
end)

--下面都是 一个道理 需要添加 新物品 可以 照样 操作

RegisterNetEvent('qb-crafting:client:niunai')
AddEventHandler('qb-crafting:client:niunai', function()
    
    local hasItem = QBCore.Functions.HasItem('shengniunai', 1)
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-niunai", '正在做牛奶 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:niunai')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生牛奶x1)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:yishabeilaputaojiu*12')
AddEventHandler('qb-crafting:client:yishabeilaputaojiu*12', function()
	
    local hasItem = QBCore.Functions.HasItem('yixiangyishabeilaputaojiu', 1)
    
	
    if hasItem then
        QBCore.Functions.Progressbar("crafting-yishabeilaputaojiu*12", '正在做伊莎贝拉葡萄酒*12', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:yishabeilaputaojiu*12')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(一箱伊莎贝拉葡萄酒)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:huangyoujianlongxia')	
AddEventHandler('qb-crafting:client:huangyoujianlongxia', function()
    
    local hasItem = QBCore.Functions.HasItem('raw_meat', 1)
	
	local hasItem1 = QBCore.Functions.HasItem('jungu', 1)
	
    local hasItem2 = QBCore.Functions.HasItem('midiexiang', 1)
    
    
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-huangyoujianlongxia", '正在做黄油煎龙虾 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:huangyoujianlongxia')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生肉x1,菌菇x1,迷迭香x1)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:xiangkaoeyupai')
AddEventHandler('qb-crafting:client:xiangkaoeyupai', function()
    
    local hasItem = QBCore.Functions.HasItem('raw_meat', 1)
	
    local hasItem1 = QBCore.Functions.HasItem('potato', 1)
	
    local hasItem2 = QBCore.Functions.HasItem('bailixiang', 1)
	
    
    if hasItem and hasItem1 and hasItem2 then
        QBCore.Functions.Progressbar("crafting-xiangkaoeyupai", '正在做香烤鳄鱼排', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:xiangkaoeyupai')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(生肉x1,土豆x1,百里香x1)', 'error')
    end
end)


RegisterNetEvent('qb-crafting:client:lingmengmulicishi')
AddEventHandler('qb-crafting:client:lingmengmulicishi', function()
    
    local hasItem = QBCore.Functions.HasItem('muli', 1)
    
    local hasItem2 = QBCore.Functions.HasItem('lingmeng', 1)
    
    
    
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar("crafting-lingmengmulicishi", '正在做柠檬牡蛎刺身 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:lingmengmulicishi')
        end)
    else
        QBCore.Functions.Notify('你没有足够的材料(牡蛎x1,柠檬x1)', 'error')
    end
end)



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
        QBCore.Functions.Progressbar("crafting-daxianaiyoumogutang", '正在做 大虾奶油汤', 30000, false, true, {
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

