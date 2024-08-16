QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        local Player = QBCore.Functions.GetPlayerData()
    local firstname = Player.charinfo.firstname
    local lastname = Player.charinfo.lastname
    local playerjob = QBCore.Functions.GetPlayerData().job.label
    local playergrade = QBCore.Functions.GetPlayerData().job.grade.name
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bloodmoneyAmount = PlayerData.money['bloodmoney']
        bankAmount = PlayerData.money['bank']
    end)
        
        SendNUIMessage({
            name = '角色姓名     :    '..firstname..'      -     '..lastname,
            action = "name"
        })

        
        getGameTime()
        
        SendNUIMessage({

            
            job = '个人职业  :  '..playerjob..' - '..playergrade,
            action = 'job'
        })

        
        SendNUIMessage({
            cash = '现金数量     :                                '      ..cashAmount,
            action = 'cash'
        })

        SendNUIMessage({
            bank = '银行资金  :'..bankAmount,
            action = 'bank'
        })

        SendNUIMessage({
            black = '沾血之财    : '..bloodmoneyAmount,
            action = 'black'
        })

        

        
    end
end)

function getGameTime()
    local Player = QBCore.Functions.GetPlayerData()
    local firstname = Player.charinfo.firstname
    local lastname = Player.charinfo.lastname
    hour = GetClockHours()
	minute = GetClockMinutes()
    if hour <= 9 then
		hour = "0" .. firstname
	end
	if minute <= 9 then
		minute = "0" .. lastname
	end
end







