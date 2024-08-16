MenuData = {}
TriggerEvent("menu_base:getData",function(call)
--TriggerEvent("redemrp_menu_base:getData",function(call)    
    MenuData = call
end)

local CurrentAnimals = {}
local CurrentSpawned = {}
local AnimalBlips = {}
local GrazePrompt = {}
local HerdPrompt = {}
local ComePrompt = {}
local FleePrompt = {}
local PromptGroup = GetRandomIntInRange(0, 0xffffff)
local AnimalDicts = {}
local AnimalAnims = {}
local AnimalEating1 = {}
local AnimalFollow = {}
local PlayerDog
local _DogXP
local AnimalPromptGroup = {}
local ShopBlips = {}
local ButcherBlips = {}

local InAnimalShop = false
local coords = nil
local pdead = nil
local shopPrompts = {
    group = GetRandomIntInRange(0, 0xffffff),
    prompt = false,
}

function SetupShopPrompt() 
    local str = (Config.Options.OpenText or "Open")
    shopPrompts.prompt = PromptRegisterBegin()
    PromptSetControlAction(shopPrompts.prompt,Config.Options.ControlKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(shopPrompts.prompt, str)
    PromptSetEnabled(shopPrompts.prompt, 1)
    PromptSetVisible(shopPrompts.prompt, 1)
    PromptSetStandardMode(shopPrompts.prompt,1)
    PromptSetGroup(shopPrompts.prompt, shopPrompts.group)
    PromptRegisterEnd(shopPrompts.prompt)
end

function SetupGrazePrompt(i)
        local str = Config.Options.AnimalControls.Graze[1]
        GrazePrompt[i] = PromptRegisterBegin()
        PromptSetControlAction(GrazePrompt[i],Config.Options.AnimalControls.Graze[2])--down
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(GrazePrompt[i], str)
        PromptSetEnabled(GrazePrompt[i], 1)
        PromptSetVisible(GrazePrompt[i], 1)
		PromptSetStandardMode(GrazePrompt[i],1)
		PromptSetGroup(GrazePrompt[i], AnimalPromptGroup[i])
		PromptRegisterEnd(GrazePrompt[i])
end

function SetupHerdPrompt(i)
		local str = Config.Options.AnimalControls.Herd[1]
        HerdPrompt[i] = PromptRegisterBegin()
        PromptSetControlAction(HerdPrompt[i], Config.Options.AnimalControls.Herd[2])--right arrow
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(HerdPrompt[i], str)
        PromptSetEnabled(HerdPrompt[i], 1)
        PromptSetVisible(HerdPrompt[i], 1)
		PromptSetStandardMode(HerdPrompt[i],1)
		PromptSetGroup(HerdPrompt[i], AnimalPromptGroup[i])
		PromptRegisterEnd(HerdPrompt[i])
end

function SetupComePrompt(i)
		local str =  Config.Options.AnimalControls.Follow[1]
        ComePrompt[i] = PromptRegisterBegin()
        PromptSetControlAction(ComePrompt[i], Config.Options.AnimalControls.Follow[2])--Left arrow
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ComePrompt[i], str)
        PromptSetEnabled(ComePrompt[i], 1)
        PromptSetVisible(ComePrompt[i], 1)
		PromptSetStandardMode(ComePrompt[i],1)
		PromptSetGroup(ComePrompt[i], AnimalPromptGroup[i])
		PromptRegisterEnd(ComePrompt[i])
end

function SetupFleePrompt(i)
        local str = Config.Options.AnimalControls.Home[1]
        FleePrompt[i] = PromptRegisterBegin()
        PromptSetControlAction(FleePrompt[i], Config.Options.AnimalControls.Home[2])--up
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(FleePrompt[i], str)
        PromptSetEnabled(FleePrompt[i], 1)
        PromptSetVisible(FleePrompt[i], 1)
		--PromptSetHoldMode(OpenPrompt, 0)
		PromptSetStandardMode(FleePrompt[i],1)
		PromptSetGroup(FleePrompt[i], AnimalPromptGroup[i])
		PromptRegisterEnd(FleePrompt[i])
end

function AtShop(shopid)
    local _shopid = shopid
    local msg
    if _shopid == 0 then
        msg = Config.Options.ShopBlipName
    elseif _shopid == 1 then
        msg = Config.Options.MenuTexts.Butchery
    end
    SetTextScale(1.5, 1.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end

local AnimalShops = Config.AnimalShops
--[[
{
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-267.862, y=649.469, z=112.448, enabled = true}, --valentine 
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=1425.027, y=-1301.340, z=76.73, enabled = true},-- rhodes
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=1434.978, y=270.945, z=89.217, enabled = true},-- emerald
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-1818.062, y=-584.705, z=154.953, enabled = true},-- strawberry
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-2399.422, y=-2442.643, z=59.171, enabled = true},-- mcfarlane
}
]]
local Butcheries = Config.Butcheries
--[[
{
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=2148.404, y=-1301.273, z=42.624, enabled = false},
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=583.166, y=1666.126, z=185.250, enabled = false}, --
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=-957.262, y=-1314.851, z=49.550, enabled = false}, --
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=-1446.658, y=-2301.603, z=42.268, enabled = false}, --
}
]]

Citizen.CreateThread(function()
    SetupShopPrompt() 
    while true do
        Citizen.Wait(500)
        coords = GetEntityCoords(PlayerPedId())
        pdead = IsEntityDead(PlayerPedId())
    end
end)

Citizen.CreateThread(function()
    while true do
        local t = 5
        local dists1 = {}
        local dists2 = {}
        if coords ~= nil then
            for i,v in pairs(AnimalShops) do
                local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.x,v.y,v.z, true)
                dists1[i] = dist
                if dist < 1.5 then
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Options.ShopBlipName)
                    PromptSetActiveGroupThisFrame(shopPrompts.group, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,shopPrompts.prompt) then
                        TriggerServerEvent("ricx_buy_farmanimal:check")
                        --TriggerEvent("ricx_buy_farmanimal")
                        Citizen.Wait(1000)
                    end
                end
            end
            for i, v in pairs(Butcheries) do
                local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.x,v.y,v.z, true)
                dists2[i] = dist
                if dist < 1.5 then
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config.Options.MenuTexts.Butchery)
                    PromptSetActiveGroupThisFrame(shopPrompts.group, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,shopPrompts.prompt) then
                        TriggerEvent("ricx_farmanimal_sell:putInTable")
                        Citizen.Wait(2000)
                    end
                end
            end
            local cango1 = 0
            local cango2 = 0
            for i,v in pairs(dists1) do 
                if v > 10.0 then 
                    cango1 = cango1 + 1
                end
            end
            for i,v in pairs(dists2) do 
                if v > 10.0 then 
                    cango2 = cango2 + 1
                end
            end
            if cango1 == #dists1 and cango2 == #dists2 then 
                t = 2000
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)

