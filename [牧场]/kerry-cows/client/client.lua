local QBCore = exports['qb-core']:GetCoreObject()
local SpawnCows = {}

RegisterNetEvent('kerry-cows:client:updateCowData')
AddEventHandler('kerry-cows:client:updateCowData', function(data)
    Config.FarmCows = data
end)

Citizen.CreateThread(function()
    for cowbuys, v in pairs(Config.Cow) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '' .. v.name, {
            type = 'client',
            event = 'kerry-cows:client:cowbuy',
            args = {},
        })
        if v.showblip == true then
            local BuyCowBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(BuyCowBlip, Config.BlipBuy.blipSprite, 1)
            SetBlipScale(BuyCowBlip, Config.BlipBuy.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, BuyCowBlip, Config.BlipBuy.blipName)
        end
    end
end)

Citizen.CreateThread(function()
    for cowshedcow, v in pairs(Config.MenuCowshed) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '' .. v.name, {
            type = 'client',
            event = 'kerry-cows:client:cow',
            args = {},
        })
        if v.showblip == true then
            local CowshedBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(CowshedBlip, Config.BlipCowshed.blipSprite, 1)
            SetBlipScale(CowshedBlip, Config.BlipCowshed.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, CowshedBlip, Config.BlipCowshed.blipName)
        end
    end
end)


RegisterNetEvent('kerry-cows:client:cowbuy', function()
    exports['qb-menu']:openMenu({
        {
            header = Lang:t('menu.farm_cow'),
            icon = 'fas fa-solid fa-hat-cowboy',
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.buy_cow'),
            txt = '',
            icon = 'fas fa-solid fa-cow',
            params = {
				isServer = true,
                event = 'kerry-cows:server:cowssell',
                args = {}
            }
        },
    })
end)

RegisterNetEvent('kerry-cows:client:cow', function()
    local item = Config.CowshedKey
    local hasItem = QBCore.Functions.HasItem(item, 1)
    local requiresKey = Config.RequiresKey

    if not requiresKey or (requiresKey and hasItem) then
        exports['qb-menu']:openMenu({
            {
                header = Lang:t('menu.cowshed_cow'),
                icon = 'fas fa-solid fa-hat-cowboy',
                isMenuHeader = true, 
            },
            {
                header = Lang:t('menu.cowshed_cows'),
                icon = 'fas fa-solid fa-cow',
                params = {
                    event = 'kerry-cows:client:cowschek',
                    args = {}
                }
            },
            {
                header = Lang:t('menu.cowshed_cowsgo'),
                txt = '',
                icon = 'fas fa-solid fa-cow',
                params = {
                    event = 'kerry-cows:client:delSave',
                    args = {}
                }
            },
        })
    else
        QBCore.Functions.Notify(Lang:t('error.key_cowshed'), 'error')
    end
end)

RegisterNetEvent('kerry-cows:client:newcowspawn')
AddEventHandler('kerry-cows:client:newcowspawn', function()
	local newCows = {}
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
	
    dialog = exports['qb-input']:ShowInput({
        header = Lang:t('menu.name_cow'),
		icon = 'fas fa-solid fa-cow',
        submitText = '✔',
        inputs = {
            {
                text = 'Name',
                name = "cowname",
                type = "text",
                isRequired = true,
            },
        }
    })

    if dialog and dialog.cowname then
		hash = 'a_c_cow'
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(10)
    end
        outfit = math.random(1, 22)
        cowId = CreatePed(hash, playerCoords.x +7, playerCoords.y +11, playerCoords.z, true, true, false)
		Citizen.InvokeNative(0x23f74c2fda6e7c61, -1749618580, cowId)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, cowId, outfit, false)
        pos = GetEntityCoords(cowId)
        model = GetEntityModel(cowId)
	table.insert(newCows, cowId)
	  TriggerServerEvent('kerry-cows:server:cowsNew', cowId, pos, model, hash, dialog.cowname, outfit)
	QBCore.Functions.Notify(Lang:t('success.buys_cow') .. dialog.cowname, 'success', 5000)
	end
       
	for _, cowId in ipairs(newCows) do
		exports['qb-target']:AddTargetEntity(cowId, {
            options = {
                {
                    type = 'client',
                    label = dialog.cowname .. ': ' .. Lang:t('menu.lead_cow'),
					targeticon = 'fas fa-solid fa-cow',
					action = function()
                        TriggerEvent('kerry-cows:client:purchased', cowId)
					end,
                }
            },
            distance = 3.5,
        })
	end
