local QBCore = exports['qb-core']:GetCoreObject()

-- prompts and blips
Citizen.CreateThread(function()
    for sellvendor, v in pairs(Config.VendorShops) do
        exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], v.header, {
            type = 'client',
            event = 'qb-sellvendor:client:openmenu',
            args = { v.prompt },
        })
        if v.showblip == true then
            local SellVendorBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SellVendorBlip, GetHashKey(v.blip.blipSprite), true)
            SetBlipScale(SellVendorBlip, v.blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SellVendorBlip, v.blip.blipName)
        end
    end
end)

RegisterNetEvent('qb-sellvendor:client:openmenu') 
AddEventHandler('qb-sellvendor:client:openmenu', function(menuid)
    local shoptable = {
        {
            header = "| "..getMenuTitle(menuid).." |",
            isMenuHeader = true,
        },
    }
    local closemenu = {
        header = "关闭菜单",
        txt = '', 
        params = {
            event = 'qb-menu:closeMenu',
        }
    }
    for k,v in pairs(Config.VendorShops) do
        if v.prompt == menuid then
            for g,f in pairs(v.shopdata) do
                local lineintable = {
                    header = "<img src=nui://qb-inventory/html/images/"..f.image.." width=20px>"..f.title..' (价格 $'..f.price..')',
                    params = {
                        event = 'qb-sellvendor:client:sellcount',
                        args = {menuid, f}
                    }
                }
                table.insert(shoptable, lineintable)
            end 
        end
    end
    table.insert(shoptable,closemenu)
    exports['qb-menu']:openMenu(shoptable)
end)

RegisterNetEvent('qb-sellvendor:client:sellcount') 
AddEventHandler('qb-sellvendor:client:sellcount', function(arguments)
    local menuid = arguments[1]
    local data = arguments[2]
    local inputdata = lib.inputDialog('输入1件的数量 / '..data.price..' $', {data.description})
    
    if inputdata ~= nil then
        for k,v in pairs(inputdata) do
            TriggerServerEvent('qb-sellvendor:server:sellitem', v,data)
        end
    end
end)


function getMenuTitle(menuid)
    for k,v in pairs(Config.VendorShops)  do
        if menuid == v.prompt then
            return v.header
        end
    end
end
