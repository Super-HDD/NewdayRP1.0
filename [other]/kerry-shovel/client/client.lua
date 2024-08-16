local QBCore = exports['qb-core']:GetCoreObject()

local DelPrompt
local ShovelPrompt
local prompt, prompt2 = false, false
local shovelObject = nil
local isHoldingShovel = false
local isDigging = false
local createdObjects = {}


function SetupShovelPrompt()
    Citizen.CreateThread(function()
        local str = '寻找鱼饵'
        ShovelPrompt = PromptRegisterBegin()
        PromptSetControlAction(ShovelPrompt, 0x07CE1E61)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ShovelPrompt, str)
        PromptSetEnabled(ShovelPrompt, false)
        PromptSetVisible(ShovelPrompt, false)
        PromptSetHoldMode(ShovelPrompt, true)
        PromptRegisterEnd(ShovelPrompt)
    end)
end

function SetupDelPrompt()
    Citizen.CreateThread(function()
        local str = '放下铲子'
        DelPrompt = PromptRegisterBegin()
        PromptSetControlAction(DelPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(DelPrompt, str)
        PromptSetEnabled(DelPrompt, false)
        PromptSetVisible(DelPrompt, false)
        PromptSetHoldMode(DelPrompt, true)
        PromptRegisterEnd(DelPrompt)
    end)
end

Citizen.CreateThread(function()
SetupShovelPrompt()
SetupDelPrompt()
    while true do
        Citizen.Wait(1000)
       
        if isHoldingShovel then
           
            if prompt and PromptHasHoldModeCompleted(ShovelPrompt) then
                prompt = false
                PromptSetEnabled(DelPrompt, false)
                PromptSetVisible(DelPrompt, false)
                PromptSetEnabled(ShovelPrompt, false)
                PromptSetVisible(ShovelPrompt, false)
                TriggerEvent('kerry-shovel:client:startanim')
            end
           
            if prompt2 and PromptHasHoldModeCompleted(DelPrompt) then
                prompt2 = false
                PromptSetEnabled(DelPrompt, false)
                PromptSetVisible(DelPrompt, false)
                PromptSetEnabled(ShovelPrompt, false)
                PromptSetVisible(ShovelPrompt, false)
                TriggerEvent('kerry-shovel:client:stop')
                prompt = false
            end
        end
    end
end)

RegisterNetEvent('kerry-shovel:client:startanim')
AddEventHandler('kerry-shovel:client:startanim', function()
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player, true)
    local nearestObject = nil
    local nearestObjectDistance = nil

    for _, obj in ipairs(createdObjects) do
        local objCoords = GetEntityCoords(obj)
        local distance = #(playerCoords - objCoords)
        if not nearestObjectDistance or distance < nearestObjectDistance then
            nearestObjectDistance = distance
            nearestObject = obj
        end
    end

    if nearestObject and nearestObjectDistance <= 1.5 then
	Wait(500)
	QBCore.Functions.Notify('你已经在这里挖过了！', 'error', 3000)
	prompttrue()
		return 
    else
    if not isDigging then
        isDigging = true
        local player = PlayerPedId()
        local waitrand = math.random(10000, 25000)
        local chance = math.random(1, 100)
        local dirt = 'mp005_p_dirtpile_tall_unburied'
		
		RequestModel(dirt)
            while not HasModelLoaded(dirt) do
                Citizen.Wait(1)
            end
			
        RequestAnimDict("amb_work@world_human_gravedig@working@male_b@base")
        while not HasAnimDictLoaded("amb_work@world_human_gravedig@working@male_b@base") do
            Wait(100)
        end

        FreezeEntityPosition(player, true)
        TaskPlayAnim(player, "amb_work@world_human_gravedig@working@male_b@base", "base", 3.0, 3.0, -1, 1, 0, false, false, false)
        Wait(waitrand)
		
		local playerCoords = GetEntityCoords(player)
		local playerForwardVector = GetEntityForwardVector(player)
		local offsetX = 0.6 

		local objectX = playerCoords.x + playerForwardVector.x * offsetX
		local objectY = playerCoords.y + playerForwardVector.y * offsetX
		local objectZ = playerCoords.z - 1

		object = CreateObject(dirt, objectX, objectY, objectZ, true, true, false)
		table.insert(createdObjects, object) 
		objectIndex = #createdObjects 
		
        if chance <= 95 then
                TriggerServerEvent('kerry-shovel:server:givereward')
            else
                QBCore.Functions.Notify('你什么也没有找到', 'primary')
            end
        
        FreezeEntityPosition(player, false)
        ClearPedTasks(player)
		prompttrue()
		isDigging = false
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if #createdObjects > 0 then
            local player = PlayerPedId()
            local playerCoords = GetEntityCoords(player, true)

            for i = #createdObjects, 1, -1 do
                local obj = createdObjects[i]
                local objCoords = GetEntityCoords(obj)
                local distance = #(playerCoords - objCoords)
                if distance > 30.0 then
                    DeleteObject(obj)
                    SetModelAsNoLongerNeeded(obj)
                    table.remove(createdObjects, i)
                end
            end
        end
    end
end)

function prompttrue()
    prompt = true
    PromptSetEnabled(DelPrompt, true)
    PromptSetVisible(DelPrompt, true)
    PromptSetEnabled(ShovelPrompt, true)
    PromptSetVisible(ShovelPrompt, true)
end

RegisterNetEvent('kerry-shovel:client:start')
AddEventHandler('kerry-shovel:client:start', function(source)
	isHoldingShovel = true
	Wait(1000)
	local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Hand")
    shovelObject = CreateObject(GetHashKey("p_shovel02x"), coords, true, true, true)
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
	AttachEntityToEntity(shovelObject, player, boneIndex, 0.0, -0.19, -0.089, 274.1899, 483.89, 378.40, true, true, false, true, 1, true)
	PromptSetEnabled(ShovelPrompt, true)
    PromptSetVisible(ShovelPrompt, true)
    PromptSetEnabled(DelPrompt, true)
    PromptSetVisible(DelPrompt, true)
    prompt = true
    prompt2 = true
end)

RegisterNetEvent('kerry-shovel:client:stop')
AddEventHandler('kerry-shovel:client:stop', function()
    if shovelObject and DoesEntityExist(shovelObject) then
        DeleteEntity(shovelObject)
        shovelObject = nil
		isHoldingShovel = false
    end
end)

