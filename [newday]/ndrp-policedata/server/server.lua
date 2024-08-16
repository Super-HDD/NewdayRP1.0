local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ndrp-police:server:add-weapon',function (WeaponName)
    local src=source
    local Player=QBCore.Functions.GetPlayer(src)
    local serie


    while true do
        serie=tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM ndrp_police_weapon WHERE weapon_serie = ?", { serie })
        if result==0 then
            break
        end
    end

    MySQL.Sync.execute(
        'INSERT INTO `ndrp_police_weapon`(`weapon_serie`, `recipient`, `weapon_name`, `cid`, `date`) VALUES (@weapon_serie,@recipient,@weapon_name,@cid,@date)', {
            ['@weapon_serie']=serie,
            ['@recipient'] = Player.PlayerData.name,
            ['@weapon_name'] = WeaponName,
            ['@cid'] = Player.PlayerData.citizenid,
            ['@date'] = os.date ("%m/%d")
    })

    Player.Functions.AddItem(WeaponName,1,_, {serie=serie})
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[WeaponName], "add")
end)

QBCore.Functions.CreateCallback('ndrp-police:callback:get-weapon-records',function(source,cb)
    local records_list=MySQL.query.await('SELECT `weapon_serie`,`recipient`,`weapon_name`,`cid`,`date` FROM `ndrp_police_weapon`')
    for i=1,#records_list do
        records_list[i].weapon_name=QBCore.Shared.Items[records_list[i].weapon_name].label
    end
    return cb(records_list)
end)

RegisterServerEvent('ndrp-police:server:get-ammo',function(AmmoType)
    local Player=QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(AmmoType,1)
    TriggerClientEvent('inventory:client:ItemBox',source,QBCore.Shared.Items[AmmoType], "add")
end)

