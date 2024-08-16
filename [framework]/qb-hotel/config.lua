Config = {}

Config.Debug = false

-- settings
Config.BillingCycle = 1 -- will remove credit every x hour/s
Config.RentPerCycle = 1 -- $ amount of rent added per cycle
Config.CreditWarning = 5 -- 5 x Config.RentPerCycle amount : warning will trigger when < : example 5 x 1 = 5 so telegram will trigger on 4 hours
Config.StartCredit = 10 -- $ amount of credit added when renting room
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.PurgeStorage = false -- purge hotel inventory when the hotel is taken back by not paying taxes (disabled by default)

-- room service
Config.MiniBar = {
    [1] = { name = "bread",       price = 50,   amount = 1,  info = {}, type = "item", slot = 1, },
    [2] = { name = "water",       price = 50,   amount = 1,  info = {}, type = "item", slot = 2, },
    [3] = { name = "beer",        price = 50,   amount = 1,  info = {}, type = "item", slot = 3, },
    [4] = { name = "coffee",      price = 50,   amount = 1,  info = {}, type = "item", slot = 4, },
    [5] = { name = "stew",        price = 50,   amount = 1,  info = {}, type = "item", slot = 5, },
    [6] = { name = "cooked_meat", price = 50,   amount = 1,  info = {}, type = "item", slot = 6, },
    [7] = { name = "cooked_fish", price = 50,   amount = 1,  info = {}, type = "item", slot = 7, },
}

-- blip settings
Config.Blip = {
    blipName = '酒店', -- Config.Blip.blipName
    blipSprite = 'blip_hotel_bed', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- prompt locations
Config.HotelLocations = {
    { -- valentine
        name = '瓦伦丁酒店', 
        prompt = 'valhotel', 
        location = 'valentine', 
        coords = vector3(-325.7658, 774.46496, 117.45713),
        showblip = true
    },
    { -- strawberry
        name = '草莓酒店', 
        prompt = 'strawberryhotel', 
        location = 'strawberry', 
        coords = vector3(-1817.56, -370.8123, 163.29635),
        showblip = true
    },
    { -- rhodes
        name = '罗德酒店', 
        prompt = 'rhodeshotel', 
        location = 'rhodes', 
        coords = vector3(1339.4562, -1377.151, 80.48069),
        showblip = true
    }, 
    { -- stdenis
        name = '圣丹尼斯酒店', 
        prompt = 'stdenishotel', 
        location = 'stdenis', 
        coords = vector3(2637.968, -1227.239, 53.380374),
        showblip = true
    },
    { -- blackwater
        name        = '黑水酒店',
        prompt      = 'blackwaterhotel',
        location    = 'blackwater',
        coords      = vector3(-815.73, -1318.86, 43.76),
        showblip    = true
    },
    { -- tumbleweed
        name        = '风滚草酒店',
        prompt      = 'tumbleweedhotel',
        location    = 'tumbleweed',
        coords      = vector3(-5511.62, -2974.64, 2.22),
        showblip    = true
    },
    { -- annesburg
        name        = '安尼斯堡酒店',
        prompt      = 'annesburghotel',
        location    = 'annesburg',
        coords      = vector3(2947.66, 1332.55, 44.46),
        showblip    = true
    },
}

Config.HotelRoom = {
    { -- valentine
        name = '瓦伦丁酒店房间', 
        prompt = 'valhotelroom', 
        location = 'valentine', 
        coords = vector3(-323.935, 767.02294, 121.6327),
    },
    { -- strawberry
        name = '草莓酒店客房', 
        prompt = 'strawberryhotelroom', 
        location = 'strawberry', 
        coords = vector3(-1813.394, -368.9348, 166.49964),
    },
    { -- rhodes
        name = '罗德岛酒店客房', 
        prompt = 'rhodeshotelroom', 
        location = 'rhodes', 
        coords = vector3(1331.4257, -1371.862, 80.490127),
    },
    { -- stdenis
        name = '圣丹尼斯酒店客房', 
        prompt = 'stdenishotelroom', 
        location = 'stdenis', 
        coords = vector3(2637.925, -1222.1, 59.600513),
    },
    { -- blackwater
        name        = '黑水酒店客房',
        prompt      = 'blackwaterhotelroom',
        location    = 'blackwater',
        coords      = vector3(-820.12, -1324.15, 47.97)
    },
    { -- tumbleweed
        name        = '风滚草酒店客房',
        prompt      = 'tumbleweedhotelroom',
        location    = 'tumbleweed',
        coords      = vector3(-5513.07, -2971.57, 2.23)
    },
    { -- annesburg
        name        = '安尼斯堡酒店客房',
        prompt      = 'annesburghotelroom',
        location    = 'annesburg',
        coords      = vector3(2946.09, 1330.59, 44.46)
    },
}

Config.HotelDoors = {
    238680582, -- valentine
    3765902977, -- valentine
    3049177115, -- valentine
    1407130373, -- strawberry
    1654175864, -- strawberry
    2046695029, -- rhodes
    1555588463, -- stdenis
    2693793043, -- stdenis
    2999855503, -- stdenis
    1275780106, -- stdenis
    3461406868, -- stdenis
    254520182, --blackwater
    2959320055, -- tumbleweed
    1335986638, -- annesburg
}
