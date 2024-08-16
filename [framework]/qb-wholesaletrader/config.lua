Config = {}

-- settings
Config.JobRequired = 'wholesaletrader'
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.StorageName = 'Wholesale_Storage' -- do not change this once active

-----------------------------------------------------------------------------------

-- wholesale blip
Config.WholesaleBlip = {
    blipName = '杂货商人聚集地', -- Config.Blip.blipName
    blipSprite = 'blip_mp_trader_introduction', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- wholesale prompt locations
Config.WholesaleLocations = {

    {   -- 梨刀村
        name = '梨刀村杂货商人营地',
        prompt = 'wholesale-1',
        job = 'wholesale1',
        coords = vector3(-1355.8246, 2416.2656, 307.4531 -0.8),
        showblip = true,
        showmarker = true
    },
    {    -- 歧路酒吧
        name = '歧路酒吧杂货商人营地',
        prompt = 'wholesale-2',
        job = 'wholesale2',
        coords = vector3(-5191.8989, -2110.4773, 12.3493 -0.8),
        showblip = true,
        showmarker = true
    }, 
    {    -- 范霍恩港
        name = '范霍恩港杂货商人营地',
        prompt = 'wholesale-3',
        job = 'wholesale3',
        coords = vector3(2986.8230, 1341.2081, 43.9898 -0.8),
        showblip = true,
        showmarker = true
    }, 
    
}

Config.WholesaleShop = {
    [1] = {
        name = 'beer_hua',
        price = 0.5,
        amount = 60,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'putao',
        price = 0.5,
        amount = 60,
        info = {},
        type = 'item',
        slot = 2,
    },
    [3] = {
        name = 'xiaomai',
        price = 0.5,
        amount = 60,
        info = {},
        type = 'item',
        slot = 3,
    },
    [4] = {
        name = 'raw_meat',
        price = 1,
        amount = 60,
        info = {},
        type = 'item',
        slot = 4,
    },
    [6] = {
        name = 'corn',
        price = 0.5,
        amount = 40,
        info = {},
        type = 'item',
        slot = 6,
    },
    [7] = {
        name = 'shengcai',
        price = 0.5,
        amount = 40,
        info = {},
        type = 'item',
        slot = 7,
    },
    [8] = {
        name = 'jungu',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 8,
    },
    [9] = {
        name = 'naiyou',
        price = 1,
        amount = 20,
        info = {},
        type = 'item',
        slot = 9,
    },
    [10] = {
        name = 'potato',
        price = 0.5,
        amount = 40,
        info = {},
        type = 'item',
        slot = 10,
    },
    [11] = {
        name = 'kafeifen',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 11,
    },
    [12] = {
        name = 'shengniunai',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 12,
    },
    [13] = {
        name = 'midiexiang',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 13,
    },
    [14] = {
        name = 'bailixiang',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 14,
    },
    [15] = {
        name = 'muli',
        price = 1,
        amount = 20,
        info = {},
        type = 'item',
        slot = 15,
    },
    [16] = {
        name = 'lingmeng',
        price = 0.5,
        amount = 20,
        info = {},
        type = 'item',
        slot = 16,
    },
}

-----------------------------------------------------------------------------------
