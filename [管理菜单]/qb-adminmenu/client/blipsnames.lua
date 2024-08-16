QBCore = exports['qb-core']:GetCoreObject()
local ShowBlips = false
local ShowNames = false
local NetCheck1 = false
local NetCheck2 = false
local names = {}

CreateThread(function()
    while true do
        Wait(1000)
        if NetCheck1 or NetCheck2 then
            TriggerServerEvent('admin:server:GetPlayersForBlips')
        end
    end
end)

RegisterNetEvent('admin:client:toggleBlips', function()
    if not ShowBlips then
        ShowBlips = true
        NetCheck1 = true
        QBCore.Functions.Notify(Lang:t("success.blips_activated"), "success")
    else
        ShowBlips = false
        QBCore.Functions.Notify(Lang:t("error.blips_deactivated"), "error")
    end
end)


CreateThread(function()
    local sleep = 150
    while true do
      if ShowNames then
        showNames()
        sleep = 50
      else
        sleep = 500
      end
  
      Wait(sleep)
    end
  end)

showNames = function()
    local curCoords = GetEntityCoords(PlayerPedId())
    local allActivePlayers = GetActivePlayers()
    for _,i in ipairs(allActivePlayers) do
      local targetPed = GetPlayerPed(i)
      local playerStr = '[' .. GetPlayerServerId(i) .. ']' .. ' ' .. GetPlayerName(i)
  
      if not names[i] or not IsMpGamerTagActive(names[i].gamerTag) then
        names[i] = {
          gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
          ped = targetPed
        }
      end
  
      local targetTag = names[i].gamerTag
      local targetPedCoords = GetEntityCoords(targetPed)
    end
  end

RegisterNetEvent('admin:client:toggleNames', function()
    if not ShowNames then
        ShowNames = true
        NetCheck2 = false
        QBCore.Functions.Notify(Lang:t("success.names_activated"), "success")
    else
        ShowNames = false
        QBCore.Functions.Notify(Lang:t("error.names_deactivated"), "error")
    end
end)

