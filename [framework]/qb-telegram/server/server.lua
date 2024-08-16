local QBCore = exports['qb-core']:GetCoreObject()

-- Make Bird Post as a Usable Item
QBCore.Functions.CreateUseableItem("birdpost", function(source)
    TriggerClientEvent("qb-telegram:client:WriteMessage", source)
end)

-- Delivery Success
RegisterNetEvent("qb-telegram:server:DeliverySuccess")
AddEventHandler("qb-telegram:server:DeliverySuccess", function(sID, tPName)
    QBCore.Functions.Notify(sID, Lang:t("success.letter_delivered", {pName = tPName}), 'success', 5000)
end)

-- Add Message to the Database
RegisterServerEvent('qb-telegram:server:SendMessage')
AddEventHandler('qb-telegram:server:SendMessage', function(senderID, sender, sendername, tgtid, subject, message)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player == nil then return end
    -- local _tgtid = tonumber(tgtid)
    local targetPlayer = QBCore.Functions.GetPlayerByCitizenId(tgtid)
    if targetPlayer == nil then
        QBCore.Functions.Notify(src, Lang:t('error.player_unavailable'), 'error', 5000)
        return
    end

    if not Config.AllowSendToSelf and Player.PlayerData.citizenid == tgtid then
        QBCore.Functions.Notify(src, Lang:t('error.send_to_self'), 'error', 5000)
        return
    end

    local _citizenid = targetPlayer.PlayerData.citizenid
    local targetPlayerName = targetPlayer.PlayerData.charinfo.firstname..' '..targetPlayer.PlayerData.charinfo.lastname
    local cost = Config.CostPerLetter
    local cashBalance = Player.PlayerData.money["cash"]
    local sentDate = os.date("%x")

    if Config.ChargePlayer and cashBalance < cost then
        QBCore.Functions.Notify(src, Lang:t('error.insufficient_balance'), 'error', 5000)
        return
    end

    exports.oxmysql:execute('INSERT INTO telegrams (`citizenid`, `recipient`, `sender`, `sendername`, `subject`, `sentDate`, `message`) VALUES (?, ?, ?, ?, ?, ?, ?)',{_citizenid, targetPlayerName, sender, sendername, subject, sentDate, message})
    TriggerClientEvent('qb-telegram:client:ReceiveMessage', targetPlayer.PlayerData.cid, senderID, targetPlayerName)

    if Config.ChargePlayer then
        Player.Functions.RemoveMoney('cash', cost, 'send-post')
    end
end)

RegisterServerEvent('qb-telegram:server:SendMessagePostOffice')
AddEventHandler('qb-telegram:server:SendMessagePostOffice', function(sender, sendername, citizenid, subject, message)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cost = Config.CostPerLetter
    local cashBalance = Player.PlayerData.money["cash"]
    local sentDate = os.date("%x")

    if Config.ChargePlayer and cashBalance < cost then
        QBCore.Functions.Notify(src, Lang:t('error.insufficient_balance'), 'error', 5000)
        return
    end

    local result = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = @citizenid', {citizenid = citizenid})

    if result[1] == nil then return end

    local tFirstName = json.decode(result[1].charinfo).firstname
    local tLastName = json.decode(result[1].charinfo).lastname
    local tFullName = tFirstName..' '..tLastName

    exports.oxmysql:execute('INSERT INTO telegrams (`citizenid`, `recipient`, `sender`, `sendername`, `subject`, `sentDate`, `message`) VALUES (?, ?, ?, ?, ?, ?, ?);', {citizenid, tFullName, sender, sendername, subject, sentDate, message})

    QBCore.Functions.Notify(src, Lang:t("success.letter_delivered", {pName = tFullName}), 'success', 5000)

    if Config.ChargePlayer then
        Player.Functions.RemoveMoney('cash', cost, 'send telegram')
    end
end)

