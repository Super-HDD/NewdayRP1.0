local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent("slrp-exotic:dropcoconut")
AddEventHandler("slrp-exotic:dropcoconut", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('coconut', givecoconut)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Coconut~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering coconut   🥥')
			elseif _subRan == 3 then
				Player.Functions.AddItem('coconut', givecoconut)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Coconut~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering coconut   🥥')
			elseif _subRan == 4 then
				Player.Functions.AddItem('coconut', givecoconut)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Coconut~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering coconut   🥥')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('coconut', givecoconut)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Coconut~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering coconut   🥥')
			elseif _subRan == 2 then
				Player.Functions.AddItem('coconut', givecoconut)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Coconut~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering coconut   🥥')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:dropkiwi")
AddEventHandler("slrp-exotic:dropkiwi", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('kiwi', givekiwi)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kiwi'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Kiwi~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering kiwi   🥝')
			elseif _subRan == 3 then
				Player.Functions.AddItem('kiwi', givekiwi)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kiwi'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Kiwi~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering kiwi   🥝')
			elseif _subRan == 4 then
				Player.Functions.AddItem('kiwi', givekiwi)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kiwi'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Kiwi~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering kiwi   🥝')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('kiwi', givekiwi)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kiwi'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Kiwi~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering kiwi   🥝')
			elseif _subRan == 2 then
				Player.Functions.AddItem('kiwi', givekiwi)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['kiwi'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Kiwi~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering kiwi   🥝')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:dropbanana")
AddEventHandler("slrp-exotic:dropbanana", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('banana', givebanana)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['banana'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Banana~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering banana   🍌')
			elseif _subRan == 3 then
				Player.Functions.AddItem('banana', givebanana)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['banana'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Banana~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering banana   🍌')
			elseif _subRan == 4 then
				Player.Functions.AddItem('banana', givebanana)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['banana'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Banana~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering banana   🍌')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('banana', givebanana)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['banana'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Banana~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering banana   🍌')
			elseif _subRan == 2 then
				Player.Functions.AddItem('banana', givebanana)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['banana'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Banana~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering banana   🍌')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:dropananas")
AddEventHandler("slrp-exotic:dropananas", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    --local drop = Config.ananas[math.random(1, #Config.ananas)]
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('pineapple', givepineapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pineapple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pineapple   🍍')
			elseif _subRan == 3 then
				Player.Functions.AddItem('pineapple', givepineapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pineapple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pineapple   🍍')
			elseif _subRan == 4 then
				Player.Functions.AddItem('pineapple', givepineapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pineapple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pineapple   🍍')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('pineapple', givepineapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pineapple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pineapple   🍍')
			elseif _subRan == 2 then
				Player.Functions.AddItem('pineapple', givepineapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pineapple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pineapple   🍍')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:melonmango")
AddEventHandler("slrp-exotic:melonmango", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname         
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('mango', givemango)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mango'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Mango~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering mango   🥭')
			elseif _subRan == 3 then
				Player.Functions.AddItem('mango', givemango)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mango'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Mango~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering mango   🥭')
			elseif _subRan == 4 then
				Player.Functions.AddItem('mango', givemango)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mango'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Mango~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering mango   🥭')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('melon', givemelon)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['melon'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Melon~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering melon   🍈')
			elseif _subRan == 2 then
				Player.Functions.AddItem('melon', givemelon)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['melon'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Melon~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering melon   🍈')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:appear")
AddEventHandler("slrp-exotic:appear", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname      
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('apple', giveapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['apple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Apple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering apple   🍎')
			elseif _subRan == 3 then
				Player.Functions.AddItem('apple', giveapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['apple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Apple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering apple   🍎')
			elseif _subRan == 4 then
				Player.Functions.AddItem('apple', giveapple)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['apple'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Apple~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering apple   🍎')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('pear', givepear)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pear'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pear~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pear   🍐')
			elseif _subRan == 2 then
				Player.Functions.AddItem('pear', givepear)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pear'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Pear~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering pear   🍐')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end
end)

RegisterServerEvent("slrp-exotic:citrus")
AddEventHandler("slrp-exotic:citrus", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname       
    local amount = math.random(1, 1)
    if amount > 0 and amount <= 70 then
        local _subRan = math.random(1,5)
			if _subRan == 1 then
				Player.Functions.AddItem('orange', giveorange)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['orange'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Orange~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering orange   🍊')
			elseif _subRan == 3 then
				Player.Functions.AddItem('orange', giveorange)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['orange'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Orange~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering orange   🍊')
			elseif _subRan == 4 then
				Player.Functions.AddItem('orange', giveorange)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['orange'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Orange~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering orange   🍊')
			else
			TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
			TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
		end

	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				Player.Functions.AddItem('lemon', givelemon)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lemon'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Lemon~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering lemon   🍋')
			elseif _subRan == 2 then
				Player.Functions.AddItem('lemon', givelemon)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lemon'], "add")
				TriggerClientEvent('bm-weapons:client:Notifications', source, "You found " .. amount ..  " ~o~Lemon~q~.",'')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' Is gathering lemon   🍋')
			else
				TriggerClientEvent('QBCore:Notify', src, 'you failed to find anything', '')
				TriggerEvent('rsg-log:server:CreateLog', 'shops', 'Gathering ', 'orange', firstname..' '..lastname..' failed gathering ')
			end
		end 
end)