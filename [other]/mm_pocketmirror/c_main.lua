-- Configuration
local cameraActive = false
local cameraEntity = nil
local mirroropen = false

local animDict = "amb_misc@world_human_pocket_mirror@female_a@base"
local animName = "base"
local animFlag = 1

-- Add your object model name here
local objectModel = "p_pocketmirror01x"
local spawnedObject = nil

-- Model dimensions table (You should update these values based on your specific game version.)
local modelDimensions = {
    ['mp_male'] = vector3(0.0, 0.0, 1.0), -- Example height for male character
    ['mp_female'] = vector3(0.0, 0.0, 0.9), -- Example height for female character
}

-- Function to get the player's height based on their model
function GetPlayerHeight(playerPed)
    local modelHash = GetEntityModel(playerPed)
    local modelName = GetHashKey(modelHash)

    return modelDimensions[modelName] or vector3(0.0, 0.0, 1.0) -- Default height if model not found
end

-- Function to update camera properties
function UpdateCameraProperties(playerPed, adjustedCameraOffset)
    local playerCoords = GetEntityCoords(playerPed)
    local updatedCameraPosition = playerCoords + adjustedCameraOffset

    SetCamCoord(cameraEntity, updatedCameraPosition.x, updatedCameraPosition.y, updatedCameraPosition.z)

    local playerHeading = GetEntityHeading(playerPed)
    local cameraYaw = playerHeading + 180.0
    SetCamRot(cameraEntity, 0.0, 0.0, cameraYaw, 2)

    -- Update camera FOV
    local currentFOV = GetCamFov(cameraEntity)
    if currentFOV ~= cameraFOV then
        SetCamFov(cameraEntity, cameraFOV)
    end
end

-- Function to start the camera
function StartCamera()
    if not cameraActive then
        local playerPed = PlayerPedId()

        local playerHeight = GetPlayerHeight(playerPed)
        local isMale = IsPedMale(playerPed)

        -- Set different cameraOffset and FOV based on the player's sex
        local cameraOffsetX, cameraOffsetY, cameraOffsetZ
        local cameraFOVValue

        if isMale then
            cameraOffsetX, cameraOffsetY, cameraOffsetZ = -0.04, 0.6, 0.7 -- Set male camera offset here (x, y, z)
            cameraFOVValue = 10.0 -- Set male FOV here (in degrees)
        else
            cameraOffsetX, cameraOffsetY, cameraOffsetZ = -0.03, 0.3, 0.6 -- Set female camera offset here (x, y, z)
            cameraFOVValue = 20.0 -- Set female FOV here (in degrees)
        end

        -- Adjust cameraOffset.y based on player height
        local adjustedCameraOffset = vector3(cameraOffsetX, cameraOffsetY + playerHeight.z, cameraOffsetZ)

        -- Create the camera and set its properties
        cameraEntity = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamFov(cameraEntity, cameraFOVValue)

        -- Attach the camera to the player with the adjusted camera offset
        AttachCamToEntity(cameraEntity, playerPed, adjustedCameraOffset.x, adjustedCameraOffset.y, adjustedCameraOffset.z, true)

        -- Activate the camera and play the animation
        RenderScriptCams(true, false, 0, true, true)
        SetCamActive(cameraEntity, true)
        cameraActive = true

        -- Freeze the player's position and play the animation
        FreezeEntityPosition(playerPed, true)

        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(5000)
        end

        TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, animFlag, 0, false, false, false)

        -- Spawn the object in skel_l_hand bone
        local boneIndex = GetEntityBoneIndexByName(playerPed, "skel_l_hand")
        if boneIndex ~= -1 then
            local boneCoords = GetWorldPositionOfEntityBone(playerPed, boneIndex)
            spawnedObject = CreateObject(GetHashKey(objectModel), boneCoords, true, false, false)
            if DoesEntityExist(spawnedObject) then
                AttachEntityToEntity(spawnedObject, playerPed, boneIndex, 0.08, 0.00999999999999, 0.05, -17.0, 173.0, -62.0, true, true, false, true, 1, true)
            end
        end

        -- Continuously update the camera position, rotation, and FOV
        Citizen.CreateThread(function()
            while cameraActive do
                UpdateCameraProperties(playerPed, adjustedCameraOffset)

                Citizen.Wait(0) -- Use 0 to update as fast as possible (may reduce input lag)
            end
        end)
    end
end

-- Function to stop the camera and animation
function StopCamera()
    if cameraActive then
        -- Despawn the object if it exists
        if spawnedObject and DoesEntityExist(spawnedObject) then
            DeleteEntity(spawnedObject)
            spawnedObject = nil
        end

        -- Deactivate the camera, destroy it, and reset its properties
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(cameraEntity, false)
        cameraEntity = nil
        cameraActive = false

        -- Unfreeze the player's position and clear their animation task
        local playerPed = PlayerPedId()
        FreezeEntityPosition(playerPed, false)

        -- Clear the animation task
        ClearPedTasks(playerPed)
    end
end
-- Function to open a fullscreen image using a UI NUI message
function OpenFullscreenImage()
    mirroropen = not mirroropen

    local imageFilePath = "image.png" -- Replace with the path to your image file

    SendNUIMessage({
        type = mirroropen and 'show' or 'hide',
        image = imageFilePath
    })

    -- If the mirror is being closed, stop the camera and animation
    if not mirroropen then
        StopCamera()
    end
end



-- Register an event handler to stop the camera when the resource stops
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        StopCamera()
    end
end)




-- Register the client-side event to start the camera
RegisterNetEvent("mirror:startCameraEvent")
AddEventHandler("mirror:startCameraEvent", function()
    print("Received 'mirror:startCameraEvent' from server. Calling StartCamera()...")
    StartCamera()
end)

function TriggerStartCameraEvent()
    print("Sending 'mirror:startCameraEvent' to server...")
    TriggerServerEvent("mirror:startCameraEvent")
end

-- Register the client-side event to start the camera
RegisterNetEvent("mirror:startCameraEvent")
AddEventHandler("mirror:startCameraEvent", function()
    print("Received 'mirror:startCameraEvent' from server. Calling StartCamera()...")
    StartCamera()
    print("Calling OpenFullscreenImage()...")
    OpenFullscreenImage()
end)