Citizen.CreateThread(function()
    if Config.Options.BlipEnable == true then
        for i, v in pairs(AnimalShops) do
            if v.name ~= nil then
                ShopBlips[i] = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
                SetBlipSprite( ShopBlips[i], v.sprite, 1)
                SetBlipScale( ShopBlips[i], 0.2)
                Citizen.InvokeNative(0x9CB1A1623062F402,  ShopBlips[i], v.name)
            end
        end
        for i, v in pairs(Butcheries) do
            if v.name ~= nil then
                ButcherBlips[i] = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
                SetBlipSprite(ButcherBlips[i], v.sprite, 1)
                SetBlipScale(ButcherBlips[i], 0.2)
                Citizen.InvokeNative(0x9CB1A1623062F402, ButcherBlips[i], v.name)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local t = 5
        local dists = {}
        if coords ~= nil and InAnimalShop == false then
            for k,v in pairs(AnimalShops) do
                if v.enabled == true then
                    local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z,false)
                    dists[k] = distance
                    if (distance < 8.0) then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 128, 0, 0, 100, 0, 0, 2, 0, 0, 0, 0)
                    end  
                end
            end
            local cango = 0
            for i,v in pairs(dists) do 
                if v > 15.0 then 
                    cango = cango  + 1
                end
            end
            if cango == #dists then 
                t = 2000
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)
Citizen.CreateThread(function()
    while true do
        local t = 5
        local dists = {}
        if coords ~= nil then
            for k,v in pairs(Butcheries) do
                if v.enabled == true then
                    local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, coords.x, coords.y, coords.z,false)
                    dists[k] = distance
                    if (distance < 10.0) then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v.x, v.y, v.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 128, 0, 0, 100, 0, 0, 2, 0, 0, 0, 0)
                    end  
                end
            end
            local cango = 0
            for i,v in pairs(dists) do 
                if v > 15.0 then 
                    cango = cango  + 1
                end
            end
            if cango == #dists then 
                t = 2000
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)


function setPetBehavior (petPed)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 143493179)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -2040077242)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1222652248)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1077299173)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -887307738)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1998572072)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -661858713)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1232372459)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1836932466)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1878159675)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1078461828)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1535431934)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1862763509)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1663301869)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1448293989)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1201903818)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -886193798)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1996978098)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 555364152)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -2020052692)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 707888648)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 378397108)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -350651841)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1538724068)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1030835986)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1919885972)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1976316465)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 841021282)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 889541022)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1329647920)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -319516747)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -767591988)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -989642646)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), 1986610512)
	SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(petPed), -1683752762)
end

RegisterNetEvent("ricx_buy_farmanimal")
AddEventHandler("ricx_buy_farmanimal", function()
    MenuData.CloseAll()
    InAnimalShop = true
    local elements = {
        {label = Config.Options.MenuTexts.OwnedAnimals, value = 'buy_farmanimal10' , desc = Config.Options.MenuTexts.OwnedDesc},
        {label = Config.Options.MenuTexts.Chickens, value = 'buy_farmanimal1' , desc = "3 type"},
        {label = Config.Options.MenuTexts.Roosters, value = 'buy_farmanimal2' , desc = "2 type"},
        {label = Config.Options.MenuTexts.Turkeys, value = 'buy_farmanimal3' , desc = "1 type"},
        {label = Config.Options.MenuTexts.Rabbits, value = 'buy_farmanimal4' , desc = "3 type"},
        {label = Config.Options.MenuTexts.Goats, value = 'buy_farmanimal5' , desc = "2 type"},
        {label = Config.Options.MenuTexts.Pigs, value = 'buy_farmanimal6' , desc = "3 type"},
        {label = Config.Options.MenuTexts.Sheeps, value = 'buy_farmanimal7' , desc = "3 type"},
        {label = Config.Options.MenuTexts.Cows, value = 'buy_farmanimal8' , desc = "13 type"},
        {label = Config.Options.MenuTexts.Bulls, value = 'buy_farmanimal9' , desc = "5 type"},
    }

    MenuData.Open('default', GetCurrentResourceName(), 'buy_farm_animal_menu',{
        title    = Config.Options.MenuTexts.Title,
        subtext    = Config.Options.MenuTexts.SubText,
        align    = 'top-right',
        elements = elements,
    },
    function(data, menu)
        if(data.current.value == 'buy_farmanimal1') then
            TriggerEvent("ricx_buy_farmanimal:cat",1)
        elseif(data.current.value == 'buy_farmanimal2') then
            TriggerEvent("ricx_buy_farmanimal:cat",2)
        elseif(data.current.value == 'buy_farmanimal3') then
            TriggerEvent("ricx_buy_farmanimal:cat",3)
        elseif(data.current.value == 'buy_farmanimal4') then
            TriggerEvent("ricx_buy_farmanimal:cat",4)
        elseif(data.current.value == 'buy_farmanimal5') then
            TriggerEvent("ricx_buy_farmanimal:cat",5)
        elseif(data.current.value == 'buy_farmanimal6') then
            TriggerEvent("ricx_buy_farmanimal:cat",6)
        elseif(data.current.value == 'buy_farmanimal7') then
            TriggerEvent("ricx_buy_farmanimal:cat",7)
        elseif(data.current.value == 'buy_farmanimal8') then
            TriggerEvent("ricx_buy_farmanimal:cat",8)
        elseif(data.current.value == 'buy_farmanimal9') then 
            TriggerEvent("ricx_buy_farmanimal:cat",9)  
        elseif(data.current.value == 'buy_farmanimal10') then 
            TriggerServerEvent('ricx_farmanimal:getFarmAnimals')
            menu.close()
        end
    end,
    function(data, menu)
        menu.close()
        InAnimalShop = false
    end)
end)