end)

RegisterNetEvent('kerry-cows:client:purchased')
AddEventHandler('kerry-cows:client:purchased', function(cowId)
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    local cowOffset = vector3(0.0, 2.0, 0.0) 

    FreezeEntityPosition(cowId, false)
    TaskFollowToOffsetOfEntity(cowId, player, cowOffset.x, cowOffset.y, cowOffset.z, 1.0, -1, 0.0, 1)

    Citizen.CreateThread(function()
        while true do
            Wait(2000)
            local isZone = false
            for _, zoneCoords in ipairs(Config.CowZone) do
                local distancedoy = #(zoneCoords - GetEntityCoords(cowId))
                if distancedoy <= 10 then
                    isZone = true
                    break
                end
            end

            if isZone then
                FreezeEntityPosition(cowId, true)
                local newCoords = GetEntityCoords(cowId)
                TriggerServerEvent('kerry-cows:server:updateCowCoords', cowId, newCoords)
                TriggerServerEvent("kerry-cows:server:updateSpawnedFlag", 0, cowId)
                QBCore.Functions.Notify(Lang:t('success.brought_cow'), 'success')
                Wait(1000)
                DeletePed(cowId)
                break
            end
        end
    end)
end)

RegisterNetEvent('kerry-cows:client:cowschek')
AddEventHandler('kerry-cows:client:cowschek', function()
    local ped = PlayerPedId()
    if Config.RequiresKey then
        TriggerServerEvent("kerry-cows:server:upCows")
    else
        if Config.Debug then print('get cows by owner') end
        local ownerID = QBCore.Functions.GetPlayerData().citizenid
        if Config.Debug then print(ownerID) end
        --TriggerServerEvent("kerry-cows:server:get-cows-by-owner",ownerID)
        QBCore.Functions.TriggerCallback('kerry-cows:callback:get-cows-by-owner', function(cows)
            if Config.Debug then 
                print('cows')
                print(QBCore.Debug(cows)) 
            end
            Config.FarmCows=cows
            --if Config.Debug then print('FarmCows'..QBCore.Debug(Config.FarmCows)) end
    
            local nearbyCows = {}
            for i = 1, #cows do

                local pos = GetEntityCoords(ped)

                local cowbase = cows[i]
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, cowbase.x, cowbase.y, cowbase.z, true)

                if dist <= 50.0 then
                    local cowData = {
                        id = cowbase.id,
                        name = cowbase.cowname,
	        			state = cowbase.state
                    }
                    table.insert(nearbyCows, cowData) 
                end
            end
	        local menuData = {}
            table.insert(menuData, {
                header = Lang:t('menu.choose_cow'),
	        	icon = 'fas fa-solid fa-hat-cowboy',
                isMenuHeader = true
            })
        
            for i = 1, #nearbyCows do
                local cowspawns = nearbyCows[i]
                table.insert(menuData, {
                    header = cowspawns.name,
	        		icon = 'fas fa-solid fa-cow',
	        		txt = 'State: ' .. cowspawns.state .. '%',
                    params = {
                        event = 'kerry-cows:server:checkSpawnedFlag',
                        isServer = true,
                        args = {
	        				cowId = cowspawns.id,
	        				name = cowspawns.name
                        }
                    }
                })
            end
        
            exports['qb-menu']:openMenu(menuData)
        end)
    end
    
