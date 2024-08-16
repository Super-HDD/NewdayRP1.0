local QBCore = exports['qb-core']:GetCoreObject()

-- get house keys
QBCore.Functions.CreateCallback('qb-houses:server:GetHouseKeys', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local housekeys = MySQL.query.await('SELECT * FROM player_housekeys WHERE citizenid=@citizenid',
    {
        ['@citizenid'] = citizenid
    })

    if housekeys[1] == nil then return end

    cb(housekeys)
end)

-- get house keys (guests)
QBCore.Functions.CreateCallback('qb-houses:server:GetGuestHouseKeys', function(source, cb)
    local guestinfo = MySQL.query.await('SELECT * FROM player_housekeys WHERE guest=@guest', {['@guest'] = 1})

    if guestinfo[1] == nil then return end

    cb(guestinfo)
end)

-- get house info
QBCore.Functions.CreateCallback('qb-houses:server:GetHouseInfo', function(source, cb)
    local houseinfo = MySQL.query.await('SELECT * FROM player_houses', {})

    if houseinfo[1] == nil then return end

    cb(houseinfo)
end)

-- get owned house info
QBCore.Functions.CreateCallback('qb-houses:server:GetOwnedHouseInfo', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local houseinfo = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid=@citizenid AND owned=@owned',
    {
        ['@citizenid']  = citizenid,
        ['@owned']      = 1
    })

    if houseinfo[1] == nil then return end

    cb(houseinfo)
end)

-- buy house
RegisterServerEvent('qb-houses:server:buyhouse', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullname = (firstname..' '..lastname)
    local housecount = MySQL.prepare.await('SELECT COUNT(*) FROM player_houses WHERE citizenid = ?', {citizenid})

    if housecount >= 1 then
        QBCore.Functions.Notify(src, '你已经有房子了!', 'error')
        return
    end

    if (Player.PlayerData.money.cash < data.price) then
        QBCore.Functions.Notify(src, '你没有足够的现金!', 'error')
        return
    end

    MySQL.update('UPDATE player_houses SET citizenid = ?, fullname = ?, owned = ?, credit = ? WHERE houseid = ?',
    {
        citizenid,
        fullname,
        1,
        Config.StartCredit,
        data.house
    })

    MySQL.insert('INSERT INTO player_housekeys(citizenid, houseid) VALUES(@citizenid, @houseid)',
    {
        ['@citizenid']  = citizenid,
        ['@houseid']    = data.house
    })

    Player.Functions.RemoveMoney('cash', data.price)

    QBCore.Functions.Notify(src, '已购房屋!', 'success')

    TriggerClientEvent('qb-houses:client:BlipsOnSpawn', src, data.blip)
end)

-- sell house
RegisterServerEvent('qb-houses:server:sellhouse', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    MySQL.update('UPDATE player_houses SET citizenid = 0, fullname = 0, credit = 0, owned = 0 WHERE houseid = ?', {data.house})

    MySQL.update('DELETE FROM player_housekeys WHERE houseid = ?', {data.house})

    Player.Functions.AddMoney('cash', data.price)

    QBCore.Functions.Notify(src, 'House sold!', 'success')

    TriggerClientEvent('qb-houses:client:BlipsOnSpawn', src, data.blip)
end)

