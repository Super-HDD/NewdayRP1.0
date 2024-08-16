local QBCore = exports['qb-core']:GetCoreObject()

local CoolDown = 0
local doorLockPrompt = GetRandomIntInRange(0, 0xffffff)
local lockPrompt = nil
local doorStatus = ''
local createdEntries = {}
local MenuData

TriggerEvent("qb-menubase:getData", function(call)
    MenuData = call
end)

-- lock jail front gates
Citizen.CreateThread(function()
    for k,v in pairs(Config.JailDoors) do
        Citizen.InvokeNative(0xD99229FE93B46286,v,1,1,0,0,0,0)
        Citizen.InvokeNative(0x6BAB9442830C7F53,v,1)
    end
end)

local DoorLockPrompt = function()
    local str = '按'
    local stra = CreateVarString(10, 'LITERAL_STRING', str)

    lockPrompt = PromptRegisterBegin()
    PromptSetControlAction(lockPrompt, QBCore.Shared.Keybinds['ENTER'])
    PromptSetText(lockPrompt, stra)
    PromptSetEnabled(lockPrompt, 1)
    PromptSetVisible(lockPrompt, 1)
    PromptSetHoldMode(lockPrompt, true)
    PromptSetGroup(lockPrompt, doorLockPrompt)
    PromptRegisterEnd(lockPrompt)

    createdEntries[#createdEntries + 1] = {type = "PROMPT", handle = lockPrompt}
    createdEntries[#createdEntries + 1] = {type = "PROMPT", handle = doorLockPrompt}
end

CreateThread(function()
    while true do
        for _, doorID in pairs(Config.DoorList) do
            if doorID.doors then
                for _, v in pairs(doorID.doors) do
                    if not v.object or not DoesEntityExist(v.object) then
                        local shapeTest = StartShapeTestBox(v.objCoords, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
                        local _, _, _, _, entityHit = GetShapeTestResult(shapeTest)
                        v.object = entityHit
                    end
                end
            else
                if not doorID.object or not DoesEntityExist(doorID.object) then
                    local shapeTest = StartShapeTestBox(doorID.objCoords, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, true, 16)
                    local _, _, _, _, entityHit = GetShapeTestResult(shapeTest)
                    doorID.object = entityHit
                end
            end
        end

        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    DoorLockPrompt()

    while true do
        Wait(4)
        local ped = PlayerPedId()
        local isdead = IsEntityDead(ped)
        local cuffed = IsPedCuffed(ped)
        local hogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, ped)
        local lassoed = Citizen.InvokeNative(0x9682F850056C9ADE, ped)
        local playerCoords, letSleep = GetEntityCoords(ped), true
        local breakdown = isdead or cuffed or hogtied or lassoed

        if breakdown then goto continue end

        for k,doorID in ipairs(Config.DoorList) do
            local distance = #(playerCoords - doorID.textCoords)
            local maxDistance = 1.25

            if doorID.distance then
                maxDistance = doorID.distance
            end

            if distance < 5 then
                letSleep = false

                if doorID.doors then
                    if doorID.locked then
                        for i = 1, #doorID.doors do
                            local doors = doorID.doors[i]

                            if Citizen.InvokeNative(0x160AA1B32F6139B8, doors.doorid) ~= 3 then
                                Citizen.InvokeNative(0xD99229FE93B46286, doors.doorid,1,1,0,0,0,0)
                                Citizen.InvokeNative(0x6BAB9442830C7F53, doors.doorid, 3)
                            end
                            Citizen.InvokeNative(0xB6E6FBA95C7324AC, doors.doorid, 0.0, true)
                            doorStatus = '~e~锁定~q~'
                        end
                    else
                        for i = 1, #doorID.doors do
                            local doors = doorID.doors[i]

                            if Citizen.InvokeNative(0x160AA1B32F6139B8, doors.doorid) ~= false then
                                Citizen.InvokeNative(0xD99229FE93B46286, doors.doorid,1,1,0,0,0,0)
                                Citizen.InvokeNative(0x6BAB9442830C7F53, doors.doorid, 0)
                            end
                        end
                        FreezeEntityPosition(doorID.object, false)
                        doorStatus = '~t6~解锁~q~'
                    end

                else
                    if doorID.locked then
                        if Citizen.InvokeNative(0x160AA1B32F6139B8, doorID.doorid) ~= 3 then
                            Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorid,1,1,0,0,0,0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53, doorID.doorid, 3)
                        end
                        Citizen.InvokeNative(0xB6E6FBA95C7324AC, doorID.doorid, 0.0, true)
                        doorStatus = '~e~锁定~q~'
                    else
                        if Citizen.InvokeNative(0x160AA1B32F6139B8, doorID.doorid) ~= false then
                            Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorid,1,1,0,0,0,0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53, doorID.doorid, 0)
                        end
                        FreezeEntityPosition(doorID.object,false)
                        doorStatus = '~t6~解锁~q~'
                    end
                end
            end

            if distance < maxDistance then
                if distance < 1.5 then
                    local label = CreateVarString(10, 'LITERAL_STRING', '门状态: '..doorStatus)

                    PromptSetActiveGroupThisFrame(doorLockPrompt, label)

                    if PromptHasHoldModeCompleted(lockPrompt) and CoolDown < 1 then
                        CoolDown = 1000
                        local state = not doorID.locked
                        TriggerServerEvent("qb-doorlock:updatedoorsv", k, state)
                    end
                end
            end

            if CoolDown > 0 then
                CoolDown = CoolDown - 1
            end
        end

        ::continue::

        if letSleep then
            Wait(500)
        end
    end
end)

