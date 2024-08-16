

QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('MR_Petrol:comjob')
AddEventHandler('MR_Petrol:comjob', function()
    local _source = source

            TriggerClientEvent('MR_Petrol:comienzo',_source)
			
        
	        QBCore.Functions.Notify( _source, Language.translate[Config.lang]['gopos'], 'primary', 3000)

end)


RegisterServerEvent('MR_Petrol:worker')
AddEventHandler('MR_Petrol:worker', function()
    local _source = source
	 math.randomseed(os.time())
    local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddItem('pomade', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['pomade'], "add")
	Player.Functions.AddItem('water',1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['water'], "add")
	Player.Functions.AddItem('bread',1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bread'], "add")
QBCore.Functions.Notify( source, Language.translate[Config.lang]['nojob'], 'primary', 3000)
	Player.Functions.AddMoney('cash', 50)
QBCore.Functions.Notify( _source, "得到了50美元和一些食物", 'primary', 3000)

end)
