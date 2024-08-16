-- Variables

local QBCore = exports['qb-core']:GetCoreObject()
local deployeddecks = nil

-- Functions

local function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Wait(5)
  end
end

local function helpText(text)
	SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- target
Citizen.CreateThread(function()

local djdecksprop = {
    `p_barricade05x`,
    }
    exports['qb-target']:AddTargetModel(djdecksprop, {
        options = {
            {
				type = "client",
				event = "QB_barrier:client:pickupDJEquipment",
                icon = "fas fa-undo",
                label = "拆掉警用路障",
            },
        },
        distance = 3.0
    })
end)

-- Events

-- place dj equipment
RegisterNetEvent('QB_barrier:client:placeDJEquipment', function()
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    local forward = GetEntityForwardVector(PlayerPedId())
    local x, y, z = table.unpack(coords + forward * 2.5)
	TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), -1, true, "StartScenario", 0, false)
	Wait(500)
	ClearPedTasks(PlayerPedId())
    local object = CreateObject(GetHashKey('p_barricade05x'), x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(object)
    SetEntityHeading(object, heading)
    FreezeEntityPosition(object, true)
    deployeddecks = NetworkGetNetworkIdFromEntity(object)
end)


RegisterNetEvent('QB_barrier:client:pickupDJEquipment', function()
    local obj = NetworkGetEntityFromNetworkId(deployeddecks)
    local objCoords = GetEntityCoords()
    NetworkRequestControlOfEntity(obj)
    SetEntityAsMissionEntity(obj,false,true)
    DeleteEntity(obj)
    DeleteObject(obj)
    if not DoesEntityExist(obj) then
        TriggerServerEvent('QB_barrier:server:pickedup', deployeddecks)
        TriggerServerEvent('QB_barrier:server:pickeupdecks')
        deployeddecks = nil
    end
    Wait(500)
    ClearPedTasks(PlayerPedId())
end)