end)


RegisterNetEvent('kerry-cows:client:cowspawn')
AddEventHandler('kerry-cows:client:cowspawn', function(cowId, spawnedFlag)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
  
    for i = 1, #Config.FarmCows do
	
        local cowbase = Config.FarmCows[i]
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, cowbase.x, cowbase.y, cowbase.z, true)
        
        if dist <= 50.0 and cowbase.id == cowId then
            local cow = cowbase.model
            local outfit = cowbase.outfit
            
            RequestModel(cow)
            while not HasModelLoaded(cow) do
                Wait(10)
            end
            
            cowPed = CreatePed(cow, cowbase.x, cowbase.y, cowbase.z, true, true, false)
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, cowPed, outfit, false)
            Citizen.InvokeNative(0x23f74c2fda6e7c61, -1749618580, cowPed)
			SetEntityCanBeDamaged(cowPed, false)

            spawnedCow = { 
			cowId = cowPed, 
			cowname = cowbase.cowname,
			cowbaseId = cowbase.id
			}
		   
    TriggerServerEvent("kerry-cows:server:updateSpawnedFlag", 1, cowbase.id)
			
	if spawnedCow then
        table.insert(SpawnCows, spawnedCow)
    end
	for _, spawnedCow in ipairs(SpawnCows) do
	
		exports['qb-target']:AddTargetEntity(spawnedCow.cowId, {
            options = {
                {
                    type = 'client',
                    label = spawnedCow.cowname,
					targeticon = "fas fa-solid fa-cow",
					action = function()
                        TriggerEvent('kerry-cows:client:menucow', spawnedCow.cowId, spawnedCow.cowname, spawnedCow.cowbaseId)
					end,
                },
            },
            distance = 3.5,
        })
			end
        end
    end
end)

RegisterNetEvent('kerry-cows:client:menucow', function(cowId, cowname, cowbaseId)
    exports['qb-menu']:openMenu({
        {
            header = cowname,
            isMenuHeader = true,
			icon = 'fas fa-solid fa-cow',
        },
		{
            header = Lang:t('menu.state_menu'),
			icon = 'fas fa-heart',
            params = {
				isServer = true,
                event = 'kerry-cows:server:stan',
                args = {
				cowId = cowId,
				cowbaseId = cowbaseId
				}
            }
        },
        {
            header = Lang:t('menu.lead_menu'),
			icon = 'fas fa-solid fa-person-walking',
            params = {
                event = 'kerry-cows:client:lead',
                args = {
				cowId = cowId,
				cowbaseId = cowbaseId
				}
            }
        },
		{
            header = Lang:t('menu.to_milk'),
			icon = 'fas fa-solid fa-glass-water-droplet',
            params = {
                event = 'kerry-cows:client:milkcow',
                args = {
				cowId = cowId,
				cowbaseId = cowbaseId
				}
            }
        },
		{
            header = Lang:t('menu.to_graze'),
			icon = 'fas fa-sun',
            params = {
                event = 'kerry-cows:client:pas',
                args = {
				cowId = cowId,
				cowbaseId = cowbaseId
				}
            }
        },
		{
            header = Lang:t('menu.leads_cowshed'),
			icon = 'fas fa-solid fa-chart-simple',
            params = {
                event = 'kerry-cows:client:delcowSave',
                args = {
				cowId = cowId,
				cowbaseId = cowbaseId
				}
            }
        },
        {
            header = Lang:t('menu.close_menu'),
			icon = 'fas fa-xmark',
            txt = '',
            params = {
                event = 'qb-menu:closeMenu',
            }
        },
    })
end)