-- add house credit
RegisterNetEvent('qb-houses:server:addcredit', function(newcredit, removemoney, houseid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    if cashBalance >= removemoney then
        Player.Functions.RemoveMoney("cash", removemoney, "land-tax-credit")

        MySQL.update('UPDATE player_houses SET credit = ? WHERE houseid = ?', {newcredit, houseid})

        QBCore.Functions.Notify(src, '添加了土地税收抵免 '..houseid, 'success')
        Wait(5000)
        QBCore.Functions.Notify(src, '您的土地税抵免现在是 $'..newcredit, 'primary')
    else
        QBCore.Functions.Notify(src,  Lang:t('error.not_enough_cash'), 'error')
    end
end)

--------------------------------------------------------------------------------------------------

-- get all door states
QBCore.Functions.CreateCallback('qb-houses:server:GetDoorState', function(source, cb)
    local doorstate = MySQL.query.await('SELECT * FROM doors', {})

    if doorstate[1] == nil then return end

    cb(doorstate)
end)

-- get current door state
QBCore.Functions.CreateCallback('qb-houses:server:GetCurrentDoorState', function(source, cb, door)
    local result = MySQL.query.await('SELECT doorstate FROM doors WHERE doorid = ?', {door})

    if result[1] == nil then return end

    cb(result[1].doorstate)
end)

-- get specific door state
RegisterNetEvent('qb-houses:server:GetSpecificDoorState', function(door)
    local src = source
    local result = MySQL.query.await('SELECT * FROM doors WHERE doorid = ?', {door})

    if result[1] == nil then return end

    local doorid = result[1].doorid
    local doorstate = result[1].doorstate

    if Config.Debug then
        print("")
        print("Door ID: "..doorid)
        print("Door State: "..doorstate)
        print("")
    end

    TriggerClientEvent('qb-houses:client:GetSpecificDoorState', src, doorid, doorstate)
end)

-- update door state
RegisterNetEvent('qb-houses:server:UpdateDoorState', function(doorid, doorstate)
    local src = source

    MySQL.update('UPDATE doors SET doorstate = ? WHERE doorid = ?', {doorstate, doorid})

    TriggerClientEvent('qb-houses:client:GetSpecificDoorState', src, doorid, doorstate)
end)

--------------------------------------------------------------------------------------------------

-- land tax billing loop
BillingInterval = function()
    local result = MySQL.query.await('SELECT * FROM player_houses WHERE owned=@owned', {['@owned'] = 1})

    if not result then goto continue end

    for i = 1, #result do
        local row = result[i]

        if Config.Debug then
            print(row.agent, row.houseid, row.citizenid, row.fullname, row.owned, row.price, row.credit)
        end

        if row.credit >= Config.LandTaxPerCycle then
            local creditadjust = (row.credit - Config.LandTaxPerCycle)

            MySQL.update('UPDATE player_houses SET credit = ? WHERE houseid = ? AND citizenid = ?',
            {
                creditadjust,
                row.houseid,
                row.citizenid
            })

            local creditwarning = (Config.LandTaxPerCycle * Config.CreditWarning)

            if row.credit < creditwarning then
                MySQL.insert('INSERT INTO telegrams (citizenid, recipient, sender, sendername, subject, sentDate, message) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {
                    row.citizenid,
                    row.fullname,
                    '22222222',
                    'Land Tax Office',
                    'Land Tax Credit Due to Run Out!',
                    os.date("%x"),
                    '您的房屋土地税抵免即将到期!',
                })
            end
        else
            MySQL.insert('INSERT INTO telegrams (citizenid, recipient, sender, sendername, subject, sentDate, message) VALUES (?, ?, ?, ?, ?, ?, ?)',
            {
                row.citizenid,
                row.fullname,
                '22222222',
                'Land Tax Office',
                'Land Tax Credit Ran Out!',
                os.date("%x"),
                '由于缺乏税收抵免，您的房屋已被收回!',
            })

            Wait(1000)

            MySQL.update('UPDATE player_houses SET citizenid = 0, fullname = 0, owned = 0 WHERE houseid = ?', {row.houseid})

            MySQL.update('DELETE FROM player_housekeys WHERE houseid = ?', {row.houseid})

            if Config.PurgeStorage then
                MySQL.update('DELETE FROM stashitems WHERE stash = ?', {row.houseid})
            end

            TriggerEvent('qb-log:server:CreateLog', 'estateagent', 'House Lost', 'red', row.fullname..' house '..row.houseid..' has been lost!')
        end

        if row.agent == 'newhanover' then
            exports['qb-management']:AddMoney('govenor1', Config.LandTaxPerCycle)
        end

        if row.agent == 'westelizabeth' then
            exports['qb-management']:AddMoney('govenor2', Config.LandTaxPerCycle)
        end

        if row.agent == 'newaustin' then
            exports['qb-management']:AddMoney('govenor3', Config.LandTaxPerCycle)
        end

        if row.agent == 'ambarino' then
            exports['qb-management']:AddMoney('govenor4', Config.LandTaxPerCycle)
        end

        if row.agent == 'lemoyne' then
            exports['qb-management']:AddMoney('govenor5', Config.LandTaxPerCycle)
        end
    end

    ::continue::

    print('Land Tax Billing Cycle Complete')

    SetTimeout(Config.BillingCycle * (60 * 60 * 1000), BillingInterval) -- hours
    -- SetTimeout(Config.BillingCycle * (60 * 1000), BillingInterval) -- mins (for testing)
end

SetTimeout(Config.BillingCycle * (60 * 60 * 1000), BillingInterval) -- hours
-- SetTimeout(Config.BillingCycle * (60 * 1000), BillingInterval) -- mins (for testing)

--------------------------------------------------------------------------------------------------

-- add house guest
RegisterNetEvent('qb-houses:server:addguest', function(cid, houseid)
    local src = source
    local keycount = MySQL.prepare.await('SELECT COUNT(*) FROM player_housekeys WHERE citizenid = ? AND houseid = ?', {cid, houseid})

    if keycount >= 1 then
        QBCore.Functions.Notify(src, '目标人已经拥有另一所房子的钥匙!', 'error')
        return
    end

    MySQL.insert('INSERT INTO player_housekeys(citizenid, houseid, guest) VALUES(@citizenid, @houseid, @guest)',
    {
        ['@citizenid']  = cid,
        ['@houseid']    = houseid,
        ['@guest']      = 1,
    })

    QBCore.Functions.Notify(src, cid..' 添加为您家中的客人!', 'success')
end)

-- remove house guest
RegisterNetEvent('qb-houses:server:removeguest', function(data)
    local src = source

    MySQL.update('DELETE FROM player_housekeys WHERE houseid = ? AND citizenid = ?', {data.houseid, data.guestcid})

    QBCore.Functions.Notify(src, data.guestcid..' 从您家的宾客名单中删除!', 'success')
end)