local QBCore = exports['qb-core']:GetCoreObject()
local CowsLoaded = false
local isFunctionPas = {}


Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if CowsLoaded then
            TriggerClientEvent('kerry-cows:client:updateCowData', -1, Config.FarmCows)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('kerry-cows:server:getCows')
    CowsLoaded = true
end)

local getCowsByOwnerWithSpawnedFlag=function(source,spawnFlag)
    local citizenid=QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local result = MySQL.query.await('SELECT * FROM player_cow WHERE citizenid =@citizenid AND spawnedFlag = @spawnFlag',{
        ['@citizenid']=citizenid,
        ['@spawnFlag']=spawnFlag
    })
    if result[1] then
        for i = 1, #result do
            result[i]=json.decode(result[i].properties)
            if Config.Debug then 
                print('result')
                print(QBCore.Debug(result[i])) 
            end
        end
    end
    return result
end

local getCowsByOwner=function(source)
    local citizenid=QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local result = MySQL.query.await('SELECT * FROM player_cow WHERE citizenid =@citizenid',{
        ['@citizenid']=citizenid
    })
    local cowsData={}
    if result[1] then
        for i = 1, #result do
            result[i]=json.decode(result[i].properties)
            table.insert(cowsData,result[i])
            if Config.Debug then 
                print('result')
                print(QBCore.Debug(result[i])) 
            end
        end
    end
    return result
end

RegisterNetEvent('kerry-cows:server:spawnedCow')
AddEventHandler('kerry-cows:server:spawnedCow', function(spawnedCow)
  --print(' spawned cows: ' ..spawnedCow.spawnedCow)

    TriggerClientEvent('kerry-cows:client:spawnedCow', -1, spawnedCow)
end)


RegisterServerEvent('kerry-cows:server:getCows')
AddEventHandler('kerry-cows:server:getCows', function()
Config.FarmCows = {}
    MySQL.Async.execute('UPDATE player_cow SET spawned = @spawned', {
	['@spawned'] = 0
	}, function(rowsChanged)
        if rowsChanged > 0 then
            --print('The flag "spawned" values for cows have been reset to 0')
        end
    end)
    local data = {}
    local result = MySQL.query.await('SELECT * FROM player_cow')
    if result[1] then
        for i = 1, #result do
            local cowsData = json.decode(result[i].properties)
            print('loading '..cowsData.cowname)
            table.insert(Config.FarmCows, cowsData)
        end
    end
end)

RegisterServerEvent('kerry-cows:server:upCows')
AddEventHandler('kerry-cows:server:upCows', function()
    local data = {}
	Config.FarmCows = {}
    local result = MySQL.query.await('SELECT * FROM player_cow WHERE citizenid = ')
    if result[1] then
        for i = 1, #result do
            local cowsData = json.decode(result[i].properties)
            table.insert(Config.FarmCows, cowsData)
			 TriggerClientEvent('kerry-cows:client:updateCowData', -1, Config.FarmCows)
        end
    end
end)

-- RegisterServerEvent('kerry-cows:server:get-cows-by-owner')
-- AddEventHandler('kerry-cows:server:get-cows-by-owner', function(citizenid)
--     local data = {}
-- 	Config.FarmCows = {}
--     local query= 'SELECT * FROM player_cow WHERE citizenid = \''.. citizenid..'\''
--     if Config.Debug then print(query) end
--     local result = MySQL.query.await(query)
--     if result[1] then
--         for i = 1, #result do
--             local cowsData = json.decode(result[i].properties)
--             if Config.Debug then print(cowsData) end
--             table.insert(Config.FarmCows, cowsData)
-- 			 TriggerClientEvent('kerry-cows:client:updateCowData', -1, Config.FarmCows)
--         end
--     end
-- end)
QBCore.Functions.CreateCallback('kerry-cows:callback:get-cows-by-owner',function(source,cb)
    local result=getCowsByOwner(source)
    cb(result)
end)

RegisterServerEvent('kerry-cows:server:cowssell')
AddEventHandler('kerry-cows:server:cowssell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid 
	local price = Config.CowPrice
    if (Player.PlayerData.money.cash < price) then
	TriggerClientEvent('QBCore:Notify', src, Lang:t('error.enough_cash'), 'error', 5000)
        return
    end
	Player.Functions.RemoveMoney('cash', price)
	TriggerClientEvent('kerry-cows:client:newcowspawn', src)
end)

