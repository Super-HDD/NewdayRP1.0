local QBCore = exports['qb-core']:GetCoreObject()
local PrimeraMina = false
local Mina1 = false
local Arbol1, Arbol2, Arbol3, Arbol4 = nil, nil, nil, nil
local Mina2 = false
local Mina3 = false
local Mina4 = false
local FinMina = false
local FinMina1 = false
local FinMina2 = false
local FinMina3 = false
local FinMina4 = false
local Entrega = false
local EntregaFinal = false
local isjob = false
Citizen.CreateThread(function()
    local blip = Citizen.InvokeNative(0x554d9d53f696d002, -592068833, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z)
end)
local blips = {
    { name = '石油公司兼职工作', sprite = 1078668923, x =484.9, y = 599.18, z = 111.4},

}
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.5, 3.5, 0.9, 18, 255, 1, 155, 0, 0, 2, 0, 0, 0, 0)

        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z) < 3.0) then
            if Mina1 == false then
                --DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
			
                    TriggerServerEvent('MR_Petrol:comjob')
                end
            end
        end
		if PrimeraMina == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                   
					TriggerEvent('MR_Petrol:route')
					Wait(10000)
					QBCore.Functions.Notify( Language.translate[Config.lang]['carry'], 'success', 6000)
					Wait(5000)
					animacion3(Arbol1)
					RemoveBlip(blip)
					blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z)
                    SetBlipSprite(blip5, -570710357, 1)
					
					PrimeraMina = false
                    FinMina1 = true
                end
            end

			    elseif FinMina1 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['pressc'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
                    QBCore.Functions.Notify( Language.translate[Config.lang]['goto'], 'success', 6000)
                    RemoveBlip(blip5)
                    blip2 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z)
                    SetBlipSprite(blip2, -570710357, 1)
                    FinMina1 = false
                    Mina2 = true
                end
            end

        elseif Mina2 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
             
                    Wait(10000)
					QBCore.Functions.Notify( Language.translate[Config.lang]['carry'], 'success', 6000)
					Wait(5000)
					animacion3(Arbol2)
					RemoveBlip(blip2)
                    blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Mina2 = false
                    FinMina2 = true
                end
            end
			elseif FinMina2 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['pressc'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
                    QBCore.Functions.Notify( Language.translate[Config.lang]['goto'], 'success', 6000)
                    RemoveBlip(blip5)
                    blip3 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z)
                    SetBlipSprite(blip3, -570710357, 1)
                    FinMina2 = false
                    Mina3 = true
                end
            end
        elseif Mina3 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z) < 3.0) then
               -- DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    
                     Wait(10000)
					 QBCore.Functions.Notify( Language.translate[Config.lang]['carry'], 'success', 6000)
					 Wait(5000)
					animacion3(Arbol3)
				    RemoveBlip(blip3)
                    blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Mina3 = false
                    FinMina3 = true
                end
            end
			elseif FinMina3 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['pressc'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
                    QBCore.Functions.Notify( Language.translate[Config.lang]['goto'], 'success', 6000)
                    RemoveBlip(blip5)
                    blip4 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z)
                    SetBlipSprite(blip4, -570710357, 1)
                    FinMina3 = false
                    Mina4 = true
                end
            end
        elseif Mina4 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['press'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    
                     Wait(10000)
					QBCore.Functions.Notify( Language.translate[Config.lang]['carry'], 'success', 6000)
					 Wait(5000)
					animacion3(Arbol4)
					RemoveBlip(blip4)
                    blip5 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Mina4 = false
                    FinMina = true
                end
            end
        elseif FinMina == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['pressc'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
					Wait(10000)
                    QBCore.Functions.Notify( Language.translate[Config.lang]['noveh'], 'success', 6000)
                    RemoveBlip(blip5)
                    blip6 = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z)
                    SetBlipSprite(blip6, -570710357, 1)
                    FinMina = false
                    Entrega = true
		            ClearPedTasksImmediately(PlayerPedId())
                    TriggerEvent('MR_Petrol:TIME')
					FreezeEntityPosition(spawncar, false)
					StartGpsMultiRoute(6, true, true)
					AddPointToGpsMultiRoute(Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z)
					AddPointToGpsMultiRoute(Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z)
					SetGpsMultiRouteRender(true)
                end
            end
        elseif Entrega == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.5, 255, 23, 23, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['Entrega'].x, Config.Zonas['Entrega'].y, Config.Zonas['Entrega'].z) < 3.0) then
                --DrawTxt(Language.translate[Config.lang]['pressf'], 0.3, 0.55, 0.4, 0.4, true, 241, 15, 11, 255, false)
                lib.showTextUI(Language.translate[Config.lang]['pressf'])
                if IsControlJustPressed(0, 0xC7B5340A) then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
						QBCore.Functions.Notify( Language.translate[Config.lang]['completejob'], 'success', 6000)
						RemoveBlip(blip6)
						TriggerServerEvent('MR_Petrol:worker')
                        Entrega = false
                        Mina1 = false
                        ClearGpsMultiRoute()
                    else
                        QBCore.Functions.Notify( Language.translate[Config.lang]['noveh'], 'success', 6000)
                    end
                end
            end
        end
  
	end
