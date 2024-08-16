local QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("ricx_buy_farmanimal:check")
AddEventHandler("ricx_buy_farmanimal:check", function()
    local _source = source
    local go = true
    if Config.MenuJob ~= false then 
        go = false
        local User = QBCore.Functions.GetPlayer(_source)
        local job = User.PlayerData.job.name
        for i,v in pairs(Config.MenuJob) do 
            if v == job then 
                go = true 
                break
            end
        end
    end
    if go then 
        TriggerClientEvent("ricx_buy_farmanimal", _source)
    else
        TriggerClientEvent("Notification:left_farmanimals", _source, Config.Options.Messages.AnimalShop, Config.Options.Messages.NoJob, 'menu_textures', 'stamp_locked_rank', 3000)
    end
end)

RegisterServerEvent('ricx_farmanimal:buyanimal')
AddEventHandler( 'ricx_farmanimal:buyanimal', function ( name,model,preset,price )
    local _source   = source
    local _price = tonumber(price)
    local _model = tonumber(model)
    local _preset = tonumber(preset)
    local _name = tostring(name)

    local User = QBCore.Functions.GetPlayer(_source)


    local u_identifier = User.PlayerData.license
    local u_charid = User.PlayerData.cid
    local u_playername = User.PlayerData.charinfo.firstname.." "..User.PlayerData.charinfo.lastname
    local u_money = User.PlayerData.money.cash
	

        if u_money < _price then
            TriggerClientEvent("Notification:left_farmanimals", _source, Config.Options.MenuTexts.Title, Config.Options.Messages.NoMoney, 'menu_textures', 'stamp_locked_rank', 3000)
            return
        else
            local animalid = math.random(1,999999)
            local Parameters = { ['identifier'] = u_identifier, ['charid'] = u_charid, ['animalid'] = animalid, ['model'] = _model, ['preset'] = _preset, ['name'] = _name, ['xp'] = 0, ['price'] = _price}
            MySQL.Async.insert('INSERT INTO farmanimals (identifier, charid, animalid, model, preset, name, xp, price) VALUES (:identifier, :charid, :animalid, :model, :preset, :name, :xp, :price)', {
                identifier = u_identifier,
                charid = u_charid, 
                animalid = animalid, 
                model = _model,
                preset = _preset,
                name = _name,
                xp = 0,
                price = _price,
            })
            TriggerClientEvent("Notification:left_farmanimals", _source, Config.Options.MenuTexts.Title, Config.Options.Messages.BoughtAnimal, 'menu_textures', 'stamp_locked_rank', 3000)
            User.Functions.RemoveMoney("cash", _price, "RicX Farmanimals: Buy Animal")
        end
end)

RegisterServerEvent('ricx_farmanimal:getFarmAnimals')
AddEventHandler('ricx_farmanimal:getFarmAnimals', function()
    local _source = source
    local User = QBCore.Functions.GetPlayer(_source)
    local identifier = User.PlayerData.license
    local charid = User.PlayerData.cid
        TriggerEvent('ricx_farmanimal:getFarmAnimals_db',identifier, charid, function(call)
            if call then
                TriggerClientEvent('ricx_farmanimal:putInTable', _source, call)
            end
        end)
end)


RegisterServerEvent('ricx_farmanimal:getFarmAnimals_db')
AddEventHandler('ricx_farmanimal:getFarmAnimals_db', function(identifier,charid,callback)
    local Callback = callback
    MySQL.query("SELECT * FROM farmanimals WHERE identifier= ? AND charid= ?", {identifier, charid}, function(animals)
        if animals[1] then
            Callback(animals)
        else
            Callback(false)
        end
    end)
end)

RegisterServerEvent('ricx_farmanimal:SetAnimal')
AddEventHandler('ricx_farmanimal:SetAnimal', function(model,name,preset,xp,price,animalid)
    local _source = source
    local User = QBCore.Functions.GetPlayer(_source)
    local identifier = User.PlayerData.license
    local charid = User.PlayerData.cid

    MySQL.query('SELECT * FROM farmanimals WHERE identifier= ? AND charid= ? AND animalid=? AND model=? AND name=?;', {identifier, charid, animalid, model, name}, function(animals)
            if animals[1] then
                TriggerClientEvent('ricx_farmanimal:spawnanimal', _source, model, name, preset, xp, price, animalid)
            end
    end)
end)


RegisterServerEvent('ricx_farmanimal:DeleteAnimal')
AddEventHandler('ricx_farmanimal:DeleteAnimal', function(model,name,preset,xp,price,animalid,killerid)
    local _source = source
    local User = QBCore.Functions.GetPlayer(_source)
    local u_identifier = User.PlayerData.license
    local u_charid = User.PlayerData.cid

        MySQL.query("DELETE FROM farmanimals WHERE identifier = ? AND charid = ? AND animalid=? AND model=? AND name=?", {u_identifier, u_charid, animalid, model, name}, function(done)
        end)
end)

RegisterServerEvent('ricx_farmanimal:SellAnimal')
AddEventHandler('ricx_farmanimal:SellAnimal', function(id,model,name,preset,xp,price,animalid,odds, items)
    local _source = source
    local _price = tonumber(price)
    local odds1 = tonumber(odds)
    local _sum = _price * odds1
    local _animalid = tonumber(animalid)
    local _model = tonumber(model)
    local _name = tostring(name)
    local User = QBCore.Functions.GetPlayer(_source)
    local u_identifier = User.PlayerData.license
    local u_charid = User.PlayerData.cid
    User.Functions.AddMoney("cash", _sum, "RicX Farmanimals: Sell Animal")
    if not items then 
        User.Functions.AddMoney("cash", _sum, "RicX Farmanimals: Sell Animal")
    else
        for i,v in pairs(items) do 
            User.Functions.AddItem(v.item, v.amount)
        end
    end
        MySQL.query("DELETE FROM farmanimals WHERE identifier = ? AND charid = ? AND animalid=? AND model=? AND name=?", {u_identifier, u_charid, animalid, model, name}, function(done)
        end)
    TriggerClientEvent("ricx_farmanimal:soldanimal",_source, id)
end)

RegisterServerEvent("ricx_farmanimal:finishedeating")
AddEventHandler("ricx_farmanimal:finishedeating", function(data)
    local _source = source
    local User = QBCore.Functions.GetPlayer(_source)
    local u_identifier = User.PlayerData.license
    local u_charid = User.PlayerData.cid

        local newxp = data.xp
        if newxp < 800 then
            MySQL.update("UPDATE farmanimals SET xp= ? WHERE identifier= ? AND charid=? AND model=? AND animalid =?", {newxp, u_identifier, u_charid,data.model, data.animalid})
        end
end)