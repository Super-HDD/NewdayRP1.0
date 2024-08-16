Config = {}
Config.Shoptext = '按~INPUT_JUMP~访问服装店' -- Text to open the clothing shop
Config.Cloakroomtext = '按~INPUT_JUMP~打开更衣室' -- Text to open the clothing shop
Config.BlipName = '城镇服装店' -- Blip Name Showed on map
Config.BlipNameCloakRoom = '衣柜' -- Blip Name Showed on map
Config.BlipSprite = 1195729388	 -- Clothing shop sprite
Config.BlipSpriteCloakRoom = 1496995379	 -- Clothing shop sprite
Config.BlipScale = 0.2 -- Blip scale
Config.OpenKey = 0xD9D0E1C0 -- Opening key hash
Config.Zones = {
    vector3(-325.5,774.57,117.45), -- 瓦伦丁
    vector3(1422.7904, -1382.1022, 81.5141), -- 罗德镇
    vector3(2550.81,-1166.28,53.68), -- SAINT DENIS
    vector3(-767.94,-1294.95,43.84), -- BLACK WATER
    vector3(-1794.89,-385.22,160.33), -- STRAWBERRY
    vector3(-3689.37,-2628.01,-13.41), -- ARMADILO
    vector3(-5490.97,-2938.28,-0.4), -- TUMBLEWEED
    vector3(1440.5111, 355.2316, 88.2709), -- 翡翠牧场
    vector3(-1657.1115, -1328.5380, 83.8100) -- 比彻之愿牧场
    
    

}

Config.Cloakroom = {
    vector3(-325.29,766.24,117.48), -- 瓦伦丁
    vector3(1437.9908, -1350.4840, 81.0824), -- 罗德镇
    vector3(-1817.11,-368.77,166.54), 
    vector3(-825.40,-1323.76,47.91), 
    vector3(1331.86,-1377.35,80.55), 
    vector3(2556.49,-1160.14,53.74),
    vector3(1440.9558, 341.7427, 88.2285), -- 翡翠牧场
    vector3(-1651.5852, -1332.0408, 83.7086) -- 比彻之愿牧场
    
    
}

Config.Label = {
    ["boot_accessories"] = "靴子配饰",
    ["pants"] = "裤子",
    ["cloaks"] = "披风",
    ["hats"] = "帽子",
    ["vests"] = "背心",
    ["chaps"] = "护腿",
    ["shirts_full"] = "衬衫",
    ["badges"] = "徽章",
    ["masks"] = "面具",
    ["spats"] = "护胫",
    ["neckwear"] = "领巾",
    ["boots"] = "靴子",
    ["accessories"] = "配饰",
    ["jewelry_rings_right"] = "右手戒指",
    ["jewelry_rings_left"]    = "左手戒指",
    ["jewelry_bracelets"] = "手镯",
    ["gauntlets"] = "臂甲",
    ["neckties"] = "领带",
    ["holsters_knife"] = "刀套",
    ["talisman_holster"] = "护身符套",
    ["loadouts"] = "搭配",
    ["suspenders"] = "吊带",
    ["talisman_satchel"] = "护身符背包",
    ["satchels"] = "背包",
    ["gunbelts"] = "枪带",
    ["belts"] = "腰带",
    ["belt_buckles"] = "腰带扣",
    ["holsters_left"] = "左手枪套",
    ["holsters_right"] = "右手枪套",
    ["talisman_wrist"] = "护身符手镯",
    ["coats"] = "外套",
    ["coats_closed"] = "合拢的外套",
    ["ponchos"] = "斗篷",
    ["eyewear"] = "眼镜",
    ["gloves"] = "手套",
    ["holsters_crossdraw"] = "交叉枪套",
    ["aprons"] = "围裙",
    ["skirts"] = "裙子",
    ["hair_accessories"] = "头饰",
    ["armor"] = "护甲",
    ["dresses"] = "连衣裙",
}

Config.Price = {
    ["boot_accessories"] = 2,
    ["pants"] = 2,
    ["cloaks"] = 2,
    ["hats"] = 2,
    ["vests"] = 2,
    ["chaps"] = 2,
    ["shirts_full"] = 2,
    ["badges"] = 2,
    ["masks"] = 2,
    ["spats"] = 2,
    ["neckwear"] = 2,
    ["boots"] = 2,
    ["accessories"] = 2,
    ["jewelry_rings_right"] = 2,
    ["jewelry_rings_left"] = 2,
    ["jewelry_bracelets"] = 2,
    ["gauntlets"] = 2,
    ["neckties"] = 2,
    ["holsters_knife"] = 2,
    ["talisman_holster"] = 2,
    ["loadouts"] = 2,
    ["suspenders"] = 2,
    ["talisman_satchel"] = 2,
    ["satchels"] = 2,
    ["gunbelts"] = 2,
    ["belts"] = 2,
    ["belt_buckles"] = 2,
    ["holsters_left"] = 2,
    ["holsters_right"] = 2,
    ["talisman_wrist"] = 2,
    ["coats"] = 2,
    ["coats_closed"] = 2,
    ["ponchos"] = 2,
    ["eyewear"] = 2,
    ["gloves"] = 2,
    ["holsters_crossdraw"] = 2,
    ["aprons"] = 2,
    ["skirts"] = 2,
    ["hair_accessories"] = 2,
    ["dresses"] = 2,  
    ["armor"] = 200,        
}

Config.MenuElements = {
    ["head"] = {
        label = "帽子",
        category = {
            "hats",
            "eyewear",
            "masks",
            "neckwear",
            "neckties",
        }
    },

    ["torso"] = {
        label = "身体",
        category = {
            "cloaks",
            "vests",
            "shirts_full",
            "holsters_knife",
            "loadouts",
            "suspenders",
            "gunbelts",
            "belts",
            "holsters_left",
            "holsters_right",
            "coats",
            "coats_closed",
            "ponchos",
            "dresses",
        }
    },

    ["legs"] = {
        label = "裤子",
        category = {
            "pants",
            "chaps",
            "skirts",
        }
    },
    ["foot"] = {
        label = "鞋子",
        category = {
            "boots",
            "spats",
            "boot_accessories",
        }
    },

    ["hands"] = {
        label = "双手",
        category = {
            "jewelry_rings_right",
            "jewelry_rings_left",
            "jewelry_bracelets",
            "gauntlets",
            "gloves",
        }
    },

    ["accessories"] = {
        label = "配件",
        category = {
            "accessories",
            "talisman_wrist",
            "talisman_holster",
            "belt_buckles",
            "satchels",
            "holsters_crossdraw",
            "aprons",
            "bows",
            "armor",
            "badges",
            "hair_accessories",
        }
    },
}