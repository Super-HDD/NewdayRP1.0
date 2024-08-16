local QBCore = exports['qb-core']:GetCoreObject()
local MenuData={}
local CurrentLoc

--#region 初始化

TriggerEvent("qb-menubase:getData", function(call)
    MenuData = call
end)

--#region 创建地图图例以及交互提示
Citizen.CreateThread(function() 
    for loc,v in pairs(Config.WineryLocations) do
        exports['qb-core']:createPrompt(loc..'WorkMenu', v.WorkMenuCoords, QBCore.Shared.Keybinds['J'], '访问 酿酒台', {
            type = 'client',
            event = 'ndrp-winery:client:workmenu',
            args = {loc},
        })

        exports['qb-core']:createPrompt(loc..'OutsideDoor', v.OutsideDoorCoords, QBCore.Shared.Keybinds['SPACEBAR'], '进入'..v.name, {
            type = 'client',
            event = 'ndrp-winery:client:movein',
            args = {loc},
        })

        exports['qb-core']:createPrompt(loc..'InsideDoor', v.InsideDoorCoords, QBCore.Shared.Keybinds['SPACEBAR'], '离开'..v.name, {
            type = 'client',
            event = 'ndrp-winery:client:moveout',
            args = {loc},
        })

        -- TODO:地图上显示图例
        -- if v.showblip == true then
        --     local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
        --     SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
        --     SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
        --     Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, v.name)
        -- end
    end
end)
--#endregion 初始化结束

--#region 本地函数

local function movePlayer(coords,heading)
    local ped=PlayerPedId()
    DoScreenFadeOut(600)
    while not IsScreenFadedOut() do
		Wait(10)
	end
	RequestCollisionAtCoord(coords.x, coords.y, coords.z)
	while not HasCollisionLoadedAroundEntity(ped) do
		Wait()
	end
	SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
	SetEntityHeading(ped, heading and heading or 0.0)
	Wait(1000)
	DoScreenFadeIn(600)
end
--#endregion

--#region 菜单响应列表
local WorkMenuActions={
    ['winery_menu']=function()
        OpenWineryMenu()
    end,
    ['storage_menu']=function()
        OpenStorageMenu()
    end
}
--#endregion

--#region 菜单函数
function OpenMainMenu()
    MenuData.CloseAll()
    local elements={
        {label = Lang:t('menu.winery_menu'),  value = 'winery_menu', desc = ""},
        {label = Lang:t('menu.storage_menu'),  value = 'storage_menu', desc = ""},
    }
    MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'winery_main_menu',
    { 
      title = Lang:t('menu.main_menu'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
        WorkMenuActions[data.current.value]() 
    end, 
    function(data, menu) --cancel
      MenuData.CloseAll()
    end
  )
end

function OpenWineryMenu()
    local elements={}
    for name,recipe in pairs(Config.RecipeList) do
        table.insert(elements,{name=name,label = QBCore.Shared.Items[name].label,  value = 0, desc = recipe.txt,type="slider",min=0,max=100})
    end
    table.insert(elements,{label = '开始酿造',  value = 'start_winery', desc = ""})
    MenuData.CloseAll()
    MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'winery_craft_menu',
    { 
      title = Lang:t('menu.winery_menu'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
        -- print(QBCore.Debug(data))
        if type(data.current.value)=="string" then
            StartWinery(data)
        end
    end, 
    function(data, menu) --cancel
      OpenMainMenu()
    end
    )
end

function OpenStorageMenu()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", CurrentLoc, {
        maxweight = Config.StorageMaxWeight,
        slots = Config.StorageMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", CurrentLoc)
end

function StartWinery(data) 
    local RecipeList=Config.RecipeList
    local CraftItems={}
    local CraftTime=0
    local CraftName={}
    local hasWork=false
    print(QBCore.Debug(data))
    for i=1,#data.elements-1 do
        CraftTime=CraftTime+RecipeList[data.elements[i].name].crafttime*data.elements[i].value
        if data.elements[i].value> 0 then
            hasWork=true
            table.insert(CraftName,{name=data.elements[i].name,amount=data.elements[i].value}) 
        end
        for _,v in pairs(RecipeList[data.elements[i].name].craftitems) do           
            if type(v.item)=='table' then
                local ItemList={}
                for j=1,#v.item do
                    table.insert(ItemList,{item=v.item[j],amount=v.amount[j]*data.elements[i].value})
                end
                table.insert(CraftItems,ItemList)
            else
                table.insert(CraftItems,{item=v.item,amount=v.amount*data.elements[i].value})
            end  
        end
    end
    if hasWork then
        local Recipe={
            Name=CraftName,
            CraftTime=CraftTime,
            CraftItems=CraftItems,
            Label='酒'
        }
        TriggerEvent('ndrp-crafting:client:start-crafting',Recipe)
    end
end
--#endregion

--#region 事件
RegisterNetEvent('ndrp-winery:client:workmenu',function(loc)
    local PlayerData=QBCore.Functions.GetPlayerData()
    if PlayerData.job.name =='aidingge' then
        CurrentLoc=loc
        OpenMainMenu()
    else
        QBCore.Functions.Notify('您不是该酒厂员工', 'error')
    end
end)

RegisterNetEvent('ndrp-winery:client:moveout',function(loc)
    movePlayer(Config.WineryLocations[loc].OutsideDoorCoords,0)
end)

RegisterNetEvent('ndrp-winery:client:movein',function(loc)
    movePlayer(Config.WineryLocations[loc].InsideDoorCoords,0)
end)
--#endregion