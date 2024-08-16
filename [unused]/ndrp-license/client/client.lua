local QBCore = exports['qb-core']:GetCoreObject()

local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end


-- 用于测试发放身份证
-- RegisterCommand('idcard', function()
--   -- TODO:检查身份

--   --显示签发身份证页面
--   SendReactMessage('displayIDcard',nil)
--   toggleNuiFrame(true)
--   debugPrint('Show NUI frame')
-- end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  debugPrint('Hide NUI frame')
  cb({})
end)

RegisterNUICallback('ndrp-license-issue-idcard',function(data,cb)
  
  -- debugPrint('idcard data sent by React', json.encode(data))
  -- print(data)
  -- print(QBCore.Debug(data))
  local idcard_info={
    firstName=data.firstName,
    lastName=data.lastName,
    gender=data.gender,
    birth=data.birth,
    address=data.address,
    cid=data.cid,
    code=data.code,
    department=data.department,
    alreadySigned=data.alreadySigned
  }

  toggleNuiFrame(false)
  TriggerServerEvent('ndrp-license:server:create-signed-idcard',idcard_info,data.blankSlot)
  cb({})
end)

RegisterNetEvent('ndrp-license:server:display-signed-idcard',function(info,slot)
  info.blankSlot=slot
  SendReactMessage('displayIDcard',info)
  toggleNuiFrame(true)
end)

