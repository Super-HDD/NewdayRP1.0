local QBCore = exports['qb-core']:GetCoreObject()

-- start of use ammo

QBCore.Functions.CreateUseableItem('ammo_revolver', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_REVOLVER', Config.AmountRevolverAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_pistol', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_PISTOL', Config.AmountPistolAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_repeater', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_REPEATER', Config.AmountRepeaterAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_rifle', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_RIFLE', Config.AmountRifleAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_shotgun', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_SHOTGUN', Config.AmountShotgunAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_arrow', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_ARROW', Config.AmountArrowAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_varmint', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_22', Config.AmountRifleAmmo, item)
end)

QBCore.Functions.CreateUseableItem('ammo_rifle_elephant', function(source, item)
    TriggerClientEvent('qb-weapons:client:AddAmmo', source, 'AMMO_RIFLE_ELEPHANT', Config.AmountRifleAmmo, item)
end)

-- end of use ammo

-- save ammo
RegisterNetEvent('qb-weapons:server:SaveAmmo', function(serie, ammo, ammoclip)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local svslot = nil
    local itemData
    for v,k in pairs(Player.PlayerData.items) do
        if k.type == 'weapon' then
            if k.info.serie == serie then
                svslot = k.slot
                itemData = Player.Functions.GetItemBySlot(svslot)
                itemData.info.ammo = ammo
                itemData.info.ammoclip = ammoclip
                Player.Functions.RemoveItem(itemData.name, itemData.amount, svslot)
                Player.Functions.AddItem(itemData.name, itemData.amount, svslot, itemData.info)
            end
        end
    end
end)

-- remove ammo from player
RegisterServerEvent('qb-weapons:server:removeWeaponAmmoItem')
AddEventHandler('qb-weapons:server:removeWeaponAmmoItem', function(ammoitem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(ammoitem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ammoitem], 'remove')
    QBCore.Functions.Notify(src, Lang:t('success.weapon_reloaded'), 'success')
end)

RegisterNetEvent('qb-weapons:server:removeWeaponItem', function(weaponName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(weaponName, amount)
end)

-- Components Loader
RegisterNetEvent('qb-weapons:server:LoadComponents', function(serial, hash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local ownerName = Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname

    if Config.Debug then
        print("Weapon Serial    : "..tostring(serial))
        print("Weapon Owner     : "..tostring('('..citizenid..')'..ownerName))
    end

    local result = MySQL.Sync.fetchAll('SELECT * FROM player_weapons WHERE serial = @serial and citizenid = @citizenid',
    {
        serial = serial,
        citizenid = citizenid
    })

    if result[1] == nil or result[1] == 0 then return end

    local components = json.decode(result[1].components)

    if Config.Debug then
        print('Components       : "'..tostring(components))
    end

    TriggerClientEvent('qb-weapon:client:LoadComponents', src, components, hash)
end)
