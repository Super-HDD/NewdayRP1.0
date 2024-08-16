local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('addz_qr_roulette:removemoney')
AddEventHandler('addz_qr_roulette:removemoney', function(amount)
	local _amount = amount
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local xCitizen = xPlayer.PlayerData.citizenid
	if xPlayer.Functions.RemoveMoney("cash", _amount) then
		print('addz_qr_roulette: remove player ' .. xCitizen .. ' money $' .. _amount)
	else
		print('addz_qr_roulette: remove player ' .. xCitizen .. ' money $' .. _amount)
	end

end)

RegisterServerEvent('addz_qr_roulette:givemoney')
AddEventHandler('addz_qr_roulette:givemoney', function(action, amount)
	local action = action
	local _amount = amount
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)

	xPlayer.Functions.AddMoney("cash", _amount)

end)
