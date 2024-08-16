local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local cashAmount = 0
local bankAmount = 0
local bloodmoneyAmount = 0
local isLoggedIn = false
local incinematic = false
local inBathing = false
local showUI = true

RegisterNetEvent("HideAllUI")
AddEventHandler("HideAllUI", function()
    showUI = not showUI
end)

-- Events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bloodmoneyAmount = PlayerData.money['bloodmoney']
        bankAmount = PlayerData.money['bank']
    end)
end)
    
-- Money HUD
RegisterNetEvent('hud:client:ShowAccounts', function(type, amount)
    if type == 'cash' then
        SendNUIMessage({
            action = 'show',
            type = 'cash',
            cash = string.format("%.2f", amount)
        })
    elseif type == 'bloodmoney' then
        SendNUIMessage({
            action = 'show',
            type = 'bloodmoney',
            bloodmoney = string.format("%.2f", amount)
        })
    elseif type == 'bank' then
        SendNUIMessage({
            action = 'show',
            type = 'bank',
            bank = string.format("%.2f", amount)
        })
    end
end)

RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bloodmoneyAmount = PlayerData.money['bloodmoney']
        bankAmount = PlayerData.money['bank']
    end)
    SendNUIMessage({
        action = 'update',
        cash = QBCore.Shared.Round(cashAmount, 2),
        bloodmoney = QBCore.Shared.Round(bloodmoneyAmount, 2),
        bank = QBCore.Shared.Round(bankAmount, 2),
        amount = QBCore.Shared.Round(amount, 2),
        minus = isMinus,
        type = type,
    })
end)

-- Letters on the UI
Citizen.CreateThread(function()
    while true do
       Wait(5)
     if isLoggedIn and incinematic == false and inBathing == false and showUI then
        local Player = QBCore.Functions.GetPlayerData()
        local firstname = Player.charinfo.firstname
        local lastname = Player.charinfo.lastname
        local playerjob = QBCore.Functions.GetPlayerData().job.label
        local playergrade = QBCore.Functions.GetPlayerData().job.grade.name
        QBCore.Functions.GetPlayerData(function(PlayerData)
            Playercid = PlayerData.citizenid
            cashAmount = PlayerData.money['cash']
            bloodmoneyAmount = PlayerData.money['bloodmoney']
            bankAmount = PlayerData.money['bank']
        end)
            
            SendNUIMessage({
                name = '公民ID     :    '..Playercid,
                action = "name"
            })
    
           
        end
    end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
        if enableShadow then 
            SetTextDropshadow(1, 0, 0, 0, 255) 
        end
            SetTextFontForCurrentCommand(7)
            DisplayText(str, x, y)
        end

-- check cinematic and hide hud
CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local cinematic = Citizen.InvokeNative(0xBF7C780731AADBF8, Citizen.ResultAsInteger())
            local isBathingActive = exports['qb-bathing']:IsBathingActive()

            if cinematic == 1 then
                incinematic = true
            else
                incinematic = false
            end

            if isBathingActive then
                inBathing = true
            else
                inBathing = false
            end
        end

        Wait(500)
    end
end)