-- Check for Inbox
RegisterServerEvent('qb-telegram:server:CheckInbox')
AddEventHandler('qb-telegram:server:CheckInbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player == nil then return end

    local citizenid = Player.PlayerData.citizenid

    exports.oxmysql:execute('SELECT * FROM telegrams WHERE citizenid = ? AND (birdstatus = 0 OR birdstatus = 1) ORDER BY id DESC',{citizenid}, function(result)
        local res = {}

        res['list'] = result or {}

        TriggerClientEvent('qb-telegram:client:InboxList', src, res)
    end)
end)

-- Get Messages from the Database
RegisterServerEvent('qb-telegram:server:GetMessages')
AddEventHandler('qb-telegram:server:GetMessages', function(tid)
    local src = source
    local telegram = {}

    local result = MySQL.query.await('SELECT * FROM telegrams WHERE id = @id AND (birdstatus = 0 OR birdstatus = 1)',
    {
        ['@id'] = tid
    })

    if result[1] == nil then
        QBCore.Functions.Notify(src, Lang:t('error.no_message'), 'error', 3000)
        return
    end

    telegram['citizenid'] = result[1]['citizenid']
    telegram['recipient'] = result[1]['recipient']
    telegram['sender'] = result[1]['sender']
    telegram['sendername'] = result[1]['sendername']
    telegram['subject'] = result[1]['subject']
    telegram['sentDate'] = result[1]['sentDate']
    telegram['message'] = result[1]['message']

    MySQL.Async.execute("UPDATE `telegrams` SET `status` = 1, `birdstatus` = 1 WHERE id = @id",
    {
        ['@id'] = tid
    })

    TriggerClientEvent('qb-telegram:client:MessageData', src, telegram)
end)

-- Delete Message
RegisterServerEvent('qb-telegram:server:DeleteMessage')
AddEventHandler('qb-telegram:server:DeleteMessage', function(tid)
    local src = source

    local result = MySQL.query.await("SELECT * FROM telegrams WHERE id = @id",
    {
        ['@id'] = tid
    })

    if result[1] == nil then
        QBCore.Functions.Notify(src, Lang:t('error.delete_fail'), 'error', 3000)
        return
    end

    MySQL.Async.execute("DELETE FROM telegrams WHERE id = @id",
    {
        ["@id"] = tid
    })

    QBCore.Functions.Notify(src, Lang:t('success.delete_success') , 'success', 3000)
    TriggerClientEvent('qb-telegram:client:ReadMessages', src)
end)

-- Get Players
QBCore.Functions.CreateCallback('qb-telegram:server:GetPlayers', function(source, cb)
    local players = {}
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM `address_book` WHERE owner = @owner  ORDER BY name ASC', {
        ["@owner"] = xPlayer.PlayerData.citizenid
    }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback('qb-telegram:server:GetPlayersPostOffice', function(source, cb)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM `address_book` WHERE owner = @owner  ORDER BY name ASC', {
        ["@owner"] = xPlayer.PlayerData.citizenid
    }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)


RegisterServerEvent('qb-telegram:server:SavePerson')
AddEventHandler('qb-telegram:server:SavePerson', function(name,cid)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    exports.oxmysql:execute('INSERT INTO address_book (`citizenid`, `name`, `owner`) VALUES (?, ?, ?);', {cid, name, xPlayer.PlayerData.citizenid})
    QBCore.Functions.Notify(src, "New Person add Successfuly" , 'success', 3000)
end)

RegisterServerEvent('qb-telegram:server:RemovePerson')
AddEventHandler('qb-telegram:server:RemovePerson', function(cid)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    MySQL.Async.execute("DELETE FROM address_book WHERE owner like @owner AND citizenid like @citizenid",
    {
        ["@owner"] = xPlayer.PlayerData.citizenid,
        ['citizenid'] = cid
    })

    QBCore.Functions.Notify(src, Lang:t('success.delete_success') , 'success', 3000)
end)


-- Command
QBCore.Commands.Add('addressbook', 'Your Personal Addressbook', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-telegram:client:OpenAddressbook', src)
end)
