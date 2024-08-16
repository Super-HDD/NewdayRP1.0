-- heavily inspired by vorp inputs
-- [MODAL INPUT HANDLING] ---------------------------------------------------
local input = nil

RegisterNetEvent("tm_modals:Modal")
AddEventHandler("tm_modals:Modal", function(title, desc, b1, b2, icon, inputfield, cb)
    RequestModalResult(title, desc, b1, b2, icon, inputfield, cb)
end)

function RequestModalResult(t, d, b1, b2, i, inf, cb)
    local modal = {
        title = t,
        desc = d,
        accept = b1,
        cancel = b2,
        icon = i,
        inputfield = inf,
    }
    Citizen.CreateThread(function()
        SetNuiFocus(true, true)
        SendNUIMessage({ type = "ui", status = true , modal = modal})
        -- wait until input got delivered from JS side
        while input == nil do 
            Citizen.Wait(10)
        end
        -- return result
        cb(input)
        -- close modal afterwards
        close_modal()
    end)
end

-- [GET RESULT OF MODAL BACK] ----------------------------------------------------
RegisterNUICallback("sendResult", function(result)
    input = result
end)

-- [YOINK] -----------------------------------------------------------------------
function close_modal()
    input = nil
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "ui", status = false })
end

-- [CLOSE NUI ON DEATH OR LASSOED OR SWIMMING]
Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do
        if Citizen.InvokeNative(0x2E9C3FCB6798F397, Citizen.InvokeNative(0x217E9DC48139933D)) 
        or Citizen.InvokeNative(0x9682F850056C9ADE, player) 
        or Citizen.InvokeNative(0x3BDFCF25B58B0415, player) 
        or Citizen.InvokeNative(0x4E209B2C1EAD5159, player) 
        or Citizen.InvokeNative(0x9DE327631295B4C2, player) 
        and not Citizen.InvokeNative(0x74E559B3BC910685,player) then
            input = "__closeModal"
            Citizen.Wait(100)
            close_modal()
        end
        Citizen.Wait(2000)
    end
end)

-- [RESOURCE RESTART HANDLING] ---------------------------------------------------
AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    close_modal()
end)

RegisterCommand("closemodal", function(source, args, rawCommand)
    close_modal()
end)