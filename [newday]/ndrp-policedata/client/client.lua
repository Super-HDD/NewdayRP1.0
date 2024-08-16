local QBCore = exports['qb-core']:GetCoreObject()

local MenuData = {}
local currentLoc


local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  debugPrint('Hide NUI frame')
  cb({})
end)

TriggerEvent("qb-menubase:getData", function(call)
  MenuData = call
end)

-- 初始化
-- 创建交互提示
Citizen.CreateThread(function()
  if Config.Debug then print('start') end
  for _,v in pairs(Config.PoliceDeskLocation) do
    exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], '使用' .. v.name..'办公桌', {
      type = 'client',
      event = 'ndrp-police:client:mainmenu',
      args = { v.name},
    }) 
  end
end)

-- AddEventHandler("onResourceStop",function()
--   for _,v in pairs(Config.PoliceDeskLocation) do
    
--     exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], '使用' .. v.name..'办公桌', {
--       type = 'client',
--       event = 'ndrp-police:client:mainmenu',
--       args = { v.name},
--     }) 
--   end
-- end)

-- 菜单
-- 领取警械菜单所需组件
-- 领取武器
local function getWeapon(WeaponName)
  TriggerServerEvent('ndrp-police:server:add-weapon',WeaponName)
  MenuData.CloseAll()
end

-- 打开领取武器菜单
local function openGetWeaponMenu()
  local elements={}
  for _,v in pairs(Config.WeaponList) do
    table.insert(elements,{label=QBCore.Shared.Items[v.name].label,value=v.name,desc=""})
  end
  MenuData.CloseAll()
  MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'police_station_get_police_equipment_menu',
    { 
      title = Lang:t('menu.get_weapon'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
      getWeapon(data.current.value)
    end, 
    function() --cancel
      OpenWeaponMenu()
    end
  )
end

local function getAmmo(AmmoType)
  TriggerServerEvent('ndrp-police:server:get-ammo',AmmoType)
end

local function openGetAmmoMenu()
  local elements={}
  for _,v in pairs(Config.AmmoList) do
    table.insert(elements,{label=QBCore.Shared.Items[v.name].label,value=v.name,desc=""})
  end
  MenuData.CloseAll()
  MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'police_station_get_ammo_menu',
    { 
      title = Lang:t('menu.get_ammo'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
      getAmmo(data.current.value)
    end, 
    function() --cancel
      OpenWeaponMenu()
    end
  )
end

local function openWeaponRecords()
  QBCore.Functions.TriggerCallback('ndrp-police:callback:get-weapon-records',function(records_list)
    MenuData.CloseAll()
    SendReactMessage("ShowWeaponRecords",records_list)
    toggleNuiFrame(true)
  end)
end

local PoliceEquipmentMenuActions={
  ["get_weapon"]= function()
    openGetWeaponMenu()
  end,
  ["get_ammo"]= function()
    openGetAmmoMenu()
  end,
  ["weapon_records"]=function()
    openWeaponRecords()
  end
}


-- 主菜单所需组件
-- 打开领取警械菜单
function OpenWeaponMenu()
  MenuData.CloseAll()
  local elements={
    {label = Lang:t('menu.get_weapon'),  value = 'get_weapon', desc = ""},
    {label = Lang:t('menu.get_ammo'),  value = 'get_ammo', desc = ""},
    {label = Lang:t('menu.weapon_records'),  value = 'weapon_records', desc = ""},
  }
  MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'police_station_get_police_equipment_menu',
    { 
      title = Lang:t('menu.get_police_equipment'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
      if Config.Debug then print(data.current.value) end
      PoliceEquipmentMenuActions[data.current.value]() 
    end, 
    function() --cancel
      OpenMainMenu()
    end
  )
end

local function openCitizenMenu()

end

local function setUpWagon(WagonHash)
  local ped = PlayerPedId()
  print(WagonHash)
  local hash = GetHashKey(WagonHash)
  print(hash)
  if not IsModelInCdimage(hash) then return end
  RequestModel(hash)
  while not HasModelLoaded(hash) do
      Wait(0)
  end
  print('create wagon')
  local vehicle = CreateVehicle(hash,Config.PoliceDeskLocation[currentLoc].garageCoords,Config.PoliceDeskLocation[currentLoc].garageHeading, true, false)
  -- TaskWarpPedIntoVehicle(ped, vehicle, -1) -- Spawn the player onto "drivers" seat
  Citizen.InvokeNative(0x283978A15512B2FE, vehicle, true) -- Set random outfit variation / skin
  NetworkSetEntityInvisibleToNetwork(vehicle, true)
  TriggerClientEvent('QBCore:Notify', source, '巡逻马车已部署', 'success')
end

local function openWagonMenu()
  local elements={}
  for _,v in pairs(Config.WagonList) do
    table.insert(elements,{label=v.name,value=v.hash,desc=""})
  end
  MenuData.CloseAll()
  MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'police_station_get_wagon_menu',
    { 
      title = Lang:t('menu.police_wagon'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
      setUpWagon(data.current.value)
    end, 
    function() --cancel
      OpenWeaponMenu()
    end
  )
end

local MainMenu={
  ["weapon"]=function()
    OpenWeaponMenu()
  end,
  ["citizen"]=function()
    openCitizenMenu()
  end,
  ["wagon"]=function()
    openWagonMenu()
  end
}

function OpenMainMenu()
  MenuData.CloseAll()
  local elements={
    {label = Lang:t('menu.get_police_equipment'),  value = 'weapon', desc = ""},
    {label = Lang:t('menu.citizen_managment'),  value = 'citizen', desc = ""},
    {label = Lang:t('menu.police_wagon'),value='wagon',desc=""},
  }
  MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'police_station_menu',
    { 
      title = Lang:t('menu.main_menu'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
      MainMenu[data.current.value]() 
    end, 
    function(data, menu) --cancel
      MenuData.CloseAll()
    end
  )
end

-- 事件
-- 打开主菜单
RegisterNetEvent('ndrp-police:client:mainmenu',function(name)
  local PlayerData=QBCore.Functions.GetPlayerData()
  if PlayerData.job.name =='police' then
    currentLoc=name
    OpenMainMenu()
  end 
end)





-- RegisterNUICallback('ndrp-license-issue-idcard',function(data,cb)
  
--   -- debugPrint('idcard data sent by React', json.encode(data))
--   -- print(data)
--   -- print(QBCore.Debug(data))
--   local idcard_info={
--     firstName=data.firstName,
--     lastName=data.lastName,
--     gender=data.gender,
--     birth=data.birth,
--     address=data.address,
--     cid=data.cid,
--     code=data.code,
--     department=data.department,
--     alreadySigned=data.alreadySigned
--   }

--   toggleNuiFrame(false)
--   TriggerServerEvent('ndrp-license:server:create-signed-idcard',idcard_info,data.blankSlot)
--   cb({})
-- end)