RegisterNetEvent('qb-doorlock:changedoor')
AddEventHandler('qb-doorlock:changedoor', function(doorID, state)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped, true)
    local prop_name = GetHashKey('P_KEY02X')
    local doorCoords = Config.DoorList[doorID].textCoords
    local dx = doorCoords.x - pedCoords.x
    local dy = doorCoords.y - pedCoords.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(prop_name, x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")

    SetPedDesiredHeading(ped, heading)

    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        if not HasAnimDictLoaded("script_common@jail_cell@unlock@key") then
            RequestAnimDict("script_common@jail_cell@unlock@key")

            while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
                Wait(100)
                RequestAnimDict("script_common@jail_cell@unlock@key")
            end
        end

        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        RemoveAnimDict("script_common@jail_cell@unlock@key")
        Wait(750)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        Wait(250)
        TriggerServerEvent('qb-doorlock:updateState', doorID, state, function(cb) end)
        Wait(1500)
        ClearPedSecondaryTask(ped)
        DeleteObject(prop)
    end
end)

-- Set State for a Door
RegisterNetEvent('qb-doorlock:setState')
AddEventHandler('qb-doorlock:setState', function(doorID, state)
    Config.DoorList[doorID].locked = state
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for i = 1, #createdEntries do
        if createdEntries[i].type == "PROMPT" then
            PromptDelete(createdEntries[i].handle)
        end
    end
end)

--#region 钥匙系统
--#region 本地变量申明
local KeySubMenuActions={
    ['givekey']=function(Name,DoorID)
        GiveKeyAction(Name,DoorID)
    end,
    ['dropkey']=function(Name,DoorID)
        DropKeyAction(Name,DoorID)
    end
}
--#endregion
--#region 注册事件
RegisterNetEvent('ndrp-doorlock:client:open-keys-container')
--#endregion

--#region handler event
AddEventHandler('ndrp-doorlock:client:open-keys-container',function(data)
    OpenKeysContainerMainMenu(data)
end)
--#endregion

--#region 函数
function OpenKeysContainerMainMenu(data)
    local KeysList=data.KeysList
    MenuData.CloseAll()
    local elements={}
    for i=1,#KeysList do
        table.insert(elements,{label = KeysList[i].Name,  value = KeysList[i].DoorID, desc = ""})
    end
    MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'keys_container_main_menu',
    { 
      title = Lang:t('menu.main_menu'), 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
        OpenKeySubMenu()
    end, 
    function(data, menu) --cancel
      MenuData.CloseAll()
    end
  )
end

function OpenKeySubMenu(KeyName,DoorID)
    local elements={
        {label = "给予",  value = "givekey", desc = ""},
        {label = "丢弃",  value = "dropkey", desc = ""}
    }
    MenuData.CloseAll()
    MenuData.Open(
    'default', 
    GetCurrentResourceName(), 
    'keys_sub_menu',
    { 
      title = KeyName, 
      subtext = Lang:t('menu.system_name'), 
      align = Lang:t('menu.align'), 
      elements = elements
    }, 
    function(data, menu)
        KeySubMenuActions[data.curreent.value](KeyName,DoorID)
    end, 
    function(data, menu) --cancel
      MenuData.CloseAll()
    end
  )
end

function AddKey(Name,DoorID)
    --检查玩家是否拥有钥匙串
   local ped=PlayerPedId()
   local player=QBCore.Functions.GetPlayer(PlayerId())
   QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if not result then
            exports['qb-core']:AddItem('keys_container', {})
        end
        exports['qb-inventory']:SetItemdata()
   end,'keys_container')
end

function GiveKeyAction(Name,DoorID)

end

function DropKeyAction(Name,DoorID)

end
--#endregion

--#endregion 