end)


  
RegisterNetEvent('MR_Petrol:route')
AddEventHandler('MR_Petrol:route', function()
	Citizen.Wait(0)

	local jugador = PlayerPedId()
	local Vehiclee = GetHashKey(Config.Vehiclee)
	RequestModel(Vehiclee)

	while not HasModelLoaded(Vehiclee) do
		Citizen.Wait(0)
	end

	spawncar = CreateVehicle(Vehiclee, Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z, Config.Zonas['Vehicle'].heading, true, false)
	SetVehicleOnGroundProperly(spawncar)
    SetModelAsNoLongerNeeded(Vehiclee)
	FreezeEntityPosition(spawncar, true)
end)

RegisterNetEvent('MR_Petrol:comienzo')
AddEventHandler('MR_Petrol:comienzo', function(source)
    blip = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z)
    SetBlipSprite(blip, -570710357, 1)
    PrimeraMina = true
    Mina1 = true
    SpawnearArboles("p_cs_generator01x") 
end)

RegisterNetEvent('MR_Petrol:TIME')
AddEventHandler('MR_Petrol:TIME', function()
	local timer = 150

	Citizen.CreateThread(function()
		while timer > 0 and Entrega do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while Entrega do
			Citizen.Wait(0)
			DrawTxt(Language.translate[Config.lang]['temp']..timer..Language.translate[Config.lang]['seconds'], 0.4, 0.92, 0.4, 0.4, true, 241, 15, 11, 255, false)
            if timer < 1 then
                QBCore.Functions.Notify( Language.translate[Config.lang]['lose'], 'success', 6000)
				Mina1, Mina2, Mina3, Mina4, FinMina, FinMina1, FinMina2, FinMina3, Entrega, PrimeraMina = false, false, false, false, false, false, false
				DeleteVehicle(spawncar)
				RemoveBlip(blip6)
				ClearGpsMultiRoute()
                SetEntityCoords(PlayerPedId(), Config.Zonas['Vehicle'].x, Config.Zonas['Vehicle'].y, Config.Zonas['Vehicle'].z)
			end
		end
	end)
end)


function animacion()

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_BUCKET_FILL'), 10000, true, false, false, false)
	 QBCore.Functions.Progressbar('petrol', Language.translate[Config.lang]['mining'], 10000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() 
    Wait(10000)
	    ClearPedSecondaryTask(playerPed)
end)
end

function animacion2()
	TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), 10000, true, false, false, false)
	QBCore.Functions.Progressbar('petrol', Language.translate[Config.lang]['placing'], 10000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() 
    Wait(10000)
	ClearPedSecondaryTask(playerPed)
end)
end

function animacion3(object)
    local rot = 0.00
    while true do
        Wait(7000)
        rot = rot + 1
        SetEntityRotation(object, rot, 0.0, 0.0, 1, true)
        if(rot >= 0) then
            break
        end

    end
    DeleteObject(object)
end

function SpawnearArboles(hash)
    local obj = GetHashKey(hash)
    Wait(500)
    RequestModel(obj)
    if not HasModelLoaded(obj) then 
        RequestModel(obj) 
    end

    while not HasModelLoaded(obj) do 
        Citizen.Wait(1) 
    end

    Arbol1 = CreateObject(obj, Config.Zonas['Miner1'].x, Config.Zonas['Miner1'].y, Config.Zonas['Miner1'].z +1.0, true, true, true)
    Arbol2 = CreateObject(obj, Config.Zonas['Miner2'].x, Config.Zonas['Miner2'].y, Config.Zonas['Miner2'].z +1.0, true, true, true)
    Arbol3 = CreateObject(obj, Config.Zonas['Miner3'].x, Config.Zonas['Miner3'].y, Config.Zonas['Miner3'].z +1.0, true, true, true)
    Arbol4 = CreateObject(obj, Config.Zonas['Miner4'].x, Config.Zonas['Miner4'].y, Config.Zonas['Miner4'].z +1.0, true, true, true)
    PlaceObjectOnGroundProperly(Arbol1)
    PlaceObjectOnGroundProperly(Arbol2)
    PlaceObjectOnGroundProperly(Arbol3)
    PlaceObjectOnGroundProperly(Arbol4)
    SetEntityAsMissionEntity(Arbol1, true)
    SetEntityAsMissionEntity(Arbol2, true)
    SetEntityAsMissionEntity(Arbol3, true)
    SetEntityAsMissionEntity(Arbol4, true)

end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    Citizen.InvokeNative(0x66E0276CC5F6B9DA, 2)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 14);
    DisplayText(str, x, y)
end




function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end