RegisterNetEvent("ricx_buy_farmanimal:cat")
AddEventHandler("ricx_buy_farmanimal:cat", function(catnum)
    MenuData.CloseAll()
    InAnimalShop = true
    local _id = tonumber(catnum)
    local elements 
    local _title
    if _id == 1 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Chickens[1].." $"..Config.AnimalPrices[1], value = 'buy_animal_1' , desc = ""},
            {label =""..Config.Options.MenuOptions.Chickens[2].." $"..Config.AnimalPrices[2], value = 'buy_animal_2' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Chickens[3].." $"..Config.AnimalPrices[3], value = 'buy_animal_3' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Chickens
    elseif _id == 2 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Roosters[1].." $"..Config.AnimalPrices[4], value = 'buy_animal_4' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Roosters[2].." $"..Config.AnimalPrices[5], value = 'buy_animal_5' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Roosters
    elseif _id == 3 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Turkeys[1].." $"..Config.AnimalPrices[6], value = 'buy_animal_6' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Turkeys
    elseif _id == 4 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Rabbits[1].." $"..Config.AnimalPrices[7], value = 'buy_animal_7' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Rabbits[2].." $"..Config.AnimalPrices[8], value = 'buy_animal_8' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Rabbits[3].." $"..Config.AnimalPrices[9], value = 'buy_animal_9' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Rabbits
    elseif _id == 5 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Goats[1].." $"..Config.AnimalPrices[10], value = 'buy_animal_10' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Goats[2].." $"..Config.AnimalPrices[11], value = 'buy_animal_11' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Goats
    elseif _id == 6 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Pigs[1].." $"..Config.AnimalPrices[12], value = 'buy_animal_12' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Pigs[2].." $"..Config.AnimalPrices[13], value = 'buy_animal_13' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Pigs[3].." $"..Config.AnimalPrices[14], value = 'buy_animal_14' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Pigs
    elseif _id == 7 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Sheeps[1].." $"..Config.AnimalPrices[15], value = 'buy_animal_15' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Sheeps[2].." $"..Config.AnimalPrices[16], value = 'buy_animal_16' , desc = ""},
            {label = ""..Config.Options.MenuOptions.Sheeps[3].." $"..Config.AnimalPrices[17], value = 'buy_animal_17' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Sheeps
    elseif _id == 8 then
        elements = {
            {label =  ""..Config.Options.MenuOptions.Cows[1].." $"..Config.AnimalPrices[18], value = 'buy_animal_18' , desc = ""},--1
            {label =  ""..Config.Options.MenuOptions.Cows[2].." $"..Config.AnimalPrices[19], value = 'buy_animal_19' , desc = ""},--4
            {label =  ""..Config.Options.MenuOptions.Cows[3].." $"..Config.AnimalPrices[20], value = 'buy_animal_20' , desc = ""},--5
            {label =  ""..Config.Options.MenuOptions.Cows[4].." $"..Config.AnimalPrices[21], value = 'buy_animal_21' , desc = ""}, --6
            {label =  ""..Config.Options.MenuOptions.Cows[5].." $"..Config.AnimalPrices[22], value = 'buy_animal_22' , desc = ""},--7
            {label =  ""..Config.Options.MenuOptions.Cows[6].." $"..Config.AnimalPrices[23], value = 'buy_animal_23' , desc = ""},--8
            {label =  ""..Config.Options.MenuOptions.Cows[7].." $"..Config.AnimalPrices[24], value = 'buy_animal_24' , desc = ""},--9
            {label =  ""..Config.Options.MenuOptions.Cows[8].." $"..Config.AnimalPrices[25], value = 'buy_animal_25' , desc = ""}, --10
            {label =  ""..Config.Options.MenuOptions.Cows[9].." $"..Config.AnimalPrices[26], value = 'buy_animal_26' , desc = ""},--11
            {label =  ""..Config.Options.MenuOptions.Cows[10].." $"..Config.AnimalPrices[27], value = 'buy_animal_27' , desc = ""},--13
            {label =  ""..Config.Options.MenuOptions.Cows[11].." $"..Config.AnimalPrices[28], value = 'buy_animal_28' , desc = ""}, --15
            {label =  ""..Config.Options.MenuOptions.Cows[12].." $"..Config.AnimalPrices[29], value = 'buy_animal_29' , desc = ""},--18
            {label =  ""..Config.Options.MenuOptions.Cows[13].." $"..Config.AnimalPrices[30], value = 'buy_animal_30' , desc = ""}, --21
        }
        _title = Config.Options.MenuTexts.Cows
    elseif _id == 9 then
        elements = {
            {label = ""..Config.Options.MenuOptions.Bulls[1].." $"..Config.AnimalPrices[31], value = 'buy_animal_31' , desc = ""},
            {label =  ""..Config.Options.MenuOptions.Bulls[2].." $"..Config.AnimalPrices[32], value = 'buy_animal_32' , desc = ""},
            {label =  ""..Config.Options.MenuOptions.Bulls[3].." $"..Config.AnimalPrices[33], value = 'buy_animal_33' , desc = ""},
            {label =  ""..Config.Options.MenuOptions.Bulls[4].." $"..Config.AnimalPrices[34], value = 'buy_animal_34' , desc = ""},
            {label =  ""..Config.Options.MenuOptions.Bulls[5].." $"..Config.AnimalPrices[35], value = 'buy_animal_35' , desc = ""},
        }
        _title = Config.Options.MenuTexts.Bulls
    end

    MenuData.Open('default', GetCurrentResourceName(), 'farm_animal_category',{
        title    = _title,
        subtext    = Config.Options.MenuTexts.SubText,
        align    = 'top-right',
        elements = elements,
    },
    function(data, menu)
        if(data.current.value == 'buy_animal_1') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Chickens[1], `a_c_chicken_01`, 0, Config.AnimalPrices[1]) --name, preset, price, 
        elseif(data.current.value == 'buy_animal_2') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Chickens[2], `a_c_chicken_01`, 1, Config.AnimalPrices[2])
        elseif(data.current.value == 'buy_animal_3') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Chickens[3], `a_c_chicken_01`, 2, Config.AnimalPrices[3])
        elseif(data.current.value == 'buy_animal_4') then    
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Roosters[1], `a_c_rooster_01`, 0, Config.AnimalPrices[4])
        elseif(data.current.value == 'buy_animal_5') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Roosters[1], `a_c_rooster_01`, 1, Config.AnimalPrices[5])
        elseif(data.current.value == 'buy_animal_6') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Turkeys[1], `a_c_turkey_01`, 0, Config.AnimalPrices[6])
        elseif(data.current.value == 'buy_animal_7') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Rabbits[1], `a_c_rabbit_01`, 1, Config.AnimalPrices[7])
        elseif(data.current.value == 'buy_animal_8') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Rabbits[2], `a_c_rabbit_01`, 2, Config.AnimalPrices[8])
        elseif(data.current.value == 'buy_animal_9') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Rabbits[3], `a_c_rabbit_01`, 4, Config.AnimalPrices[9])
        elseif(data.current.value == 'buy_animal_10') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Goats[1], `a_c_goat_01`, 0, Config.AnimalPrices[10])
        elseif(data.current.value == 'buy_animal_11') then 
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Goats[2], `a_c_goat_01`, 1, Config.AnimalPrices[11])
        elseif(data.current.value == 'buy_animal_12') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Pigs[1], `a_c_pig_01`, 0, Config.AnimalPrices[12])
        elseif(data.current.value == 'buy_animal_13') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Pigs[2], `a_c_pig_01`, 1, Config.AnimalPrices[13])
        elseif(data.current.value == 'buy_animal_14') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Pigs[3], `a_c_pig_01`, 2, Config.AnimalPrices[14])
        elseif(data.current.value == 'buy_animal_15') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',  Config.Options.MenuOptions.Sheeps[1], `a_c_sheep_01`, 0, Config.AnimalPrices[15])
        elseif(data.current.value == 'buy_animal_16') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Sheeps[2], `a_c_sheep_01`, 2, Config.AnimalPrices[16])
        elseif(data.current.value == 'buy_animal_17') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Sheeps[3], `a_c_sheep_01`, 6, Config.AnimalPrices[17])
        elseif(data.current.value == 'buy_animal_18') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[1], `a_c_cow`, 1, Config.AnimalPrices[18])
        elseif(data.current.value == 'buy_animal_19') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[2], `a_c_cow`, 4, Config.AnimalPrices[19])
        elseif(data.current.value == 'buy_animal_20') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[3], `a_c_cow`, 5, Config.AnimalPrices[20])
        elseif(data.current.value == 'buy_animal_21') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[4], `a_c_cow`, 6, Config.AnimalPrices[21])
        elseif(data.current.value == 'buy_animal_22') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[5], `a_c_cow`, 7, Config.AnimalPrices[22])
        elseif(data.current.value == 'buy_animal_23') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[6], `a_c_cow`, 8, Config.AnimalPrices[23])
        elseif(data.current.value == 'buy_animal_24') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[7], `a_c_cow`, 9, Config.AnimalPrices[24])
        elseif(data.current.value == 'buy_animal_25') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[8], `a_c_cow`, 10, Config.AnimalPrices[25])
        elseif(data.current.value == 'buy_animal_26') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[9], `a_c_cow`, 11, Config.AnimalPrices[26])
        elseif(data.current.value == 'buy_animal_27') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[10], `a_c_cow`, 13, Config.AnimalPrices[27])
        elseif(data.current.value == 'buy_animal_28') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[11], `a_c_cow`, 15, Config.AnimalPrices[28])
        elseif(data.current.value == 'buy_animal_29') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[12], `a_c_cow`, 18, Config.AnimalPrices[29])
        elseif(data.current.value == 'buy_animal_30') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Cows[13], `a_c_cow`, 21, Config.AnimalPrices[30])
        elseif(data.current.value == 'buy_animal_31') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Bulls[1], `a_c_ox_01`, 0, Config.AnimalPrices[31])
        elseif(data.current.value == 'buy_animal_32') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Bulls[2], `a_c_ox_01`, 1, Config.AnimalPrices[32])
        elseif(data.current.value == 'buy_animal_33') then
            TriggerServerEvent('ricx_farmanimal:buyanimal',Config.Options.MenuOptions.Bulls[3], `a_c_bull_01`, 1, Config.AnimalPrices[33])
        elseif(data.current.value == 'buy_animal_34') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Bulls[4], `a_c_bull_01`, 2, Config.AnimalPrices[34])
        elseif(data.current.value == 'buy_animal_35') then
            TriggerServerEvent('ricx_farmanimal:buyanimal', Config.Options.MenuOptions.Bulls[5], `a_c_bull_01`, 0, Config.AnimalPrices[35])
        end
        Citizen.Wait(300)
    end,
    function(data, menu)
        menu.close()
        InAnimalShop = false
        TriggerEvent("ricx_buy_farmanimal")
    end)
