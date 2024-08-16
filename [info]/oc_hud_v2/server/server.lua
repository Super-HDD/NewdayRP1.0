QBCore = exports['qb-core']:GetCoreObject()
local cashAmount = 0
local bankAmount = 0
local bloodmoneyAmount = 0

RegisterServerEvent("oc_hud_v2:getMoneys")
AddEventHandler("oc_hud_v2:getMoneys", function(PlayerData)

	QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bloodmoneyAmount = PlayerData.money['bloodmoney']
        bankAmount = PlayerData.money['bank']
    end)
	local _source = source

	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil then

		local society 		= nil

		local user_identifier = nil
		user_identifier = xPlayer.getIdentifier()

		local grade_name 	= xPlayer.job.grade_name
		local job_name 		= xPlayer.job.name

		if grade_name == 'boss' then
	 		local mySociety = nil
			TriggerEvent('esx_society:getSociety', job_name, function(_society)
				mySociety = _society
			end)

	  		if mySociety ~= nil then

		    	TriggerEvent('esx_addonaccount:getSharedAccount', mySociety.account, function(account)
		      		society = account.money
		    	end)
		  	end
		end



	    TriggerClientEvent("oc_hud_v2:setValues", _source, cashAmount, bankAmount, bloodmoneyAmount, society, nil)
	end
end)














--Changed by oliann97