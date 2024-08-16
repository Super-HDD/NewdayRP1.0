local QBCore = exports['qb-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-- prompts and blips
Citizen.CreateThread(function()
    for townhall, v in pairs(Config.TownHallLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'qb-townhall:client:jobmenu',
            args = {},
        })
        if v.showblip == true then
            local TownhallBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(TownhallBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(TownhallBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, TownhallBlip, Config.Blip.blipName)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 1000

        for _, v in pairs(Config.TownHallLocations) do
            if v.showmarker then
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local coord = v.coords
                local distance = #(coords - coord)

                if distance <= 10.0 then
                    sleep = 4

                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
            end
        end

        Wait(sleep)
    end
end)

-----------------------------------------------------------------------------------

-- job menu
RegisterNetEvent('qb-townhall:client:jobmenu', function()
    jobMenu = {}
    jobMenu = {
        {
            header = "💼 | Job Menu",
            isMenuHeader = true,
        },
    }
    for k,v in pairs(Config.Jobs) do
        jobMenu[#jobMenu + 1] = {
            header = 'Job Offer: '..v.lable,
            txt = v.description,
            params = {
                isServer = true,
                event = 'qb-cityhall:server:ApplyJob',
                args = { job = v.job, lable = v.lable }
            }
        }
    end
    jobMenu[#jobMenu + 1] = {
        header = "❌ | Close Menu",
        txt = '',
        params = {
            event = 'qb-menu:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(jobMenu)
end)