end)

local animals_tab = {}

RegisterNetEvent('ricx_farmanimal:putInTable')
AddEventHandler('ricx_farmanimal:putInTable', function(animals)
    animals_tab = {}
    for i, k in pairs(animals) do
        table.insert(animals_tab, {model = animals[i].model, name = animals[i].name, preset = animals[i].preset, xp = animals[i].xp, price = animals[i].price, animalid = animals[i].animalid})
    end
	 FarmAnimals()
end)

function FarmAnimals()
    InAnimalShop = true
	local elements_animals = {}
    if animals_tab ~= nil then
        for j, z in pairs(animals_tab) do
            table.insert (elements_animals , {label = animals_tab[j].name, value = animals_tab[j], desc =  Config.Options.MenuTexts.Title })
        end
	end
	MenuData.CloseAll()
	MenuData.Open(
			'default', GetCurrentResourceName(), 'farm_animal_owned_menu',
			{
				title    = Config.Options.MenuTexts.OwnedAnimals,
				subtext    = '',
				align    = 'top-right',
				elements = elements_animals,
			},
			function(data, menu)
				FarmAnimalManage(data.current.value.model,data.current.value.name,data.current.value.preset,data.current.value.xp,data.current.value.price,data.current.value.animalid)
			end,
			function(data, menu)
				menu.close()
                InAnimalShop = false
	end)
end

local elements_o_animals = {
	{label = Config.Options.MenuOptions.ChooseAnimal, value = "SetAnimal" , desc = Config.Options.MenuOptions.ChooseAnimalSub },
	{label = Config.Options.MenuOptions.DeleteAnimal, value = "DeleteAnimal" , desc =  Config.Options.MenuOptions.DeleteAnimalSub }
}

function FarmAnimalManage(model,name,preset,xp,price,animalid)
    MenuData.CloseAll()
    InAnimalShop = true
    MenuData.Open(
        'default', GetCurrentResourceName(), 'owned_animal_menu_manage',
        {
            title    = Config.Options.MenuTexts.SubText,
            subtext    = '',
            align    = 'top-right',
            elements =  elements_o_animals,
        },
        function(data, menu)
            menu.close()
            InAnimalShop = false
            TriggerServerEvent('ricx_farmanimal:'..data.current.value , model,name,preset,xp,price,animalid,nil)
        end,
        function(data, menu)
            FarmAnimals()
	end)
end