RegisterServerEvent('kerry-cows:server:cowsNew')
AddEventHandler('kerry-cows:server:cowsNew', function(cowId, pos, model, hash, cowname, outfit)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid 

    local CowData = {
        id = cowId, 
        x = pos.x, 
        y = pos.y, 
        z = pos.z, 
        hash = hash,
        bought = Player.PlayerData.citizenid,
		model = model,
		cowname = cowname,
		outfit = outfit,
		state = 50.0, 
        lastTime = 0
    }
		table.insert(Config.FarmCows, CowData)
        TriggerEvent('kerry-cows:server:saveCow', CowData, cowId, citizenid)
end)

Citizen.CreateThread(function()
    while true do
        Wait(Config.WaitStateMinus)
        
        for i = 1, #Config.FarmCows do
            local cow = Config.FarmCows[i]
             cow.state = cow.state - 1 
            
            if cow.state < 0 then
                cow.state = 0
            end	
			TriggerEvent('kerry-cows:server:update', Config.FarmCows[i].id, Config.FarmCows[i])
			
        end
		TriggerEvent('kerry-cows:server:updateCows')
    end
end)

RegisterServerEvent('kerry-cows:server:startImprovement')
AddEventHandler('kerry-cows:server:startImprovement', function(cowbaseId)
    local src = source

    if isFunctionPas[cowbaseId] then
        return 
    end

    for i = 1, #Config.FarmCows do
        local cow = Config.FarmCows[i]
        if cow.id == cowbaseId then
            local minDelay = Config.MinDelay
            local maxDelay = Config.MaxDelay
            local delay = math.random(minDelay, maxDelay) * 60 * 1000 

            isFunctionPas[cowbaseId] = true 
            Citizen.Wait(delay) 

            cow.state = cow.state + math.random(1, 20)

            if cow.state > 100 then
                cow.state = 100
            end

            TriggerEvent('kerry-cows:server:update', cowbaseId, cow)
            TriggerEvent('kerry-cows:server:updateCows')
            TriggerClientEvent('QBCore:Notify', src, 'State ' .. cow.cowname .. ' improved to ' .. cow.state .. '%')
            isFunctionPas[cowbaseId] = false 
            break 
        end
    end
end)



RegisterServerEvent('kerry-cows:server:stan')
AddEventHandler('kerry-cows:server:stan', function(data)
local src = source
	for i = 1, #Config.FarmCows do
		local id = data.cowbaseId
        local cow = Config.FarmCows[i]
        if cow.id == id then
		TriggerClientEvent('QBCore:Notify', src, 'State ' .. cow.cowname .. ' ' .. cow.state .. '%')
		end
	end
end)

RegisterServerEvent('kerry-cows:server:updateCows')
AddEventHandler('kerry-cows:server:updateCows', function()
    local src = source
    TriggerClientEvent('kerry-cows:client:updateCowData', -1, Config.FarmCows)
end)

RegisterServerEvent('kerry-cows:server:saveCow')
AddEventHandler('kerry-cows:server:saveCow', function(CowData, cowId, citizenid)
    local CowData = json.encode(CowData)
    MySQL.Async.execute('INSERT INTO player_cow (properties, cowid, citizenid, spawned) VALUES (@properties, @cowid, @citizenid, @spawned)', {
        ['@properties'] = CowData,
        ['@cowid'] = cowId,
        ['@citizenid'] = citizenid,
		['@spawned'] = 0
    })
	TriggerEvent('kerry-cows:server:update')
end)

RegisterServerEvent('kerry-cows:server:updateSpawnedFlag')
AddEventHandler('kerry-cows:server:updateSpawnedFlag', function(spawned, cowId)
    MySQL.Async.execute('UPDATE player_cow SET spawned = @spawned WHERE cowid = @cowid', {
        ['@cowid'] = cowId,
        ['@spawned'] = spawned
    }, function(rowsChanged)
        if rowsChanged > 0 then
            --print('Прапор "spawned" корови оновлено в базі даних')
        else
           -- print('Помилка при оновленні прапора "spawned" корови')
        end
    end)
end)


RegisterServerEvent('kerry-cows:server:update')
AddEventHandler('kerry-cows:server:update', function(id, cowData)
    local result = MySQL.query.await('SELECT * FROM player_cow WHERE cowid = @cowid', {
        ['@cowid'] = id
    })
    if result[1] then
        local newData = json.encode(cowData)
        MySQL.Async.execute('UPDATE player_cow SET properties = @properties WHERE cowid = @id', {
            ['@properties'] = newData,
            ['@id'] = id
        })
    end
end)

