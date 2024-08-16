local QBCore = exports['qb-core']:GetCoreObject()

-- valentine --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('valentine-storage-1', vector3(-179.3819, 648.2138, 113.58127), QBCore.Shared.Keybinds['J'], '打开瓦伦丁存储', {
		type = 'client',
		event = 'qb-storage:client:valstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-179.3819, 648.2138, 113.58127))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:valstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'valstore'..cid, {
        maxweight = Config.ValentineMaxWeight,
        slots = Config.ValentineMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'valstore'..cid)
	end)
end)

-- blackwater --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('blackwater-storage-1', vector3(-733.6947, -1253.501, 44.734077), QBCore.Shared.Keybinds['J'], '储水', {
		type = 'client',
		event = 'qb-storage:client:blkstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-734.923, -1254.389, 44.734107))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:blkstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'blkstore'..cid, {
        maxweight = Config.BlackwaterMaxWeight,
        slots = Config.BlackwaterMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'blkstore'..cid)
	end)
end)

-- stdenis --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('stdenis-storage-1', vector3(2669.6577, -1500.203, 45.968963), QBCore.Shared.Keybinds['J'], '打开 圣丹尼斯 存储', {
		type = 'client',
		event = 'qb-storage:client:denstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2669.6577, -1500.203, 45.968963))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:denstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'denstore'..cid, {
        maxweight = Config.StdenisMaxWeight,
        slots = Config.StdenisMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'denstore'..cid)
	end)
end)

-- rhodes --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('rhodes-storage-1', vector3(1231.0391, -1277.829, 76.021591), QBCore.Shared.Keybinds['J'], '打开罗德存储', {
		type = 'client',
		event = 'qb-storage:client:rhostorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1231.0391, -1277.829, 76.021591))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:rhostorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'rhostore'..cid, {
        maxweight = Config.RhodesMaxWeight,
        slots = Config.RhodesMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'rhostore'..cid)
	end)
end)

-- annesburg --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('annesburg-storage-1', vector3(2934.8232, 1306.6634, 44.47974), QBCore.Shared.Keybinds['J'], '打开安尼斯堡仓库', {
		type = 'client',
		event = 'qb-storage:client:annstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2934.8232, 1306.6634, 44.47974))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:annstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'annstore'..cid, {
        maxweight = Config.AnnesburgMaxWeight,
        slots = Config.AnnesburgMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'annstore'..cid)
	end)
end)

-- strawberry --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('strawberry-storage-1', vector3(-1752.021, -386.3956, 156.49397), QBCore.Shared.Keybinds['J'], '打开草莓储藏室', {
		type = 'client',
		event = 'qb-storage:client:strstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-1752.021, -386.3956, 156.49397))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:strstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'strstore'..cid, {
        maxweight = Config.StrawberryMaxWeight,
        slots = Config.StrawberryMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'strstore'..cid)
	end)
end)

-- tumbleweed --
Citizen.CreateThread(function()
	exports['qb-core']:createPrompt('tumbleweed-storage-1', vector3(-5494.741, -2959.111, -0.69497), QBCore.Shared.Keybinds['J'], '访问风滚草储藏室', {
		type = 'client',
		event = 'qb-storage:client:tumstorage',
		args = { false, true, false },
	})
	local StorageBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-5494.741, -2959.111, -0.69497))
	SetBlipSprite(StorageBlip, Config.Blip.blipSprite, 1)
	SetBlipScale(StorageBlip, Config.Blip.blipScale)
	Citizen.InvokeNative(0x9CB1A1623062F402, StorageBlip, Config.Blip.blipName)
end)

RegisterNetEvent('qb-storage:client:tumstorage', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
	local cid = PlayerData.citizenid
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'tumstore'..cid, {
        maxweight = Config.TumbleweedMaxWeight,
        slots = Config.TumbleweedMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'tumstore'..cid)
	end)
end)