local QBCore = exports['qb-core']:GetCoreObject()
local badge = false

RegisterNetEvent('qb-lawbadge:client:lawbadge', function()
    local ped = PlayerPedId()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == Config.LawJob then
            if badge == false then
                if not IsPedMale(ped) then -- female
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x0929677D, true, true, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0xDB4C451D, true, false, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                QBCore.Functions.Notify('徽章戴上', 'primary')
                badge = true
            else
                if not IsPedMale(ped) then -- female
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(), 0x0929677D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(), 0xDB4C451D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                QBCore.Functions.Notify('徽章被摘下', 'primary')
                badge = false
            end
        else
            QBCore.Functions.Notify('只有法律人才能做到这一点', 'error')
        end
    end)
end)
