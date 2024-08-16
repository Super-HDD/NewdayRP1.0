local QBCore = exports['qb-core']:GetCoreObject()
local KIT_POCKETWATCH = GetHashKey('kit_player_pocketwatch')
local PRIMARY_ITEM = GetHashKey('PrimaryItem')
local INPUT_CONTEXT_B = GetHashKey('INPUT_CONTEXT_B')
local INPUT_GAME_MENU_CANCEL = GetHashKey('INPUT_GAME_MENU_CANCEL')

local function handlePocketWatchInteraction(item, interactionType, controlToRelease)
	local prop = CreateObject(GetHashKey(item.prop), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
	TaskItemInteraction_2(PlayerPedId(), KIT_POCKETWATCH, prop, PRIMARY_ITEM, GetHashKey(interactionType), 1, 0, -1.0)
	Wait(500)

	while Citizen.InvokeNative(0xEC7E480FF8BD0BED, PlayerPedId()) and not IsControlPressed(0, controlToRelease) do
		Wait(0)	
	end

	ClearPedTasks(PlayerPedId())
end

RegisterNetEvent("qb-pocketwatch:usewatch")
AddEventHandler("qb-pocketwatch:usewatch", function(item)
	if item.type == 'Firstperson' then
		handlePocketWatchInteraction(item, 'POCKET_WATCH_INSPECT_UNHOLSTER', INPUT_CONTEXT_B)
	elseif item.type == 'Thirdperson' then
		handlePocketWatchInteraction(item, 'POCKETWATCH@D6-5_H1-5_InspectZ_HOLD', INPUT_GAME_MENU_CANCEL)
	end
end)

AddEventHandler('onResourceStop', function (resourceName)
    if resourceName == GetCurrentResourceName() then
		ClearPedTasks(PlayerPedId())
    end
end)