local function GetLevel(xp)
    local level = 0
    for i,v in pairs(Config.LevelXPs) do 
        if xp <= v.max and xp >= v.min then 
            level = i 
            break 
        end
    end
    return level
end

RegisterNetEvent("ricx_farmanimal:spawnanimal")
AddEventHandler("ricx_farmanimal:spawnanimal", function( model, name, preset, xp, price, animalid)
    local _model = tonumber(model)
    local _name = tostring(name)
    local _preset = tonumber(preset)
    local _xp = tonumber(xp)
    local _price = tonumber(price)
    local _animalid = tonumber(animalid)
    local player = PlayerPedId()
    local canspawn = true
    local animal_level = GetLevel(_xp)
    local dict = "satchel_textures"
    local textr = ""
    
    if _model == `a_c_chicken_01` then
        textr = "animal_chicken_dominique"
    elseif _model == `a_c_rooster_01` then
        textr =  "animal_rooster_dominique"
    elseif _model == `a_c_turkey_01` then
        textr =  "animal_turkey_eastern"
    elseif _model == `a_c_rabbit_01` then
        textr =  "animal_rabbit"
    elseif _model == `a_c_goat_01` then
        textr =  "animal_goat"
    elseif _model == `a_c_pig_01` then
        textr =  "animal_pig_berkshire"
    elseif _model == `a_c_sheep_01` then
        textr =  "animal_sheep"
    elseif _model == `a_c_cow` then
        textr =  "animal_cow"
    elseif _model == `a_c_ox_01` then
        textr =  "animal_ox_angus"
    elseif _model == `a_c_bull_01` then
        textr =  "animal_bull_angus"
    end

    local scale = Config.AnimalLevel[animal_level].Scale
    local a_odds = Config.AnimalLevel[animal_level].MoneyOdds
    local items 
    if Config.AnimalLevel[animal_level].Items then 
        items = Config.AnimalLevel[animal_level].Items[_model] 
    end
    if CurrentAnimals then
        for i=1,Config.Options.MaxAnimals,1 do
            if CurrentAnimals[i] then
                if _animalid == CurrentAnimals[i]['animalid'] then
                    TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalSpawned, dict, textr, 3000)
                    canspawn = false
                    break
                end
            end
        end
    end
    if CurrentAnimals and canspawn then
        for i=1,Config.Options.MaxAnimals,1 do 
            if i == 11 then
                break
            end
            if CurrentAnimals[i] == nil then
                local pcoords, heading = GetEntityCoords(player), GetEntityHeading(player)
                local forwardoffset = GetOffsetFromEntityInWorldCoords(player,0.5,-1.0,0.0)
                RequestModel( _model )
                while not HasModelLoaded( _model ) do
                    Wait(500)
                end
                CurrentSpawned[i] = CreatePed(_model,forwardoffset.x,forwardoffset.y,forwardoffset.z, heading, 1, 1, 1, 1 )
                SetEntityAsMissionEntity(CurrentSpawned[i], true, true)
                CurrentAnimals[i] = {['texture'] = textr,['currentid'] = i, ['pedid'] = CurrentSpawned[i], ['model'] = _model, ['name'] = _name, ['preset'] = _preset, ['xp'] = _xp, ['price'] = _price, ['animalid'] = _animalid, ['level'] = animal_level, ['sellodds'] = a_odds, items = items}
                AnimalPromptGroup[i] = PromptGetGroupIdForTargetEntity(CurrentSpawned[i])
                SetupGrazePrompt(i)
                SetupHerdPrompt(i)
                SetupComePrompt(i)
                SetupFleePrompt(i)
                Citizen.InvokeNative(0x25ACFC650B65C538,CurrentSpawned[i],scale)
                SetModelAsNoLongerNeeded(_model)
                AnimalBlips[i] = Citizen.InvokeNative(0x23f74c2fda6e7c61, -214162151 , CurrentSpawned[i])
                local animalstring = CreateVarString(10, "PLAYER_STRING", _name)
                Citizen.InvokeNative(0x9CB1A1623062F402,AnimalBlips[i], animalstring)
                Citizen.InvokeNative(0x283978A15512B2FE, CurrentSpawned[i], true)
                Citizen.InvokeNative(0x77FF8D35EEC6BBC4, CurrentSpawned[i],_preset) 
                while not Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, CurrentSpawned[i]) do  
                    Citizen.Wait(0)
                end
                Citizen.InvokeNative(0x704C908E9C405136, CurrentSpawned[i])
                Citizen.InvokeNative(0xAAB86462966168CE, CurrentSpawned[i], 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, CurrentSpawned[i], 0, 1, 1, 1, false)
                SetPedNameDebug(CurrentSpawned[i], _name)
                SetPedPromptName(CurrentSpawned[i], _name)
                SetPedAsGroupMember(CurrentSpawned[i], GetPedGroupIndex(player))
                setPetBehavior(CurrentSpawned[i])
                TaskGoToEntity(CurrentSpawned[i], player, -1, 1.5, 2.0, 0, 0 )
                TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalHere..'('.._name..').', 'satchel_textures', textr, 3000)
                Wait(300)
                Citizen.InvokeNative(0x489FFCCCE7392B55, CurrentSpawned[i], player)
                return
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local t = 500
        if coords ~= nil and CurrentSpawned then
            for i=1,Config.Options.MaxAnimals,1 do
                if CurrentSpawned[i] then
                    if IsEntityDead(CurrentSpawned[i]) then
                        TriggerServerEvent('ricx_farmanimal:DeleteAnimal', CurrentAnimals[i]['model'],CurrentAnimals[i]['name'],CurrentAnimals[i]['preset'],CurrentAnimals[i]['xp'],CurrentAnimals[i]['price'],CurrentAnimals[i]['animalid'],nil)
                        Citizen.InvokeNative(0x00EDE88D4D13CF59,GrazePrompt[i])
                        Citizen.InvokeNative(0x00EDE88D4D13CF59,HerdPrompt[i])
                        Citizen.InvokeNative(0x00EDE88D4D13CF59,ComePrompt[i])
                        Citizen.InvokeNative(0x00EDE88D4D13CF59,FleePrompt[i])
                        GrazePrompt[i] = nil
                        HerdPrompt[i] = nil
                        ComePrompt[i] = nil
                        FleePrompt[i] = nil
                        CurrentAnimals[i] = nil
                        AnimalBlips[i] = nil
                        AnimalDicts[i] = nil
                        AnimalAnims[i] = nil
                        AnimalEating1[i] = nil
                        AnimalFollow[i] = nil
                        AnimalPromptGroup[i] = nil
                        CurrentSpawned[i] = nil
                    end
                end
            end
        else
            t = 500
        end
        Citizen.Wait(t)
    end
