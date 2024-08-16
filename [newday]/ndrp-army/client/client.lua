local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for _,v in pairs(Config.ArmySuitsLocations) do
        exports['qb-core']:createPrompt(v.name, v.coords, QBCore.Shared.Keybinds['J'], '打开军队服装柜', {
            type = 'client',
            event = "ndrp-army:client:open-suits-menu",
            args = {"mainmenu"},
          }) 
    end
end)

RegisterNetEvent('ndrp-army:client:open-suits-menu',function()
    TriggerEvent("sirevlc_us_army","mainmenu")
end)