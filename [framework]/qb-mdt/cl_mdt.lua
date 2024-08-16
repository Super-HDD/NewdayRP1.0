local QBCore = exports['qb-core']:GetCoreObject()
local isVisible = false
local prop = nil
local JournalOuvert = false


Citizen.CreateThread(function()   
    if Config.UseOffice == true then 
        for k,v in pairs(Config.Office) do 
            exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['E'], Lang:t('menu.open_mdt_menu'), {
                type = 'client',
                event ='qb-mdt:client:open-mdt-menu' ,
            }) 
        end
    end
end)

RegisterNetEvent('qb-mdt:client:open-mdt-menu',function()
    print('qb-mdt:client:open-mdt-menu')
    TriggerServerEvent('qb-mdt:server:open-mdt-menu')
end)

--TriggerServerEvent("qb-mdt:getOffensesAndOfficer")

RegisterNetEvent("qb-mdt:toggleVisibilty")
AddEventHandler("qb-mdt:toggleVisibilty", function(reports, warrants, officer, job, grade, note)
    local playerPed = PlayerPedId()
    if not isVisible then
        TriggerServerEvent("qb-mdt:getOffensesAndOfficer")
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
        Wait(1000)
        Citizen.InvokeNative(0x524B54361229154F, PlayerPedId(), GetHashKey("world_human_write_notebook"), 9999999999,true,false, false, false)
    else
        FreezeEntityPosition(PlayerPedId(), false)
        Wait(1000)
        ClearPedSecondaryTask(PlayerPedId())
        ClearPedTasks(PlayerPedId())        
    end
    if #warrants == 0 then warrants = false end
    if #reports == 0 then reports = false end
    if #note == 0 then note = false end
    SendNUIMessage({
        type = "recentReportsAndWarrantsLoaded",
        reports = reports,
        warrants = warrants,
        officer = officer,
        department = job,
        rank = grade,
        note = note,
    })
    ToggleGUI()
end)

RegisterNUICallback("close", function(data, cb)
    FreezeEntityPosition(PlayerPedId(), false)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedTasks(PlayerPedId())
	SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
    ToggleGUI(false)
    cb('ok')
end)

RegisterNUICallback("performOffenderSearch", function(data, cb)
    TriggerServerEvent("qb-mdt:performOffenderSearch", data.query)
    TriggerServerEvent("qb-mdt:getOffensesAndOfficer")
    cb('ok')
end)

RegisterNUICallback("viewOffender", function(data, cb)
    TriggerServerEvent("qb-mdt:getOffenderDetails", data.offender)
    cb('ok')
end)

RegisterNUICallback("saveOffenderChanges", function(data, cb)
    TriggerServerEvent("qb-mdt:saveOffenderChanges", data.id, data.changes, data.identifier)
    cb('ok')
end)

RegisterNUICallback("submitNewReport", function(data, cb)
    TriggerServerEvent("qb-mdt:submitNewReport", data)
    cb('ok')
end)

RegisterNUICallback("submitNote", function(data, cb)
    TriggerServerEvent("qb-mdt:submitNote", data)
    cb('ok')
end)

RegisterNUICallback("performReportSearch", function(data, cb)
    TriggerServerEvent("qb-mdt:performReportSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("getOffender", function(data, cb)
    TriggerServerEvent("qb-mdt:getOffenderDetailsById", data.char_id)
    cb('ok')
end)

RegisterNUICallback("deleteReport", function(data, cb)
    TriggerServerEvent("qb-mdt:deleteReport", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteNote", function(data, cb)
    TriggerServerEvent("qb-mdt:deleteNote", data.id)
    cb('ok')
end)

RegisterNUICallback("saveReportChanges", function(data, cb)
    TriggerServerEvent("qb-mdt:saveReportChanges", data)
    cb('ok')
end)

RegisterNUICallback("getWarrants", function(data, cb)
    TriggerServerEvent("qb-mdt:getWarrants")
end)

RegisterNUICallback("submitNewWarrant", function(data, cb)
    TriggerServerEvent("qb-mdt:submitNewWarrant", data)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("qb-mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("qb-mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("getReport", function(data, cb)
    TriggerServerEvent("qb-mdt:getReportDetailsById", data.id)
    cb('ok')
end)

RegisterNUICallback("getNotes", function(data, cb)
    TriggerServerEvent("qb-mdt:getNoteDetailsById", data.id)
    cb('ok')
end)

RegisterNetEvent("qb-mdt:returnOffenderSearchResults")
AddEventHandler("qb-mdt:returnOffenderSearchResults", function(results)
    SendNUIMessage({
        type = "returnedPersonMatches",
        matches = results
    })
end)

RegisterNetEvent("qb-mdt:closeModal")
AddEventHandler("qb-mdt:closeModal", function()
    SendNUIMessage({
        type = "closeModal"
    })
end)

RegisterNetEvent("qb-mdt:returnOffenderDetails")
AddEventHandler("qb-mdt:returnOffenderDetails", function(data)
    SendNUIMessage({
        type = "returnedOffenderDetails",
        details = data
    })
end)

RegisterNetEvent("qb-mdt:returnOffensesAndOfficer")
AddEventHandler("qb-mdt:returnOffensesAndOfficer", function(data, name)
    SendNUIMessage({
        type = "offensesAndOfficerLoaded",
        offenses = data,
        name = name
    })
end)

RegisterNetEvent("qb-mdt:returnReportSearchResults")
AddEventHandler("qb-mdt:returnReportSearchResults", function(results)
    SendNUIMessage({
        type = "returnedReportMatches",
        matches = results
    })
end)

RegisterNetEvent("qb-mdt:returnWarrants")
AddEventHandler("qb-mdt:returnWarrants", function(data)
    SendNUIMessage({
        type = "returnedWarrants",
        warrants = data
    })
end)

RegisterNetEvent("qb-mdt:completedWarrantAction")
AddEventHandler("qb-mdt:completedWarrantAction", function(data)
    SendNUIMessage({
        type = "completedWarrantAction"
    })
end)

RegisterNetEvent("qb-mdt:returnReportDetails")
AddEventHandler("qb-mdt:returnReportDetails", function(data)
    SendNUIMessage({
        type = "returnedReportDetails",
        details = data
    })
end)

RegisterNetEvent("qb-mdt:returnNoteDetails")
AddEventHandler("qb-mdt:returnNoteDetails", function(data)
    SendNUIMessage({
        type = "returnedNoteDetails",
        details = data
    })
end)

RegisterNetEvent("qb-mdt:sendNUIMessage")
AddEventHandler("qb-mdt:sendNUIMessage", function(messageTable)
    SendNUIMessage(messageTable)
end)

RegisterNetEvent("qb-mdt:sendNotification")
AddEventHandler("qb-mdt:sendNotification", function(message)
    SendNUIMessage({
        type = "sendNotification",
        message = message
    })
end)

function ToggleGUI(explicit_status)
  if explicit_status ~= nil then
    isVisible = explicit_status
  else
    isVisible = not isVisible
  end
  SetNuiFocus(isVisible, isVisible)
  SendNUIMessage({
    type = "enable",
    isVisible = isVisible
  })
end