end)

Citizen.CreateThread(function() 
	while true do
		local t = 5
		if CurrentSpawned then
            if InAnimalShop == false then
                for i=1,Config.Options.MaxAnimals,1 do
                    if CurrentSpawned[i] then
                        local EntityPedCoord = GetEntityCoords( PlayerPedId() )
                        local EntitydogCoord = GetEntityCoords(CurrentSpawned[i])
                        local distance = 5.0
                        if AnimalFollow[i] == true then
                            distance = 9.0
                        end
                        if #( EntityPedCoord - EntitydogCoord ) < distance then
                            if HasEntityClearLosToEntityInFront(PlayerPedId(), CurrentSpawned[i]) then
                                local label  = CreateVarString(10, 'LITERAL_STRING', CurrentAnimals[i]['name'])
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,GrazePrompt[i]) then
                                    if AnimalEating1[i] == false or AnimalEating1[i] == nil then
                                        TriggerEvent("ricx_farmanimal:goeat", CurrentAnimals[i],i,CurrentSpawned[i])
                                        break
                                    else
                                        TriggerEvent("Notification:left_farmanimals",  Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalGrazing, 'satchel_textures', CurrentAnimals[i].texture, 3000)
                                    end
                                end
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,HerdPrompt[i]) then
                                    if AnimalEating1[i] == false or AnimalEating1[i] == nil then
                                        AnimalFollow[i] = true
                                        break
                                    elseif AnimalFollow[i] == true then
                                        AnimalFollow[i] = false
                                        break
                                    else
                                        TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalBusy, 'satchel_textures', CurrentAnimals[i].texture, 3000)
                                    end
                                end
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,ComePrompt[i]) then
                                    if AnimalEating1[i] == false or AnimalEating1[i] == nil then
                                        TriggerEvent("ricx_farmanimal:followanimal", i)
                                        break
                                    else
                                        TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalBusy, 'satchel_textures', CurrentAnimals[i].texture, 3000)
                                    end
                                end
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,FleePrompt[i]) then
                                    if AnimalEating1[i] == false or AnimalEating1[i] == nil then
                                        TriggerEvent("ricx_farmanimal:fleeanimal", i)
                                        AnimalEating1[i] = nil
                                        break
                                    else
                                        TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalBusy, 'satchel_textures', CurrentAnimals[i].texture, 3000)
                                    end
                                end
                            end
                        end
                    end
                end
            else
                t = 2000
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)