RegisterNetEvent('kerry-cows:client:milkcow')
AddEventHandler('kerry-cows:client:milkcow', function(data)
    local cowId = data.cowId
    local cowbaseId = data.cowbaseId
    local animal = cowId
    local doycoor = Config.CowZone
    local player = PlayerPedId()
	local flagdis = false

    for _, zoneCoord in ipairs(doycoor) do
        local distance = #(zoneCoord - GetEntityCoords(animal))

        if distance <= 20 then
		flagdis = false
            RequestAnimDict('mini_games@story@mar5@milk_cow')
            while not HasAnimDictLoaded('mini_games@story@mar5@milk_cow') do
                Wait(100)
            end
            FreezeEntityPosition(animal, true)
            destinationCoords = GetEntityCoords(animal)
			SetBlockingOfNonTemporaryEvents(animal, true)
            Wait(100)

            local playerCoords = GetEntityCoords(player)
            local playerDistance = #(playerCoords - destinationCoords)
            if playerDistance <= 2 then
                ClearPedTasks(player)
                RequestAnimDict("mech_milking")
                while not HasAnimDictLoaded("mech_milking") do
                    Wait(100)
                end
				Citizen.InvokeNative(0xE1EF3C1216AFF2CD, animal, 0, 0)
				SetEntityCanBeDamaged(animal, false)
				FreezeEntityPosition(animal, true)
				SetBlockingOfNonTemporaryEvents(animal, true)
				TaskPlayAnim(animal, 'mini_games@story@mar5@milk_cow', 'cow_idle', 1.0, 1.0, -1, 1, 0, false, false, false)
				SetEntityInvincible(animal, true)
                TaskPlayAnim(player, "mech_milking", "milking_loop_player", 3.0, 3.0, -1, 1, 0, false, false, false)
				FreezeEntityPosition(player, true)
				Citizen.InvokeNative(0x706D57B0F50DA710, "MAR5_MILKING")
                QBCore.Functions.Notify(Lang:t('primary.milking_cow'), 'primary', Config.WaitMilking)
                Wait(Config.WaitMilking)  
				Citizen.InvokeNative(0x706D57B0F50DA710, "MC_MUSIC_STOP") 
				FreezeEntityPosition(player, false)
                ClearPedTasks(player)
                Wait(100)
                TriggerServerEvent("kerry-cows:server:doyCow", cowbaseId)
                FreezeEntityPosition(animal, false)
				SetBlockingOfNonTemporaryEvents(animal, false)
                Citizen.InvokeNative(0xE1EF3C1216AFF2CD, animal, 0, 0)
                break 
				
			 else
               QBCore.Functions.Notify(Lang:t('primary.closer_must'), 'primary', 3000)
			 return
          end
		   else
			flagdis = true
        end
    end
	if flagdis then
	QBCore.Functions.Notify(Lang:t('error.milk_ranch'), 'error', 3000)
	flagdis = false
	end
end)

RegisterNetEvent('kerry-cows:client:lead')
AddEventHandler('kerry-cows:client:lead', function(data)
    local cowId = data.cowId
    local cowbaseId = data.cowbaseId
    local animal = cowId
    local player = PlayerPedId()
    local cowOffset = vector3(0.0, 2.0, 0.0) 

    FreezeEntityPosition(animal, false)
    TaskFollowToOffsetOfEntity(animal, player, cowOffset.x, cowOffset.y, cowOffset.z, 1.0, -1, 0.0, 1)
end)

