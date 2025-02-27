local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false
local PlayerData = {}
BucketId = GetRandomIntInRange(0, 0xffffff)
ComponentsMale = {}
ComponentsFemale = {}
LoadedComponents = {}
CreatorCache = {}
local SpawnedPeds = {}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    PlayerData = {}
end)

MenuData = {}

TriggerEvent("qb-menubase:getData", function(call)
    MenuData = call
end)

local MainMenus = {
    ["body"] = function()
        OpenBodyMenu()
    end,
    ["face"] = function()
        OpenFaceMenu()
    end,
    ["hair"] = function()
        OpenHairMenu()
    end,
    ["makeup"] = function()
        OpenMakeupMenu()
    end,
    ["save"] = function()
        TriggerServerEvent("qb-appearance:SetPlayerBucket" , 0)
        EndCharacterCreatorCam()
        MenuData.CloseAll()
        LoadedComponents = CreatorCache
        TriggerServerEvent("qb-appearance:SaveSkin", CreatorCache)
    end
}

local BodyFunctions = {
    ["head"] = function(target, data)
        LoadHead(target, data)
        LoadOverlays(target, data)
    end,
    ["face_width"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["skin_tone"] = function(target, data)
        LoadBoody(target, data)
        LoadOverlays(target, data)
    end,
    ["body_size"] = function(target, data)
        LoadBodySize(target, data)
        LoadBoody(target, data)
    end,
    ["body_waist"] = function(target, data)
        LoadBodyWaist(target, data)
    end,
    ["chest_size"] = function(target, data)
        LoadBodyChest(target, data)
    end,
    ["height"] = function(target, data)
        LoadHeight(target, data)
    end
}

local FaceFunctions = {
    ["eyes"] = function()
        OpenEyesMenu()
    end,
    ["eyelids"] = function()
        OpenEyelidsMenu()
    end,
    ["eyebrows"] = function()
        OpenEyebrowsMenu()
    end,
    ["nose"] = function()
        OpenNoseMenu()
    end,
    ["mouth"] = function()
        OpenMouthMenu()
    end,
    ["cheekbones"] = function()
        OpenCheekbonesMenu()
    end,
    ["jaw"] = function()
        OpenJawMenu()
    end,
    ["ears"] = function()
        OpenEarsMenu()
    end,
    ["chin"] = function()
        OpenChinMenu()
    end,
    ["defects"] = function()
        OpenDefectsMenu()
    end
}

local HairFunctions = {
    ["hair"] = function(target, data)
        LoadHair(target, data)
    end,
    ["beard"] = function(target, data)
        LoadBeard(target, data)
    end
}

local EyesFunctions = {
    ["eyes_color"] = function(target, data)
        LoadEyes(target, data)
    end,
    ["eyes_depth"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyes_angle"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyes_distance"] = function(target, data)
        LoadFeatures(target, data)
    end
}

local EyelidsFunctions = {
    ["eyelid_height"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyelid_width"] = function(target, data)
        LoadFeatures(target, data)
    end
}

local EyebrowsFunctions = {
    ["eyebrows_t"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_op"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_id"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrows_c1"] = function(target, data)
        LoadOverlays(target, data)
    end,
    ["eyebrow_height"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyebrow_width"] = function(target, data)
        LoadFeatures(target, data)
    end,
    ["eyebrow_depth"] = function(target, data)
        LoadFeatures(target, data)
    end
}

CreateThread(function()
    for i, v in pairs(cloth_hash_names) do
        if v.category_hashname == "BODIES_LOWER" or v.category_hashname == "BODIES_UPPER" or v.category_hashname ==
            "heads" or v.category_hashname == "hair" or v.category_hashname == "teeth" or v.category_hashname == "eyes" then
            if v.ped_type == "female" and v.is_multiplayer and v.hashname ~= "" then
                if ComponentsFemale[v.category_hashname] == nil then
                    ComponentsFemale[v.category_hashname] = {}
                end
                table.insert(ComponentsFemale[v.category_hashname], v.hash)
            elseif v.ped_type == "male" and v.is_multiplayer and v.hashname ~= "" then
                if ComponentsMale[v.category_hashname] == nil then
                    ComponentsMale[v.category_hashname] = {}
                end
                table.insert(ComponentsMale[v.category_hashname], v.hash)
            end
        end
    end
    if not IsImapActive(183712523) then
        RequestImap(183712523) -- CharacterCreator
    end
    if not IsImapActive(-1699673416) then
        RequestImap(-1699673416) -- CharacterCreator
    end
    if not IsImapActive(1679934574) then
        RequestImap(1679934574) -- CharacterCreator
    end
end)

RegisterNetEvent('qb-appearance:ApplySkin')
AddEventHandler('qb-appearance:ApplySkin', function(SkinData, Target, ClothesData)
    local savedhealth = QBCore.Functions.GetPlayerData().metadata["health"] or 600
    CreateThread(function()
        local _Target = Target or PlayerPedId()
        local _SkinData = SkinData
        if _Target == PlayerPedId() then
            local model = GetPedModel(tonumber(_SkinData.sex))
            LoadModel(PlayerPedId(), model)
            _Target = PlayerPedId()
            SetEntityAlpha(_Target, 0)
            LoadedComponents = _SkinData
        end
        FixIssues(_Target, _SkinData)
        LoadHeight(_Target, _SkinData)
        LoadBoody(_Target, _SkinData)
        LoadHead(_Target, _SkinData)
        LoadHair(_Target, _SkinData)
        LoadBeard(_Target, _SkinData)
        LoadEyes(_Target, _SkinData)
        LoadFeatures(_Target, _SkinData)
        LoadBodySize(_Target, _SkinData)
        LoadBodyWaist(_Target, _SkinData)
        LoadBodyChest(_Target, _SkinData)
        LoadOverlays(_Target, _SkinData)
        SetEntityAlpha(_Target, 255)
        if _Target == PlayerPedId() then
            TriggerServerEvent("qb-clothes:LoadClothes", 1)
        else
            TriggerEvent("qb-clothes:ApplyClothes", ClothesData, _Target)
            for i, m in pairs(overlay_all_layers) do
                overlay_all_layers[i] =
                {name = m.name, visibility = 0, tx_id = 1, tx_normal = 0, tx_material = 0, tx_color_type = 0, tx_opacity = 1.0, tx_unk = 0, palette = 0, palette_color_primary = 0, palette_color_secondary = 0, palette_color_tertiary = 0, var = 0, opacity = 0.0}
            end
        end
        SetEntityHealth(PlayerPedId(), savedhealth, 0)
    end)
end)

RegisterNetEvent('qb-appearance:OpenCreator')
AddEventHandler('qb-appearance:OpenCreator', function()
    StartCreator()
end)

RegisterNetEvent('qb-appearance:LoadSkinClient')
AddEventHandler('qb-appearance:LoadSkinClient', function()
    if isLoggedIn then
        local isJailed = 0

        QBCore.Functions.GetPlayerData(function(player)
            isJailed = player.metadata["injail"]
        end)

        if isJailed > 0 then return end

        TriggerServerEvent("qb-appearance:LoadSkin")
    end
end)

RegisterCommand('loadskin', function(source, args, raw)
    if isLoggedIn then
        local ped = PlayerPedId()
        local isdead = IsEntityDead(ped)
        local cuffed = IsPedCuffed(ped)
        local hogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, ped)
        local lassoed = Citizen.InvokeNative(0x9682F850056C9ADE, ped)
        local dragged = Citizen.InvokeNative(0xEF3A8772F085B4AA, ped)
        local ragdoll = IsPedRagdoll(ped)
        local falling = IsPedFalling(ped)
        local isJailed = 0

        QBCore.Functions.GetPlayerData(function(player)
            isJailed = player.metadata["injail"]
        end)

        if isdead or cuffed or hogtied or lassoed or dragged or ragdoll or falling or isJailed > 0 then return end

        TriggerServerEvent("qb-appearance:LoadSkin")
    end
end)

RegisterCommand('creator', function(source, args, raw)
    StartCreator()
end)

function StartCreator()
    TriggerServerEvent("qb-appearance:SetPlayerBucket" , BucketId)
    Wait(1)
    for i, m in pairs(overlay_all_layers) do
        overlay_all_layers[i] =
        {name = m.name, visibility = 0, tx_id = 1, tx_normal = 0, tx_material = 0, tx_color_type = 0, tx_opacity = 1.0, tx_unk = 0, palette = 0, palette_color_primary = 0, palette_color_secondary = 0, palette_color_tertiary = 0, var = 0, opacity = 0.0}
    end
    MenuData.CloseAll()
    SpawnedPeds = SpawnPeds()
    local selectedSex = StartSelectCam()
    CreatorCache["sex"] = selectedSex
    local model = GetPedModel(selectedSex)
    LoadModel(PlayerPedId(), model)
    FixIssues(PlayerPedId())
    SetEntityVisible(PlayerPedId(), true)
    DeletePeds(SpawnedPeds)
    MainMenu()
end

function MainMenu(Target)
    MenuData.CloseAll()
    local _Target = Target or PlayerPedId()
    local elements = {
        {label = QB.Texts.Body,       value = 'body',   desc = ""},
        {label = QB.Texts.Face,       value = 'face',   desc = ""},
        {label = QB.Texts.Hair_beard, value = 'hair',   desc = ""},
        {label = QB.Texts.Makeup,     value = 'makeup', desc = ""},
        {label = QB.Texts.save,       value = 'save',   desc = ""}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'main_character_creator_menu',
        {title = QB.Texts.Appearance, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
        MainMenus[data.current.value]() end, function(data, menu)
    end)
end

function OpenBodyMenu()
    MenuData.CloseAll()
    local BodySizeOptions = {QB.Texts.Slim, QB.Texts.Sporty, QB.Texts.Medium, QB.Texts.Fat,QB.Texts.Strong}
    local BodyWaistOptions = {}
    local BodyChestOptions = {}
    for i, v in ipairs(WAIST_TYPES) do
        table.insert(BodyWaistOptions, "+ " .. (i / 2) .. " kg")
    end
    for i, v in ipairs(CHEST_TYPE) do
        table.insert(BodyChestOptions, i)
    end
    local SkinToneOptions = {QB.Texts.Color1,QB.Texts.Color2,QB.Texts.Color3,QB.Texts.Color4,QB.Texts.Color5,QB.Texts.Color6}
    local elements = {
        {label = QB.Texts.Face,     value = CreatorCache["head"] or 1,       category = "head",       desc = "", type = "slider", min = 1, max = 120},
        {label = QB.Texts.Width,    value = CreatorCache["face_width"] or 0, category = "face_width", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.SkinTone, value = CreatorCache["skin_tone"] or 1,  category = "skin_tone",  desc = "", type = "slider", min = 1, max = 6,      options = SkinToneOptions},
        {label = QB.Texts.Size,     value = CreatorCache["body_size"] or 3,  category = "body_size",  desc = "", type = "slider", min = 1, max = 5,      options = BodySizeOptions},
        {label = QB.Texts.Waist,    value = CreatorCache["body_waist"] or 7, category = "body_waist", desc = "", type = "slider", min = 1, max = 21,     options = BodyWaistOptions},
        {label = QB.Texts.Chest, value = CreatorCache["chest_size"] or 1, category = "chest_size", desc = "", type = "slider", min = 1, max = 11, options = BodyChestOptions},
        {label = QB.Texts.Height,   value = CreatorCache["height"] or 100,      category = "height",      desc = "", type = "slider", min = 70, max = 115}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'body_character_creator_menu',
        {title = QB.Texts.Appearance, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        MainMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            BodyFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenFaceMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Eyes,       value = 'eyes',       desc = ""},
        {label = QB.Texts.Eyelids,    value = 'eyelids',    desc = ""},
        {label = QB.Texts.Eyebrows,   value = 'eyebrows',   desc = ""},
        {label = QB.Texts.Nose,       value = 'nose',       desc = ""},
        {label = QB.Texts.Mouth,      value = 'mouth',      desc = ""},
        {label = QB.Texts.Cheekbones, value = 'cheekbones', desc = ""},
        {label = QB.Texts.Jaw,        value = 'jaw',        desc = ""},
        {label = QB.Texts.Ears,       value = 'ears',       desc = ""},
        {label = QB.Texts.Chin,       value = 'chin',       desc = ""},
        {label = QB.Texts.Defects,    value = 'defects',    desc = ""}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'face_main_character_creator_menu',
        {title = QB.Texts.Face, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
        FaceFunctions[data.current.value]()
    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end)
end

function OpenHairMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {}
    if IsPedMale(PlayerPedId()) then
        local a = 1
        if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
            CreatorCache["hair"] = {}
            CreatorCache["hair"].model = 0
            CreatorCache["hair"].texture = 1
        end
        if CreatorCache["beard"] == nil or type(CreatorCache["beard"]) ~= "table" then
            CreatorCache["beard"] = {}
            CreatorCache["beard"].model = 0
            CreatorCache["beard"].texture = 1
            
        end
        local options = {}
        -- male hair selection
        local category = hairs_list["male"]["hair"]
        for k, v in pairs(category) do
            table.insert(options, k)
        end
        table.insert(elements, {label = QB.Texts.HairStyle, value = CreatorCache["hair"].model or 0, category = "hair", desc = "", type = "slider", min = 0, max = #category, change_type = "model", id = a, options = options})
        a = a + 1
        options = {}
        for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
            table.insert(options, i)
        end
        table.insert(elements, {label = QB.Texts.HairColor, value = CreatorCache["hair"].texture or 1, category = "hair", desc = "", type = "slider", min = 1, max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), change_type = "texture", id = a, options = options})
        options = {}
        a = a + 1
        -- male beard selection
        local category = hairs_list["male"]["beard"]
        for k, v in pairs(category) do
            table.insert(options, k)
        end
        table.insert(elements, { label = QB.Texts.BeardStyle, value = CreatorCache["beard"].model or 0, category = "beard", desc = "", type = "slider", min = 0, max = #category, change_type = "model", id = a, options = options})
        a = a + 1
        options = {}
        for i = 1, GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1), 1 do
            table.insert(options, i)
        end
        table.insert(elements, {label = QB.Texts.BeardColor, value = CreatorCache["beard"].texture or 1, category = "beard", desc = "", type = "slider", min = 1, max = GetMaxTexturesForModel("beard", CreatorCache["beard"].model or 1), change_type = "texture", id = a, options = options})
        options = {}
        a = a + 1
    else
        local a = 1
        if CreatorCache["hair"] == nil or type(CreatorCache["hair"]) ~= "table" then
            CreatorCache["hair"] = {}
            CreatorCache["hair"].model = 0
            CreatorCache["hair"].texture = 1
        end
        local options = {}
        -- female hair options
        local category = hairs_list["female"]["hair"]
        for k, v in pairs(category) do
            table.insert(options, k)
        end
        table.insert(elements,
            {label = QB.Texts.Hair, value = CreatorCache["hair"].model or 0, category = "hair", desc = "", type = "slider", min = 0, max = #category, change_type = "model", id = a, options = options}
        )
        a = a + 1
        options = {}
        for i = 1, GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), 1 do
            table.insert(options, i)
        end
        table.insert(elements,
            {label = QB.Texts.Hair, value = CreatorCache["hair"].texture or 1, category = "hair", desc = "", type = "slider", min = 1, max = GetMaxTexturesForModel("hair", CreatorCache["hair"].model or 1), change_type = "texture", id = a, options = options}
        )
        options = {}
        a = a + 1
    end
    MenuData.Open('default', GetCurrentResourceName(), 'hair_main_character_creator_menu',
        {title = QB.Texts.Hair_beard, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end, function(data, menu)
        if data.current.change_type == "model" then
            if CreatorCache[data.current.category].model ~= data.current.value then
                CreatorCache[data.current.category].texture = 1
                CreatorCache[data.current.category].model = data.current.value
                if data.current.value > 0 then
                    local options = {}
                    if GetMaxTexturesForModel(data.current.category, data.current.value) > 1 then
                        for i = 1, GetMaxTexturesForModel(data.current.category, data.current.value), 1 do
                            table.insert(options, i)
                        end
                    else
                        table.insert(options, "Brak")
                    end
                    menu.setElement(data.current.id + 1, "options", options)
                    menu.setElement(data.current.id + 1, "max", GetMaxTexturesForModel(data.current.category, data.current.value))
                    menu.setElement(data.current.id + 1, "min", 1)
                    menu.setElement(data.current.id + 1, "value", 1)
                    menu.refresh()
                else
                    menu.setElement(data.current.id + 1, "max", 0)
                    menu.setElement(data.current.id + 1, "min", 0)
                    menu.setElement(data.current.id + 1, "value", 0)
                    menu.refresh()
                end
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
         elseif data.current.change_type == "texture" then
            if CreatorCache[data.current.category].texture ~= data.current.value then
                CreatorCache[data.current.category].texture = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        else
            if CreatorCache[data.current.category] ~= data.current.value then
                CreatorCache[data.current.category] = data.current.value
                HairFunctions[data.current.category](PlayerPedId(), CreatorCache)
            end
        end
    end)
end

function OpenEyesMenu()
    MenuData.CloseAll()
    local EyesColorOptions = {QB.Texts.EyesTone1,QB.Texts.EyesTone2,QB.Texts.EyesTone3,QB.Texts.EyesTone4,QB.Texts.EyesTone5,QB.Texts.EyesTone5}                      
    local elements = {
        {label = QB.Texts.Color,    value = CreatorCache["eyes_color"] or 1,    category = "eyes_color",    desc = "", type = "slider", min = 1,max = 18},
        {label = QB.Texts.Depth,    value = CreatorCache["eyes_depth"] or 0,    category = "eyes_depth",    desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Angle,    value = CreatorCache["eyes_angle"] or 0,    category = "eyes_angle",    desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Distance, value = CreatorCache["eyes_distance"] or 0, category = "eyes_distance", desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'eyes_character_creator_menu', 
    {title = QB.Texts.Eyes, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyesFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEyelidsMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Height, value = CreatorCache["eyelid_height"] or 0, category = "eyelid_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Width,  value = CreatorCache["eyelid_width"] or 0,  category = "eyelid_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'eyelid_character_creator_menu',
        {title = QB.Texts.Eyelids, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyelidsFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEyebrowsMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Height,         value = CreatorCache["eyebrow_height"] or 0, category = "eyebrow_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Width,          value = CreatorCache["eyebrow_width"] or 0,  category = "eyebrow_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Depth,          value = CreatorCache["eyebrow_depth"] or 0,  category = "eyebrow_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Type,           value = CreatorCache["eyebrows_t"] or 1,     category = "eyebrows_t",     desc = "", type = "slider", min = 1, max = 15},
        {label = QB.Texts.Visibility,     value = CreatorCache["eyebrows_op"] or 100,  category = "eyebrows_op",    desc = "", type = "slider", min = 0, max = 100,    hop = 5},
        {label = QB.Texts.ColorPalette,   value = CreatorCache["eyebrows_id"] or 10,   category = "eyebrows_id",    desc = "", type = "slider", min = 1, max = 25},
        {label = QB.Texts.ColorFirstrate, value = CreatorCache["eyebrows_c1"] or 0,    category = "eyebrows_c1",    desc = "", type = "slider", min = 0, max = 64}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'eyebrows_character_creator_menu',
        {title = QB.Texts.Eyebrows, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            EyebrowsFunctions[data.current.category](PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenNoseMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Width,         value = CreatorCache["nose_width"] or 0,        category = "nose_width",        desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Size,          value = CreatorCache["nose_size"] or 0,         category = "nose_size",         desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Height,        value = CreatorCache["nose_height"] or 0,       category = "nose_height",       desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Angle,         value = CreatorCache["nose_angle"] or 0,        category = "nose_angle",        desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.NoseCurvature, value = CreatorCache["nose_curvature"] or 0,    category = "nose_curvature",    desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Distance,      value = CreatorCache["nostrils_distance"] or 0, category = "nostrils_distance", desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'nose_character_creator_menu',
        {title = QB.Texts.Nose, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenMouthMenu()
    MenuData.CloseAll()

    RequestAnimDict("FACE_HUMAN@GEN_MALE@BASE")

    while not HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE") do
        Wait(100)
    end

    TaskPlayAnim(PlayerPedId(), "FACE_HUMAN@GEN_MALE@BASE", "Face_Dentistry_Loop", 1090519040, -4, -1, 17, 0, 0, 0, 0, 0, 0)

    local elements = {
        {label = QB.Texts.Teeth,          value = CreatorCache["teeth"] or 1,      category = "teeth",      desc = "", type = "slider", min = 1, max = 7},
        {label = QB.Texts.Width,          value = CreatorCache["mouth_width"] or 0,      category = "mouth_width",      desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Depth,          value = CreatorCache["mouth_depth"] or 0,      category = "mouth_depth",      desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.UP_DOWN,        value = CreatorCache["mouth_x_pos"] or 0,      category = "mouth_x_pos",      desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.left_right,     value = CreatorCache["mouth_y_pos"] or 0,      category = "mouth_y_pos",      desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.UpperLipHeight, value = CreatorCache["upper_lip_height"] or 0, category = "upper_lip_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.UpperLipWidth,  value = CreatorCache["upper_lip_width"] or 0,  category = "upper_lip_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.UpperLipDepth,  value = CreatorCache["upper_lip_depth"] or 0,  category = "upper_lip_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.LowerLipHeight, value = CreatorCache["lower_lip_height"] or 0, category = "lower_lip_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.LowerLipWidth,  value = CreatorCache["lower_lip_width"] or 0,  category = "lower_lip_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.LowerLipDepth,  value = CreatorCache["lower_lip_depth"] or 0,  category = "lower_lip_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'mouth_character_creator_menu',
        {title = QB.Texts.Mouth, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        ClearPedTasks(PlayerPedId())
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenCheekbonesMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Height, value = CreatorCache["cheekbones_height"] or 0, category = "cheekbones_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Width,  value = CreatorCache["cheekbones_width"] or 0,  category = "cheekbones_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Depth,  value = CreatorCache["cheekbones_depth"] or 0,  category = "cheekbones_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'cheekbones_character_creator_menu',
        {title = 'Cheek Bones', subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenJawMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Height, value = CreatorCache["jaw_height"] or 0, category = "jaw_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Width,  value = CreatorCache["jaw_width"] or 0,  category = "jaw_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Depth,  value = CreatorCache["jaw_depth"] or 0,  category = "jaw_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'jaw_character_creator_menu',
        {title = QB.Texts.Jaw, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenEarsMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Width,  value = CreatorCache["ears_width"] or 0,   category = "ears_width",   desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Angle,  value = CreatorCache["ears_angle"] or 0,   category = "ears_angle",   desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Height, value = CreatorCache["ears_height"] or 0,  category = "ears_height",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Size,   value = CreatorCache["earlobe_size"] or 0, category = "earlobe_size", desc = "", type = "slider", min = -100, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'ears_character_creator_menu',
        {title = QB.Texts.Ears, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenChinMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Size, value = CreatorCache["chin_height"] or 0, category = "chin_height", desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Size, value = CreatorCache["chin_width"] or 0,  category = "chin_width",  desc = "", type = "slider", min = -100, max = 100, hop = 5},
        {label = QB.Texts.Size, value = CreatorCache["chin_depth"] or 0,  category = "chin_depth",  desc = "", type = "slider", min = -100, max = 100, hop = 5}}
    MenuData.Open('default', GetCurrentResourceName(), 'chin_character_creator_menu',
        {title = QB.Texts.Chin, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadFeatures(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenDefectsMenu()
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Scars,    value = CreatorCache["scars_t"] or 1,     category = "scars_t",     desc = "", type = "slider", min = 1, max = 16,  options = nil},
        {label = QB.Texts.Clarity,  value = CreatorCache["scars_op"] or 0,    category = "scars_op",    desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.Older,    value = CreatorCache["ageing_t"] or 1,    category = "ageing_t",    desc = "", type = "slider", min = 1, max = 24,  options = nil},
        {label = QB.Texts.Clarity,  value = CreatorCache["ageing_op"] or 0,   category = "ageing_op",   desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.Freckles, value = CreatorCache["freckles_t"] or 1,  category = "freckles_t",  desc = "", type = "slider", min = 1, max = 15,  options = nil},
        {label = QB.Texts.Clarity,  value = CreatorCache["freckles_op"] or 0, category = "freckles_op", desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.Moles,    value = CreatorCache["moles_t"] or 1,     category = "moles_t",     desc = "", type = "slider", min = 1, max = 16,  options = nil},
        {label = QB.Texts.Clarity,  value = CreatorCache["moles_op"] or 0,    category = "moles_op",    desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.Spots,    value = CreatorCache["spots_t"] or 1,     category = "spots_t",     desc = "", type = "slider", min = 1, max = 16,  options = nil},
        {label = QB.Texts.Clarity,  value = CreatorCache["spots_op"] or 0,    category = "spots_op",    desc = "", type = "slider", min = 0, max = 100, hop = 5}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'defects_character_creator_menu',
        {title = QB.Texts.Disadvantages, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        OpenFaceMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadOverlays(PlayerPedId(), CreatorCache)
        end
    end)
end

function OpenMakeupMenu()
    MoveCharacterCreatorCamera(-558.97, -3780.95, 239.18)
    MenuData.CloseAll()
    local elements = {
        {label = QB.Texts.Shadow,           value = CreatorCache["shadows_t"] or 1,    category = "shadows_t",    desc = "", type = "slider", min = 1, max = 5},
        {label = QB.Texts.Clarity,          value = CreatorCache["shadows_op"] or 0,   category = "shadows_op",   desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.ColorShadow,      value = CreatorCache["shadows_id"] or 1,   category = "shadows_id",   desc = "", type = "slider", min = 1, max = 25},
        {label = QB.Texts.ColorFirst_Class, value = CreatorCache["shadows_c1"] or 0,   category = "shadows_c1",   desc = "", type = "slider", min = 0, max = 64},
        {label = QB.Texts.Blushing_Cheek,   value = CreatorCache["blush_t"] or 1,      category = "blush_t",      desc = "", type = "slider", min = 1, max = 4},
        {label = QB.Texts.Clarity,          value = CreatorCache["blush_op"] or 0,     category = "blush_op",     desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.blush_id,         value = CreatorCache["blush_id"] or 1,     category = "blush_id",     desc = "", type = "slider", min = 1, max = 25},
        {label = QB.Texts.blush_c1,         value = CreatorCache["blush_c1"] or 0,     category = "blush_c1",     desc = "", type = "slider", min = 0, max = 64},
        {label = QB.Texts.Lipstick,         value = CreatorCache["lipsticks_t"] or 1,  category = "lipsticks_t",  desc = "", type = "slider", min = 1, max = 7},
        {label = QB.Texts.Clarity,          value = CreatorCache["lipsticks_op"] or 0, category = "lipsticks_op", desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.ColorLipstick,    value = CreatorCache["lipsticks_id"] or 1, category = "lipsticks_id", desc = "", type = "slider", min = 1, max = 25},
        {label = QB.Texts.lipsticks_c1,     value = CreatorCache["lipsticks_c1"] or 0, category = "lipsticks_c1", desc = "", type = "slider", min = 0, max = 64},
        {label = QB.Texts.lipsticks_c2,     value = CreatorCache["lipsticks_c2"] or 0, category = "lipsticks_c2", desc = "", type = "slider", min = 0, max = 64},
        {label = QB.Texts.Eyeliners,        value = CreatorCache["eyeliners_t"] or 1,  category = "eyeliners_t",  desc = "", type = "slider", min = 1, max = 15},
        {label = QB.Texts.Clarity,          value = CreatorCache["eyeliners_op"] or 0, category = "eyeliners_op", desc = "", type = "slider", min = 0, max = 100, hop = 5},
        {label = QB.Texts.eyeliners_id,     value = CreatorCache["eyeliners_id"] or 1, category = "eyeliners_id", desc = "", type = "slider", min = 1, max = 25},
        {label = QB.Texts.eyeliners_c1,     value = CreatorCache["eyeliners_c1"] or 0, category = "eyeliners_c1", desc = "", type = "slider", min = 0, max = 64}
    }
    MenuData.Open('default', GetCurrentResourceName(), 'makeup_character_creator_menu',
        {title = QB.Texts.Make_up, subtext = QB.Texts.Options, align = QB.Texts.align, elements = elements}, function(data, menu)
    end, function(data, menu)
        MoveCharacterCreatorCamera(-560.133, -3780.92, 238.6)
        MainMenu()
    end, function(data, menu)
        if CreatorCache[data.current.category] ~= data.current.value then
            CreatorCache[data.current.category] = data.current.value
            LoadOverlays(PlayerPedId(), CreatorCache)
        end
    end)
end

exports('GetComponentId', function(name)
    return LoadedComponents[name]
end)

exports('GetBodyComponents', function()
    return {ComponentsMale, ComponentsFemale}
end)

exports('GetBodyCurrentComponentHash', function(name)
    local hash
    if name == "hair" or name == "beard" then
        local info = LoadedComponents[name]

        if not info then return end

        local texture = info.texture
        local model = info.model
        if model == 0 or texture == 0 then
            return
        end
        if type(info) == "table" then
            if IsPedMale(PlayerPedId()) then
                if hairs_list["male"][name][model][texture] ~= nil then
                    hash = hairs_list["male"][name][model][texture].hash
                end
            else
                if hairs_list["female"][name][model][texture] ~= nil then
                    hash = hairs_list["female"][name][model][texture].hash
                end
            end
        end
    else
        local id = LoadedComponents[name]
        if not id then
            return
        end
        if IsPedMale(PlayerPedId()) then
            if ComponentsMale[name] ~= nil then
                hash = ComponentsMale[name][id]
            end
        else
            if ComponentsFemale[name] ~= nil then
                hash = ComponentsFemale[name][id]
            end
        end
    end
    return hash
end)

exports('SetFaceOverlays', function(target, data)
    LoadOverlays(target, data)
end)

exports('SetHair', function(target, data)
    LoadHair(target, data)
end)

exports('SetBeard', function(target, data)
    LoadBeard(target, data)
end)

exports('GetComponentsMax', function(name)
    if name == "hair" or name == "beard" then
        if IsPedMale(PlayerPedId()) then
            if hairs_list["male"][name] ~= nil then
                return #hairs_list["male"][name]
            end
        else
            if hairs_list["female"][name] ~= nil then
                return #hairs_list["female"][name]
            end
        end
    else
        if IsPedMale(PlayerPedId()) then
            if ComponentsMale[name] ~= nil then
                return #ComponentsMale[name]
            end
        else
            if ComponentsFemale[name] ~= nil then
                return #ComponentsFemale[name]
            end
        end
    end
end)

exports('GetMaxTexturesForModel', function(category , model)
    return GetMaxTexturesForModel(category,model)
end)