RegisterServerEvent('kerry-cows:server:checkSpawnedFlag')
AddEventHandler('kerry-cows:server:checkSpawnedFlag', function(data)
	local src = source
    MySQL.Async.fetchScalar('SELECT spawned FROM player_cow WHERE cowid = @cowid', {
        ['@cowid'] = data.cowId
    }, function(result)
        if result ~= nil then
            local spawnedFlag = tonumber(result)
            
            if spawnedFlag == 0 then
                TriggerClientEvent('QBCore:Notify', src, 'You released ' ..data.name, 'success')
                TriggerClientEvent('kerry-cows:client:cowspawn', src, data.cowId, spawnedFlag)
            else
			TriggerClientEvent('QBCore:Notify', src, 'Cow ' ..data.name.. ' not in the cowshed!', 'error')
            end
        end
    end)
end)

RegisterServerEvent('kerry-cows:server:updateCowCoords')
AddEventHandler('kerry-cows:server:updateCowCoords', function(id, data)
    local result = MySQL.query.await('SELECT * FROM player_cow WHERE cowid = @cowid', {
        ['@cowid'] = id
    })

    if result[1] then
        local currentData = json.decode(result[1].properties) 
        
        currentData.x = data.x or currentData.x
        currentData.y = data.y or currentData.y
        currentData.z = data.z or currentData.z

        local newData = json.encode(currentData) 

        MySQL.Async.execute('UPDATE player_cow SET properties = @properties WHERE cowid = @id', {
            ['@properties'] = newData,
            ['@id'] = id
        }, function(rowsChanged)
          
            if rowsChanged > 0 then
            
				for i = 1, #Config.FarmCows do
					if Config.FarmCows[i].cowid == id then
						Config.FarmCows[i].x = currentData.x
						Config.FarmCows[i].y = currentData.y
						Config.FarmCows[i].z = currentData.z
						break
					end
				end
            end
        end)
    end
end)

RegisterServerEvent('kerry-cows:server:doyCow')
AddEventHandler('kerry-cows:server:doyCow', function(cowbaseId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local milk = Config.Milk
    local milkAmount = 0
    
    for i = 1, #Config.FarmCows do
        local cow = Config.FarmCows[i]
        
        if cow.id == cowbaseId then
            local currentTime = os.time()
            local lastTime = cow.lastTime or 0 
            
            if currentTime - lastTime >= Config.MilkCooldown * 60 then
                local currentState = cow.state
                
                if currentState >= 90 then
                    milkAmount = 25
                elseif currentState >= 80 then
                    milkAmount = 20
                elseif currentState >= 70 then
                    milkAmount = 17
                elseif currentState >= 60 then
                    milkAmount = 15
                elseif currentState >= 50 then
                    milkAmount = 12
                elseif currentState >= 40 then
                    milkAmount = 10
                elseif currentState >= 30 then
                    milkAmount = 8
                elseif currentState >= 20 then
                    milkAmount = 5
                elseif currentState >= 10 then
                    milkAmount = 3
                elseif currentState >= 0 then
                    milkAmount = 1
                end
                
                cow.lastTime = currentTime
                Player.Functions.AddItem(milk, milkAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[milk], "add")
                TriggerClientEvent('QBCore:Notify', src, 'Received milk: ' .. milkAmount .. ' liters', 'success')
                
                TriggerEvent('kerry-cows:server:update', cow.id, cow)
                TriggerEvent('kerry-cows:server:updateCows')
            else
                local remainingTime = math.ceil((Config.MilkCooldown * 60 - (currentTime - lastTime)) / 60)
                TriggerClientEvent('QBCore:Notify', src, cow.cowname .. ' 没有牛奶, 距离上一次挤奶 ' .. remainingTime .. '分钟', 'error')
            end
            break
        end
    end
end)

-- QBCore.Command.add('cow',function(Source)
--     local SpawnedCows=getCowsByOwnerWithSpawnedFlag(Source,0)
--     for i in #SpawnedCows do
--         TriggerClientEvent('kerry-cows:client:cowspawn', Source, SpawnedCows[i].cowId, spawnedFlag)
--     end 
-- end)

RegisterServerEvent('kerry-cows:server:setCowSpawnedFlag',function(spawnedFlag)
    local src=source
    local cows =getCowsByOwner(src)
    if Config.Debug then 
        print('reset spawned flag')
        print(QBCore.Debug(src)) 
    end
    if cows[1] then
        for i =1, #cows do
            MySQL.Async.execute('UPDATE player_cow SET spawned = @flag WHERE cowid = @id', {
                ['@flag'] = spawnedFlag,
                ['@id'] = cows[i].id
            })
        end
    end
end)