RegisterNetEvent('kerry-cows:client:pas')
AddEventHandler('kerry-cows:client:pas', function(data)
    local isInZone = false
    local cowId = data.cowId
    local cowbaseId = data.cowbaseId
    local animal = cowId

    for _, zoneCoords in ipairs(Config.CowZone) do
        local distance = #(zoneCoords - GetEntityCoords(animal))
        if distance <= 200 then
            isInZone = true
            break
        end
    end

    if isInZone then
        QBCore.Functions.Notify(Lang:t('error.lead_ranch'), 'error', 3000)
    else
        local availableScenarios = {
            'WORLD_ANIMAL_COW_EATING_GROUND',
            'WORLD_ANIMAL_COW_GRAZING',
            'WORLD_ANIMAL_COW_RESTING',
            'WORLD_ANIMAL_COW_SLEEPING'
        }

        local function getRandomScenario()
            local randomIndex = math.random(1, #availableScenarios)
            return availableScenarios[randomIndex]
        end

        Citizen.InvokeNative(0xE1EF3C1216AFF2CD, animal, 0, 0)
        SetEntityInvincible(animal, true)
        SetEntityAsMissionEntity(animal, true, true)

        local randomScenario = getRandomScenario()
        local anim = randomScenario
        TaskStartScenarioInPlace(animal, GetHashKey(anim), -1, true, false, false, false)

        TriggerServerEvent('kerry-cows:server:startImprovement', cowbaseId)
        QBCore.Functions.Notify(Lang:t('success.cow_grazing'), 'success', 3000)
    end
end)

local cowsToDelete = {} 

RegisterNetEvent('kerry-cows:client:delcowSave')
AddEventHandler('kerry-cows:client:delcowSave', function(data)
    local cowId = data.cowId
    local isInZone = false
    for _, zoneCoords in ipairs(Config.CowZone) do
        local cowCoords = GetEntityCoords(cowId)
        local distance = #(cowCoords - zoneCoords)
        if distance <= 20 then
            isInZone = true
            break
        end
    end

    if isInZone then
        cowbasedelId = data.cowbaseId
		FreezeEntityPosition(cowId, true)
        delnewCoords = GetEntityCoords(cowId)
        TriggerServerEvent('kerry-cows:server:updateCowCoords', cowbasedelId, delnewCoords)
        Wait(1000)
        DeletePed(cowId)
        TriggerServerEvent("kerry-cows:server:updateSpawnedFlag", 0, cowbasedelId)

        
        table.insert(cowsToDelete, {
            cowId = cowId,
            cowbaseId = cowbasedelId
        })
    else
        QBCore.Functions.Notify(Lang:t('error.should_cowshed'), 'error')
    end
end)

RegisterNetEvent('kerry-cows:client:delSave')
AddEventHandler('kerry-cows:client:delSave', function()
    local remainingCows = {} 

    for i = 1, #SpawnCows do
        local cowSpawned = SpawnCows[i]
        local cowId = cowSpawned.cowId
        local cowbaseId = cowSpawned.cowbaseId
        local cowname = cowSpawned.cowname
        local cowCoords = GetEntityCoords(cowId)
        local isInZon = false

        for _, zoneCoords in ipairs(Config.CowZone) do
            local distance = #(cowCoords - zoneCoords)

            if distance <= 20 then
                isInZon = true
                break
            end
        end

        if isInZon then
            delCoords = GetEntityCoords(cowId)
            TriggerServerEvent('kerry-cows:server:updateCowCoords', cowbaseId, delCoords)
            Wait(1000)
            DeletePed(cowId)
            TriggerServerEvent("kerry-cows:server:updateSpawnedFlag", 0, cowbaseId)
        else
            QBCore.Functions.Notify(cowname ..' far from the cowshed!', 'error')
            table.insert(remainingCows, cowSpawned) 
            
        end
    end

    for _, cowToDelete in ipairs(cowsToDelete) do
        for i = #remainingCows, 1, -1 do
            local cowSpawned = remainingCows[i]
            if cowSpawned.cowId == cowToDelete.cowId and cowSpawned.cowbaseId == cowToDelete.cowbaseId then
                table.remove(remainingCows, i)
                break
            end
        end
    end

    if #remainingCows == 0 then
        SpawnCows = {} 
    else
        SpawnCows = remainingCows 
    end
    cowsToDelete = {}
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    if Config.Debug then print('login') end
    TriggerServerEvent('kerry-cows:server:setCowSpawnedFlag',0)
end)

-- RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
--     if Config.Debug then print('logout') end
--     TriggerServerEvent('kerry-cows:server:setCowSpawnedFlag',0)
-- end)