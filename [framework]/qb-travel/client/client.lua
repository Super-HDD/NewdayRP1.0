local QBCore = exports['qb-core']:GetCoreObject()

-- travel from stdenis to guarma
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('stdenis-buy-ticket', vector3(2663.5056, -1543.155, 45.969764), QBCore.Shared.Keybinds['ENTER'], '买一张船票', {
		type = 'server',
		event = 'qb-travel:server:buyticket',
		args = { Config.TicketCost },
	})
	exports['qb-core']:createPrompt('stdenis-guarma', vector3(2663.5056, -1543.155, 45.969764), QBCore.Shared.Keybinds['J'], '正在前往瓜马岛旅行，老凯文祝您一路顺风', { -- [J]
		type = 'client',
		event = 'qb-travel:client:guarma_boat',
		args = {},
	})
	local PortBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2663.5056, -1543.155, 45.969764))
	SetBlipSprite(PortBlip, 2033397166, 1)
	SetBlipScale(PortBlip, 0.2)   
end)

-- from guarma to stdenis
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('guarma-buy-ticket', vector3(1268.6583, -6851.772, 43.318504), QBCore.Shared.Keybinds['ENTER'], '买一张船票', {
		type = 'server',
		event = 'qb-travel:server:buyticket',
		args = { Config.TicketCost },
	})
	exports['qb-core']:createPrompt('guarma-stdenis', vector3(1268.6583, -6851.772, 43.318504), QBCore.Shared.Keybinds['J'], '前往圣丹尼斯港口，欢迎回来', {
		type = 'client',
		event = 'qb-travel:client:stdenis_boat',
		args = {},
	})
	local PortBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1268.6583, -6851.772, 43.318504))
	SetBlipSprite(PortBlip, 2033397166, 1)
	SetBlipScale(PortBlip, 0.2)
end)

-- boat travel to guarma
RegisterNetEvent("qb-travel:client:guarma_boat")
AddEventHandler("qb-travel:client:guarma_boat", function()
	local hasItem = QBCore.Functions.HasItem('boatticket', 1)
	if hasItem then
		TriggerServerEvent('qb-travel:server:removeItem', 'boatticket', 1)
		-- tp bateau
		DoScreenFadeOut(500)
		Wait(1000)
		Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), 2652.301, -1586.043, 48.337059 -1, 183.40074)
		Wait(1500)
		DoScreenFadeIn(1800)
		SetCinematicModeActive(true)
		Wait(10000)
		Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, '前往瓜马岛港口', '你的船正在航行', '祝你旅途愉快 ...')
		Wait(20000)
		-- tp guarma
		Citizen.InvokeNative(0x74E2261D2A66849A, 1)
		Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277)
		Citizen.InvokeNative(0xE8770EE02AEE45C2, 1)
		-- fin tp
		Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), 1268.4954, -6853.771, 43.318477 -1, 241.44442)
		SetCinematicModeActive(false)
		ShutdownLoadingScreen()
	else
		QBCore.Functions.Notify('你没有船票!', 'error')
	end
end)

-- boat travel to stdenis
RegisterNetEvent("qb-travel:client:stdenis_boat")
AddEventHandler("qb-travel:client:stdenis_boat", function()
	local hasItem = QBCore.Functions.HasItem('boatticket', 1)
	if hasItem then
		-- tp bateau
		Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, '前往圣丹尼斯港口', '你的船正在航行', '祝你旅途愉快 ...')
		Wait(30000)
		-- tp guarma
		Citizen.InvokeNative(0x74E2261D2A66849A, 0)
		Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
		Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
		-- fin tp
		Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), 2663.2485, -1544.214, 45.969753 -1, 266.12268)
		ShutdownLoadingScreen()
		DoScreenFadeIn(1000)
		Wait(1000)
		SetCinematicModeActive(false)
	else
		QBCore.Functions.Notify('你没有船票!', 'error')
	end
end)

----- toggle guarma world stuff -----
function SetGuarmaWorldhorizonActive(toggle)
	Citizen.InvokeNative(0x74E2261D2A66849A , toggle)
end

function SetWorldWaterType(waterType)
	Citizen.InvokeNative(0xE8770EE02AEE45C2, waterType)
end

function SetWorldMapType(mapType)
	Citizen.InvokeNative(0xA657EC9DBC6CC900, mapType)
end

function IsInGuarma()
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
	return x >= 0 and y <= -4096
end

local GuarmaMode = false

CreateThread(function()
	while true do
		Wait(500)

		if IsInGuarma() then
			if not GuarmaMode then
				SetGuarmaWorldhorizonActive(true);
				SetWorldWaterType(1);
				SetWorldMapType(`guarma`)
				GuarmaMode = true
			end
		else
			if GuarmaMode then
				SetGuarmaWorldhorizonActive(false);
				SetWorldWaterType(0);
				SetWorldMapType(`world`)
				GuarmaMode = false
			end
		end
	end
end)
----- end guarma world stuff -----