RegisterNetEvent('ricx_farmanimal:goeat')
AddEventHandler('ricx_farmanimal:goeat', function(data,id,pedid)
    local coordsped = GetEntityCoords(PlayerPedId())
    local acoord = GetEntityCoords(pedid)
    local town_name = Citizen.InvokeNative(0x43AD8FC02B429D33,acoord.x,acoord.y,acoord.z,1)
    if not IsEntityDead(pedid) then
        if town_name == 7359335 or 
        town_name == -744494798 or
        town_name == 1053078005 or 
        town_name == 2046780049 or 
        town_name == 3529426767 or 
        town_name == 427683330 or 
        town_name == 2770008149 or 
        town_name == 459833523 or 
        town_name == 2126321341 then
            TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.GrazeError, 'menu_textures', 'stamp_locked_rank', 2000)
        else
            AnimalEating1[id] = true
            AnimalFollow[id] = false
            local _model = tonumber(data.model)
            local dict
            local anim
            local _text = ""
            local XPboost = 0
            if _model == `a_c_bull_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_bull_grazing@base"
                AnimalAnims[id] = "base"
                XPboost = Config.Options.GrazeXPs.Bull
            elseif _model == `a_c_chicken_01` then
                AnimalDicts[id] = "amb_creatures_bird@world_chicken_eating@idle"
                AnimalAnims[id] = "idle_a"
                XPboost =  Config.Options.GrazeXPs.Chicken
            elseif _model == `a_c_cow` then
                AnimalDicts[id] = "amb_creature_mammal@world_cow_grazing@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Cow
            elseif _model == `a_c_goat_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_goat_eating_trough@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Goat
            elseif _model == `a_c_ox_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_bull_grazing@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Ox
            elseif _model == `a_c_pig_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_pig_eat_trough@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Pig
            elseif _model == `a_c_rabbit_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_rabbit_grazing@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Rabbit
            elseif _model == `a_c_rooster_01` then
                AnimalDicts[id] = "amb_creatures_bird@world_rooster_eating@idle"
                AnimalAnims[id] = "idle_a"
                XPboost =  Config.Options.GrazeXPs.Rooster
            elseif _model == `a_c_sheep_01` then
                AnimalDicts[id] = "amb_creature_mammal@world_sheep_grazing@base"
                AnimalAnims[id] = "base"
                XPboost =  Config.Options.GrazeXPs.Sheep
            elseif _model == `a_c_turkey_01` then
                AnimalDicts[id] = "amb_creatures_bird@world_turkey_grazing@idle0"
                AnimalAnims[id] = "idle_c"
                XPboost =  Config.Options.GrazeXPs.Turkey
            end
            dict = AnimalDicts[id]
            anim = AnimalAnims[id]
            ClearPedTasksImmediately(pedid)
            RequestAnimDict(dict)
            while ( not HasAnimDictLoaded( dict) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(pedid, dict, anim, 8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
            FreezeEntityPosition(pedid, true)
            local grazetime1 = Config.Options.GrazeTime
            local grazetime = grazetime1 * 1000
            Citizen.Wait(grazetime)
            FreezeEntityPosition(pedid, false)
            AnimalEating1[id] = false
            local _xp = data.xp + Config.Options.GrazeXP + XPboost
            local animal_level = GetLevel(_xp)
            local dict = "satchel_textures"
            local textr = ""
            print("XP:",_xp, "Level:",animal_level) 
            if not animal_level or not Config.AnimalLevel[animal_level] then
                print("cannot get animal level from config, default animal level is now 1")
                animal_level = 1 
            end
            local scale = Config.AnimalLevel[animal_level].Scale
            local a_odds = Config.AnimalLevel[animal_level].MoneyOdds
            local items 
            if Config.AnimalLevel[animal_level].Items then 
                items = Config.AnimalLevel[animal_level].Items[data.model] 
            end
            CurrentAnimals[id] = {['texture'] = data.texture,['currentid'] = id,['pedid'] = CurrentSpawned[id], ['model'] = data.model, ['name'] = data.name, ['preset'] = data.preset, ['xp'] = _xp, ['price'] = data.price, ['animalid'] = data.animalid, ['level'] = animal_level, ['sellodds'] = a_odds, items = Config.AnimalLevel[animal_level].Items}
            TriggerServerEvent("ricx_farmanimal:finishedeating",CurrentAnimals[id])
            Citizen.Wait(500)
            ClearPedTasksImmediately(pedid)
            Citizen.InvokeNative(0x25ACFC650B65C538,CurrentSpawned[id],scale)
            if PlayerDog and Config.RicXDog == true then
                local dco = GetEntityCoords(PlayerDog)
                local aco =  GetEntityCoords(CurrentSpawned[id])
                if _DogXP > 199 then
                    if GetDistanceBetweenCoords(dco,aco,true) < 15.0 then
                        _text = Config.Options.Messages.RicXDogs.GuardSuccess.." XP: ".._xp.." (Old: "..data.xp..")"
                        TriggerEvent("ricx_farmanimal:goeat",CurrentAnimals[id],id,pedid)
                        TriggerEvent('ricx_farmanimal:dogsucceed')
                    else
                        _text = Config.Options.Messages.RicXDogs.FinishedGraze.." XP".._xp.." (Old: "..data.xp..")"
                        TaskWanderStandard(CurrentSpawned[id], 10.0, 10)
                    end
                else
                    if GetDistanceBetweenCoords(dco,aco,true) < 15.0 then
                        local success = math.random(1,5)
                        if success == 2 then
                            _text = Config.Options.Messages.RicXDogs.GuardSuccess.."XP: ".._xp.." (Old: "..data.xp..")"
                            TriggerEvent('ricx_farmanimal:dogsucceed')
                            TriggerEvent("ricx_farmanimal:goeat",CurrentAnimals[id],id,pedid)
                        else
                            _text = Config.Options.Messages.RicXDogs.GuardFail.." XP: ".._xp.." (Old: "..data.xp..")"
                            TaskWanderStandard(CurrentSpawned[id], 10.0, 10)
                        end
                    else
                        _text =Config.Options.Messages.RicXDogs.FinishedGraze.." XP: ".._xp.." (Old: "..data.xp..")"
                        TaskWanderStandard(CurrentSpawned[id], 10.0, 10)
                    end
                end
            else
                _text = Config.Options.Messages.RicXDogs.FinishedGraze.." XP: ".._xp.." (Old: "..data.xp..")"
                TaskWanderStandard(CurrentSpawned[id], 10.0, 10)
            end
            TriggerEvent("Notification:left_farmanimals", data.name, _text, 'satchel_textures', data.texture, 3000)
        end
    end
end)

RegisterNetEvent('ricx_farmanimal:followanimal')
AddEventHandler('ricx_farmanimal:followanimal', function(id)
    AnimalFollow[id] = false
    local _id = tonumber(id)
    ClearPedTasksImmediately(CurrentSpawned[_id])
    TaskGoToEntity(CurrentSpawned[_id], PlayerPedId(), -1, 1.5, 2.0, 0, 0 )
    Wait(500)
    Citizen.InvokeNative(0x489FFCCCE7392B55, CurrentSpawned[_id], PlayerPedId())
    SetPedKeepTask(CurrentSpawned[_id], true)
end)

RegisterNetEvent('ricx_farmanimal:fleeanimal')
AddEventHandler('ricx_farmanimal:fleeanimal', function(animal)
    local _animal = tonumber(animal)
    if not IsEntityDead(CurrentSpawned[_animal]) then
        AnimalFollow[_animal] = false
        TaskAnimalFlee(CurrentSpawned[_animal], PlayerPedId(), -1)
        TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Title, Config.Options.Messages.AnimalHome, 'satchel_textures', CurrentAnimals[_animal].texture, 3000)
        Wait(3000)
        DeletePed(CurrentSpawned[_animal])
        SetEntityAsNoLongerNeeded(CurrentSpawned[_animal])

        CurrentAnimals[_animal] = nil
        CurrentSpawned[_animal] = nil
        AnimalEating1[_animal] = nil
        AnimalFollow[_animal] = nil
        AnimalAnims[_animal] = nil
        AnimalDicts[_animal] = nil
        AnimalPromptGroup[_animal] = nil
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    for i=1,Config.Options.MaxAnimals,1 do
        if CurrentSpawned[i] then
            DeletePed(CurrentSpawned[i])
            SetEntityAsNoLongerNeeded(CurrentSpawned[i])
            --TriggerServerEvent("ricx_farmanimals:deleteped_s", PedToNet(CurrentSpawned[i]))
            CurrentSpawned[i] = nil
        end
        if AnimalBlips[i] then
            RemoveBlip(AnimalBlips[i])
        end
    end
    for i, v in pairs(ButcherBlips) do
        RemoveBlip(ButcherBlips[i])
    end
    for i, v in pairs(ShopBlips) do
        RemoveBlip(ShopBlips[i])
    end
    CurrentAnimals = {}
    CurrentSpawned = {}
    AnimalBlips = {}
    AnimalDicts = {}
    AnimalAnims = {}
    AnimalEating1 = {}
    AnimalFollow = {}
    AnimalPromptGroup = {}
end)

AddEventHandler('playerDropped', function (reason)
    for i=1,Config.Options.MaxAnimals,1 do
        if CurrentSpawned[i] then
            DeletePed(CurrentSpawned[i])
            SetEntityAsNoLongerNeeded(CurrentSpawned[i])
            CurrentSpawned[i] = nil
        end
        if AnimalBlips[i] then
            RemoveBlip(AnimalBlips[i])
        end
    end
    for i, v in pairs(ButcherBlips) do
        RemoveBlip(ButcherBlips[i])
    end
    for i, v in pairs(ShopBlips) do
        RemoveBlip(ShopBlips[i])
    end
    CurrentAnimals = {}
    CurrentSpawned = {}
    AnimalBlips = {}
    AnimalDicts = {}
    AnimalAnims = {}
    AnimalEating1 = {}
    AnimalFollow = {}
    AnimalPromptGroup = {}
  end)
  
-------------SELL ANIMALS
RegisterNetEvent('ricx_farmanimal:soldanimal')
AddEventHandler('ricx_farmanimal:soldanimal', function(i)
    local _i = tonumber(i)
    TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Butchery, Config.Options.Messages.AnimalSold, 'satchel_textures', CurrentAnimals[_i].texture, 3000)
    DeletePed(CurrentSpawned[_i])
    SetEntityAsNoLongerNeeded(CurrentSpawned[_i])
    --TriggerServerEvent("ricx_farmanimals:deleteped_s", PedToNet(CurrentSpawned[_i]))
    CurrentSpawned[_i] = nil
    CurrentAnimals[_i] = nil
    AnimalEating1[_i] = nil
    AnimalFollow[_i] = nil
    AnimalAnims[_i] = nil
    AnimalDicts[_i] = nil
    AnimalPromptGroup[_i] = nil
end)

RegisterNetEvent('ricx_farmanimal_sell:putInTable')
AddEventHandler('ricx_farmanimal_sell:putInTable', function()
    SellAnimalsToButchery()
end)

function SellAnimalsToButchery()
	local elements_animals = {}
        for i=1,Config.Options.MaxAnimals,1 do
            if CurrentAnimals[i] and not IsEntityDead(CurrentSpawned[i]) then
                print(CurrentAnimals[i].price)
                local a_name = tostring(CurrentAnimals[i].name)
                local aprice = tonumber(CurrentAnimals[i].price)
                local oddsanimal = tonumber(CurrentAnimals[i].sellodds)
                local sum = aprice * oddsanimal
                local _label = a_name.." - Price: $"..sum..""
                table.insert (elements_animals , {label = _label, value = CurrentAnimals[i], desc =  Config.Options.MenuTexts.SellSubText })
            end
        end

	MenuData.CloseAll()
	MenuData.Open(
			'default', GetCurrentResourceName(), 'vagohid_menu',
			{
				title    = Config.Options.MenuTexts.SellSubText,
				subtext    = '',
				align    = 'top-right',
				elements = elements_animals,
			},
			function(data, menu)
				VagoHidAnimalManage(data.current.value.pedid,data.current.value.currentid, data.current.value.model, data.current.value.name, data.current.value.preset, data.current.value.xp, data.current.value.price, data.current.value.animalid, data.current.value.sellodds, data.current.value.items)
			end,
			function(data, menu)
				menu.close()
	end)
end

local elements_o_vagohid_animals = {
	{label = Config.Options.MenuTexts.SellBtn, value = "SellAnimal" , desc =  Config.Options.MenuTexts.SellSubText },
}

function VagoHidAnimalManage(pedid,id,model,name,preset,xp,price,animalid,odds, items)
    MenuData.CloseAll()
    MenuData.Open(
        'default', GetCurrentResourceName(), 'owned_animal_menu_manage',
        {
            title    = Config.Options.MenuTexts.Butchery,
            subtext    = '',
            align    = 'top-right',
            elements =  elements_o_vagohid_animals,
        },
        function(data, menu)
            menu.close()
            local acoords = GetEntityCoords(pedid)
            local pcoords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(acoords, pcoords, true) < 10.0 then
                TriggerServerEvent('ricx_farmanimal:'..data.current.value , id, model,name,preset,xp,price,animalid,odds, items)
            else
                TriggerEvent("Notification:left_farmanimals", Config.Options.MenuTexts.Butchery, Config.Options.Messages.NoAnimal, 'menu_textures', 'stamp_locked_rank', 3000)
            end
        end,
        function(data, menu)
            SellAnimalsToButchery()
	end)
end

Citizen.CreateThread(function()
    while true do
        local t = 100
        if CurrentSpawned and #CurrentSpawned > 0 then
            for i=1,Config.Options.MaxAnimals,1 do
                if CurrentSpawned[i] then
                    if not IsEntityDead(CurrentSpawned[i]) then
                        if AnimalEating1[i] == true then
                            if not IsEntityPlayingAnim(CurrentSpawned[i], AnimalDicts[i], AnimalAnims[i], 3) then
                                RequestAnimDict(AnimalDicts[i])
                                while ( not HasAnimDictLoaded( AnimalDicts[i] ) ) do
                                        Citizen.Wait( 100 )
                                end
                                ClearPedTasks(CurrentSpawned[i])
                                TaskPlayAnim(CurrentSpawned[i], AnimalDicts[i], AnimalAnims[i], 8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
                            end
                        end
                    end
                end
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)

Citizen.CreateThread(function()
    while true do
        local t = 500
        if CurrentSpawned and #CurrentSpawned > 0 then
            local ped = PlayerPedId()
            local forwardoffset = GetOffsetFromEntityInWorldCoords(ped,0.0,8.0,0.0)
            for i=1,Config.Options.MaxAnimals,1 do
                if CurrentSpawned[i] then
                    if not IsEntityDead(CurrentSpawned[i]) then
                        if AnimalFollow[i] == true then
                            local aco = GetEntityCoords(CurrentSpawned[i])
                            if GetDistanceBetweenCoords(aco, forwardoffset,true) < 1.2 then
                                TaskStandStill(CurrentSpawned[i], -1)
                            else
                                Citizen.InvokeNative(0xD76B57B44F1E6F8B, CurrentSpawned[i], forwardoffset.x, forwardoffset.y, forwardoffset.z, 4.0, -1, 6, true, 1)
                            end
                        end
                    end
                end
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)

---RicX_Dogs Add-dog function
RegisterNetEvent('ricx_farmanimals:adddog')
AddEventHandler('ricx_farmanimals:adddog', function(dog,dogxp)
    local _dog = tonumber(dog)
    PlayerDog = _dog
    _DogXP = dogxp
end)

RegisterNetEvent('ricx_farmanimals:removedog')
AddEventHandler('ricx_farmanimals:removedog', function()
    PlayerDog = nil
    _DogXP = nil
end)

RegisterNetEvent("ricx_farmanimals:deleteped_c")
AddEventHandler("ricx_farmanimals:deleteped_c", function(_ped)
    local ped = NetToPed(_ped)
    if DoesEntityExist(ped) then
        DeletePed(ped)
        SetEntityAsNoLongerNeeded(ped)
	end
end)
-----------------------
--Notification
RegisterNetEvent('Notification:left_farmanimals')
AddEventHandler('Notification:left_farmanimals', function(t1, t2, dict, txtr, timer)
    if not HasStreamedTextureDictLoaded(dict) then
        RequestStreamedTextureDict(dict, true) 
        while not HasStreamedTextureDictLoaded(dict) do
            Wait(5)
        end
    end
    if txtr ~= nil then
        exports.ricx_farmanimals.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    else
        local txtr = "tick"
        exports.ricx_farmanimals.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    end
end)