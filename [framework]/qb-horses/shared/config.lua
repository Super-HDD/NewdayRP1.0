Config = {}

-- debug
Config.Debug = false

-- horse inventory hotkey, please refer to '[framework]/qb-core/shared/keybinds.lua' for complete list of hotkeys
Config.HorseInvKey = 0x760A9C6F -- G

-- target help to use [L-ALT]
Config.TargetHelp = true

-- horse automount
Config.Automount = false

-- Always spawn on road
Config.SpawnOnRoadOnly = false

-- horse inventory
Config.HorseInvWeight = 15000
Config.HorseInvSlots = 20

-- horse inventory weight by level (horse trainer)
Config.Level1InvWeight = 2000
Config.Level1InvSlots = 50
Config.Level2InvWeight = 4000
Config.Level2InvSlots = 60
Config.Level3InvWeight = 6000
Config.Level3InvSlots = 70
Config.Level4InvWeight = 8000
Config.Level4InvSlots = 80
Config.Level5InvWeight = 9000
Config.Level5InvSlots = 90
Config.Level6InvWeight = 10000
Config.Level6InvSlots = 100
Config.Level7InvWeight = 12000
Config.Level7InvSlots = 110
Config.Level8InvWeight = 13000
Config.Level8InvSlots = 120
Config.Level9InvWeight = 14000
Config.Level9InvSlots = 130
Config.Level10InvWeight = 15000
Config.Level10InvSlots = 150

-- horse health/stamina/ability/speed/acceleration levels (horse trainer)
Config.Level1 = 200
Config.Level2 = 400
Config.Level3 = 600
Config.Level4 = 800
Config.Level5 = 1000
Config.Level6 = 1200
Config.Level7 = 1400
Config.Level8 = 1600
Config.Level9 = 1800
Config.Level10 = 2000

-- player feed horse settings
Config.FeedCarrotHealth = 10 -- amount of health increase when you feed your horse a carrot
Config.FeedCarrotStamina = 10 -- amount of stamina increase when you feed your horse a carrot
Config.FeedSugarCubeHealth = 25 -- amount of health increase when you feed your horse a sugarcube
Config.FeedSugarCubeStamina = 25 -- amount of stamina increase when you feed your horse a sugarcube

-- horse bonding settings
Config.MaxBondingLevel = 5000

-- config blips
Config.Blip = {
    blipName = '城镇马厩', -- Config.Blip.blipName
    blipSprite = 'blip_shop_horse', -- Config.Blip.blipSprite
    blipScale = 0.1 -- Config.Blip.blipScale
}

-- horse shop
Config.HorseShop = {
    [1] = { name = "horsebrush",   price = 5,    amount = 500,  info = {}, type = "item", slot = 1, },
    [2] = { name = "horselantern", price = 10,   amount = 500,  info = {}, type = "item", slot = 2, },
    [3] = { name = "horseholster", price = 5,    amount = 500,  info = {}, type = "item", slot = 3, },
    [4] = { name = "sugarcube",    price = 0.10, amount = 500,  info = {}, type = "item", slot = 4, },
    [5] = { name = "carrot",       price = 0.10, amount = 500,  info = {}, type = "item", slot = 5, },
}

-- stable zone settings
Config.StableZones = { 
    [1] = {
        zones = { -- valentine
            vector2(-351.95422363281, 765.86352539063),
            vector2(-357.52621459961, 802.44140625),
            vector2(-381.51461791992, 801.77264404297),
            vector2(-381.98571777344, 762.39996337891)
        },
        name = "valentine",
        minZ = 115.68551635742,
        maxZ = 116.26064300537
    },
    [2] = {
        zones = { -- rhodes
            vector2(1219.2058105469, -178.54296875),
            vector2(1187.3292236328, -191.03520202637),
            vector2(1165.1896972656, -212.90550231934),
            vector2(1175.7316894531, -242.43215942383),
            vector2(1235.4838867188, -223.5404510498)
        },
        name = "rhodes",
        minZ = 98.466262817383,
        maxZ = 101.29354858398
    },
    [3] = {
        zones = { -- strawberry
            vector2(-1815.6284179688, -592.89923095703),
            vector2(-1800.5074462891, -544.78729248047),
            vector2(-1818.9364013672, -540.58422851563),
            vector2(-1831.2164306641, -548.20263671875),
            vector2(-1843.1755371094, -583.43347167969)
        },
        name = "strawberry",
        minZ = 155.25595092773,
        maxZ = 157.08734130859
    },
    [4] = {
        zones = { -- blackwater
            vector2(-853.02996826172, -1355.8588867188),
            vector2(-883.69805908203, -1356.0323486328),
            vector2(-883.3671875, -1377.3862304688),
            vector2(-869.95574951172, -1381.4445800781),
            vector2(-852.90069580078, -1381.1949462891)
        },
        name = "blackwater",
        minZ = 43.35774230957,
        maxZ = 43.785705566406
    },
    [5] = {
        zones = { -- tumbleweed
            vector2(-5508.4213867188, -3056.8959960938),
            vector2(-5509.5458984375, -3034.9086914063),
            vector2(-5519.4760742188, -3012.0825195313),
            vector2(-5552.8447265625, -3028.0861816406),
            vector2(-5550.27734375, -3058.8181152344)
        },
        name = "tumbleweed",
        minZ = -2.8395669460297,
        maxZ = -1.0039472579956
    },
    [6] = {
        zones = { -- saintdenis
            vector2(2492.3596191406, -1469.1479492188),
            vector2(2520.1884765625, -1469.4697265625),
            vector2(2520.1906738281, -1432.2353515625),
            vector2(2492.8266601563, -1431.7962646484)
        },
        name = "saintdenis",
        minZ = 46.160320281982,
        maxZ = 46.294803619385
    },
    [7] = {
        zones = { -- vanhorn
            vector2(2956.6457519531, 811.98394775391),
            vector2(2953.2971191406, 752.78448486328),
            vector2(2974.1459960938, 749.93920898438),
            vector2(3000.6635742188, 768.41748046875),
            vector2(3001.1127929688, 792.94287109375),
            vector2(2986.8193359375, 809.01385498047)
        },
        name = "vanhorn",
        minZ = 49.876262664795,
        maxZ = 51.792041778564
    },
    [8] = {
        zones = { -- colter
            vector2(-1356.1180419922, 2396.6086425781),
            vector2(-1336.0328369141, 2383.5346679688),
            vector2(-1326.0085449219, 2401.4853515625),
            vector2(-1348.6867675781, 2412.9951171875)
        },
        name = "colter",
        minZ = 49.876262664795,
        maxZ = 51.792041778564
    },
}

-- tack shop npcs
Config.TackShops = {
    ["colter"] = {
        ["coords"] = vector3(-1334.2, 2397.41, 307.21),
        ["heading"] = 67.43,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["vanhorn"] = {
        ["coords"] = vector3(2968.86, 792.97, 51.4),
        ["heading"] = 128.9,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["saintdenis"] = {
        ["coords"] = vector3(2512.28, -1457.33, 46.31),
        ["heading"] = 86.43,
        ["model"] = `U_M_M_BwmStablehand_01`,
    }, 
    ["rhodes"] = {
        ["coords"] = vector3(1211.55, -190.84, 101.39),
        ["heading"] = 100.22,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["valentine"] = {
        ["coords"] = vector3(-363.14, 802.97, 116.22),
        ["heading"] = 287.9,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
     ["strawberry"] = {
        ["coords"] = vector3(-1817.1, -568.64, 155.98),
        ["heading"] = 254.85,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["blackwater"] = {
        ["coords"] = vector3(-876.85, -1365.55, 43.53),
        ["heading"] = 275.38,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["tumbleweed"] = {
        ["coords"] = vector3(-5514.81, -3040.25, -2.39),
        ["heading"] = 175.22,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    
}

Config.ModelSpawns = {
    ["colter"] = {
        ["coords"] = vector3(-1334.2, 2397.41, 307.21),
        ["heading"] = 67.43,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["vanhorn"] = {
        ["coords"] = vector3(2968.86, 792.97, 51.4),
        ["heading"] = 357.89,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["saintdenis"] = {
        ["coords"] = vector3(2512.28, -1457.33, 46.31),
        ["heading"] = 86.43,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["rhodes"] = {
        ["coords"] = vector3(1211.55, -190.84, 101.39),
        ["heading"] = 100.22,
        ["model"] = `U_M_M_BwmStablehand_01`,
    }, 
    ["valentine"] = {
        ["coords"] = vector3(-365.2, 791.94, 116.18),
        ["heading"] = 180.9,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["strawberry"] = {
        ["coords"] = vector3(-1817.1, -568.64, 155.98),
        ["heading"] = 254.85,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["blackwater"] = {
        ["coords"] = vector3(-876.85, -1365.55, 43.53),
        ["heading"] = 275.38,
        ["model"] = `U_M_M_BwmStablehand_01`,
    },
    ["tumbleweed"] = {
        ["coords"] = vector3(-5514.81, -3040.25, -2.39),
        ["heading"] = 175.22,
        ["model"] = `U_M_M_BwmStablehand_01`,
    }, 
    
}

Config.BoxZones = {
    ["colter"] = {
        [1] = {
            ["coords"] = vector3(-1342.05, 2399.79, 307.08),
            ["heading"] = 245.73,
            ["model"] = "a_c_horse_gypsycob_splashedpiebald",
            ["price"] = 650,
            ["names"] = "吉普赛马黑白色大理石",
        },
        [2] = {
            ["coords"] = vector3(-1341.15, 2401.66, 307.08),
            ["heading"] = 245.73,
            ["model"] = "a_c_horse_missourifoxtrotter_blacktovero",
            ["price"] = 2000,
            ["names"] = "密苏里狐步马黑色托维欧",
        },
        [3] = {
            ["coords"] = vector3(-1339.84, 2404.34, 307.08),
            ["heading"] = 245.73,
            ["model"] = "a_c_horse_dutchwarmblood_sealbrown",
            ["price"] = 1000,
            ["names"] = "荷兰温血马深褐色",
        },
        [4] = {
            ["coords"] = vector3(-1340.76, 2402.88, 307.08),
            ["heading"] = 245.73,
            ["model"] = "a_c_horse_dutchwarmblood_chocolateroan",
            ["price"] = 600,
            ["names"] = "荷兰温血马巧克力沙色",
        },
        [5] = {
            ["coords"] = vector3(-1343.29, 2397.1, 307.08),
            ["heading"] = 245.73,
            ["model"] = "A_C_Horse_AmericanStandardbred_Black",
            ["price"] = 2000,
            ["names"] = "美国标准种马黑色",
        },
        [6] = {
            ["coords"] = vector3(-1342.87, 2398.36, 307.08),
            ["heading"] = 245.73,
            ["model"] = "a_c_horse_missourifoxtrotter_buckskinbrindle",
            ["price"] = 1000,
            ["names"] = "密苏里狐步马鹿皮鬼面",
        },
        },
        ["vanhorn"] = {
        [1] = {
            ["coords"] = vector3(2961.36, 801.11, 51.5),
            ["heading"] = 177.97,
            ["model"] = "a_c_horse_hungarianhalfbred_piebaldtobiano",
            ["price"] = 200,
            ["names"] = "诺科他地马蓝色斑点",
        },
        [2] = {
            ["coords"] = vector3(2964.53, 801.19, 51.49),
            ["heading"] = 177.97,
            ["model"] = "a_c_horse_andalusian_darkbay",
            ["price"] = 700,
            ["names"] = "安达卢西亚马深骝色",
        },
        [3] = {
            ["coords"] = vector3(2967.34, 801.36, 51.42),
            ["heading"] = 177.97,
            ["model"] = "a_c_horse_kentuckysaddle_black",
            ["price"] = 300,
            ["names"] = "肯塔基骑乘马黑色",
        },
        [4] = {
            ["coords"] = vector3(2970.28, 801.52, 51.52),
            ["heading"] = 177.97,
            ["model"] = "a_c_horse_morgan_liverchestnut_pc",
            ["price"] = 100,
            ["names"] = "摩根马血骝色",
        },
        [5] = {
            ["coords"] = vector3(2973.12, 801.27, 51.52),
            ["heading"] = 177.97,
            ["model"] = "a_c_horse_thoroughbred_blackchestnut",
            ["price"] = 2000,
            ["names"] = "纯血马黑紫色",
        },
        [6] = {
            ["coords"] = vector3(2972.74, 792.47, 51.5),
            ["heading"] = 3.97,
            ["model"] = "a_c_horse_americanpaint_overo",
            ["price"] = 100,
            ["names"] = "美国花马欧维欧",
        },
        },
        ["saintdenis"] = {
        [1] = {
            ["coords"] = vector3(2508.99, -1452.45, 46.42),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_tennesseewalker_chestnut",
            ["price"] = 120,
            ["names"] = "田纳西走马棕色",
        },
        [2] = {
            ["coords"] = vector3(2508.98, -1449.32, 46.4),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_tennesseewalker_goldpalomino_pc",
            ["price"] = 200,
            ["names"] = "田纳西走马金色帕洛米诺",
        },
        [3] = {
            ["coords"] = vector3(2508.71, -1446.48, 46.42),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_americanstandardbred_buckskin",
            ["price"] = 1000,
            ["names"] = "美国标准种马鹿皮棕色",
        },
        [4] = {
            ["coords"] = vector3(2508.92, -1444.31, 46.43),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_shire_ravenblack",
            ["price"] = 1200,
            ["names"] = "夏尔马黑色",
        },
        [5] = {
            ["coords"] = vector3(2508.99, -1438.3, 46.44),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_tennesseewalker_redroan",
            ["price"] = 120,
            ["names"] = "田纳西走马红色鬼面",
        },
        [6] = {
            ["coords"] = vector3(2508.62, -1441.26, 46.51),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_kladruber_white",
            ["price"] = 500,
            ["names"] = "克拉德鲁博马白色",
        },
        },
        ["rhodes"] = {
        [1] = {
            ["coords"] = vector3(1204.03, -189.56, 101.48),
            ["heading"] = 281.00,
            ["model"] = "a_c_horse_morgan_flaxenchestnut",
            ["price"] = 100,
            ["names"] = "摩根马棕色",
        },
        [2] = {
            ["coords"] = vector3(1204.99, -192.58, 101.49),
            ["heading"] = 281.00,
            ["model"] = "a_c_horse_norfolkroadster_black",
            ["price"] = 600,
            ["names"] = "诺福克赛马黑色",
        },
        [3] = {
            ["coords"] = vector3(1205.33, -195.26, 101.39),
            ["heading"] = 281.00,
            ["model"] = "a_c_horse_kladruber_cremello",
            ["price"] = 450,
            ["names"] = "克拉德鲁博马象牙白色",
        },
        [4] = {
            ["coords"] = vector3(1206.23, -198.26, 101.49),
            ["heading"] = 281.00,
            ["model"] = "a_c_horse_breton_sorrel",
            ["price"] = 350,
            ["names"] = "布列塔尼马棕色斑纹",
        },
        [5] = {
            ["coords"] = vector3(1214.58, -195.64, 101.38),
            ["heading"] = 110.00,
            ["model"] = "a_c_horse_ardennes_irongreyroan",
            ["price"] = 450,
            ["names"] = "阿尔登马灰钢色",
        },
        [6] = {
            ["coords"] = vector3(1213.95, -192.89, 101.45),
            ["heading"] = 110.00,
            ["model"] = "a_c_horse_shire_lightgrey",
            ["price"] = 250,
            ["names"] = "夏尔马亮灰色",
        },
        },
        ["valentine"] = {
        
        [1] = {
            ["coords"] = vector3(-357.77, 771.73, 116.52),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_norfolkroadster_spottedtricolor",
            ["price"] = 450,
            ["names"] = "诺福克赛马花斑三色",
        },
        [2] = {
            ["coords"] = vector3(-362.45, 771.06, 116.53),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_gypsycob_splashedbay",
            ["price"] = 450,
            ["names"] = "吉普赛马斑驳骝色",
        },
        [3] = {
            ["coords"] = vector3(-368.03, 770.17, 116.53),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_kentuckysaddle_silverbay",
            ["price"] = 120,
            ["names"] = "肯塔基骑乘马银骝色",
        },
        [4] = {
            ["coords"] = vector3(-372.58, 769.81, 116.43),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_tennesseewalker_dapplebay",
            ["price"] = 150,
            ["names"] = "田纳西走马骝色斑纹",
        },
        [5] = {
            ["coords"] = vector3(-377.73, 769.48, 116.3),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_morgan_bay",
            ["price"] = 100,
            ["names"] = "摩根马浅棕色",
        },
        [6] = {
            ["coords"] = vector3(-363.47, 782.77, 116.17),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_morgan_bayroan",
            ["price"] = 100,
            ["names"] = "摩根马红纱色",
        },
        [7] = {
            ["coords"] = vector3(-366.36, 782.3, 116.15),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_hungarianhalfbred_flaxenchestnut",
            ["price"] = 600,
            ["names"] = "匈牙利混种马浅栗色",
        },
        [8] = {
            ["coords"] = vector3(-369.15, 782.53, 116.16),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_kladruber_silver",
            ["price"] = 500,
            ["names"] = "克拉德鲁博马银色",
        },
        [9] = {
            ["coords"] = vector3(-372.02, 781.94, 116.17),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_gypsycob_piebald",
            ["price"] = 700,
            ["names"] = "吉普赛马花斑",
        },
        [10] = {
            ["coords"] = vector3(-374.94, 782.11, 116.19),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_mustang_reddunovero",
            ["price"] = 250,
            ["names"] = "美洲野马棕色欧维欧",
        },
        [11] = {
            ["coords"] = vector3(-375.38, 790.93, 116.14),
            ["heading"] = 179.00,
            ["model"] = "a_c_horse_breton_steelgrey",
            ["price"] = 550,
            ["names"] = "布列塔尼马",
        },
        [12] = {
            ["coords"] = vector3(-372.33, 791.02, 116.14),
            ["heading"] = 179.00,
            ["model"] = "a_c_horse_appaloosa_fewspotted_pc",
            ["price"] = 600,
            ["names"] = "阿帕卢萨马",
        },
        [13] = {
            ["coords"] = vector3(-369.49, 791.53, 116.35),
            ["heading"] = 179.00,
            ["model"] = "a_c_horse_americanpaint_tobiano",
            ["price"] = 120,
            ["names"] = "美国花马托比亚诺斑",
        },
        },
        ["strawberry"] = {
        [1] = {
            ["coords"] = vector3(-1814.43, -558.66, 156.17),
            ["heading"] = 160.00,
            ["model"] = "a_c_horse_thoroughbred_bloodbay",
            ["price"] = 1200,
            ["names"] = "纯血马深骝色",
        },
        [2] = {
            ["coords"] = vector3(-1817.16, -558.1, 156.18),
            ["heading"] = 160.00,
            ["model"] = "a_c_horse_belgian_blondchestnut",
            ["price"] = 250,
            ["names"] = "比利时挽马棕色",
        },
        [3] = {
            ["coords"] = vector3(-1820.25, -557.28, 156.13),
            ["heading"] = 160.00,
            ["model"] = "a_c_horse_gypsycob_whiteblagdon",
            ["price"] = 650,
            ["names"] = "吉普赛马白色",
        },
        [4] = {
            ["coords"] = vector3(-1822.8, -556.54, 156.18),
            ["heading"] = 160.00,
            ["model"] = "a_c_horse_dutchwarmblood_sootybuckskin",
            ["price"] = 600,
            ["names"] = "荷兰温血马烟熏鹿皮棕色",
        },
        [5] = {
            ["coords"] = vector3(-1825.12, -564.83, 156.06),
            ["heading"] = 344.00,
            ["model"] = "a_c_horse_americanpaint_splashedwhite",
            ["price"] = 120,
            ["names"] = "美国花马黑白色",
        },
        [6] = {
            ["coords"] = vector3(-1822.42, -565.68, 156.12),
            ["heading"] = 344.00,
            ["model"] = "a_c_horse_norfolkroadster_speckledgrey",
            ["price"] = 600,
            ["names"] = "诺福克赛马斑点灰色",
        },
        },
        ["blackwater"] = {
        [1] = {
            ["coords"] = vector3(-866.46, -1370.88, 43.68),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_thoroughbred_dapplegrey",
            ["price"] = 1200,
            ["names"] = "纯血马灰色斑纹",
        },
        [2] = {
            ["coords"] = vector3(-863.67, -1370.8, 43.71),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_mustang_blackovero",
            ["price"] = 650,
            ["names"] = "美洲野马黑色欧维欧",
        },
        [3] = {
            ["coords"] = vector3(-860.54, -1371.12, 43.71),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_nokota_whiteroan",
            ["price"] = 200,
            ["names"] = "诺科他地马白灰色",
        },
        [4] = {
            ["coords"] = vector3(-859.52, -1361.72, 43.66),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_missourifoxtrotter_blueroan",
            ["price"] = 1500,
            ["names"] = "密苏里狐步马蓝沙色",
        },
        [5] = {
            ["coords"] = vector3(-863.33, -1361.55, 43.65),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_kentuckysaddle_grey",
            ["price"] = 150,
            ["names"] = "肯塔基骑乘马灰色",
        },
        [6] = {
            ["coords"] = vector3(-867.02, -1361.5, 43.66),
            ["heading"] = 90.00,
            ["model"] = "a_c_horse_tennesseewalker_blackrabicano",
            ["price"] = 130,
            ["names"] = "田纳西走马黑拉比卡诺斑",
        },
        },
        ["tumbleweed"] = {
        [1] = {
            ["coords"] = vector3(-5513.65, -3049.7, -2.39),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_mustang_wildbay",
            ["price"] = 200,
            ["names"] = "美洲野马棕色",
        },
        [2] = {
            ["coords"] = vector3(-5516.52, -3049.36, -2.39),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_mustang_goldendun",
            ["price"] = 500,
            ["names"] = "美洲野马金色虎纹",
        },
        [3] = {
            ["coords"] = vector3(-5519.14, -3049.17, -2.39),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_missourifoxtrotter_silverdapplepinto",
            ["price"] = 1000,
            ["names"] = "密苏里狐步马银色白斑纹",
        },
        [4] = {
            ["coords"] = vector3(-5522.1, -3049.14, -2.36),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_appaloosa_blanket",
            ["price"] = 150,
            ["names"] = "阿帕卢萨马棕色毯斑",
        },
        [5] = {
            ["coords"] = vector3(-5525.21, -3049.12, -2.39),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_appaloosa_brownleopard",
            ["price"] = 120,
            ["names"] = "阿帕卢萨马棕色斑点",
        },
        [6] = {
            ["coords"] = vector3(-5525.09, -3039.77, -2.32),
            ["heading"] = 180.00,
            ["model"] = "a_c_horse_americanstandardbred_palominodapple",
            ["price"] = 700,
            ["names"] = "美国标准种马帕拉米诺斑",
        },
        [7] = {
            ["coords"] = vector3(-5522.55, -3039.45, -2.18),
            ["heading"] = 180.00,
            ["model"] = "a_c_horse_missourifoxtrotter_dapplegrey",
            ["price"] = 2000,
            ["names"] = "密苏里狐步马灰白色",
        },
        [8] = {
            ["coords"] = vector3(-5519.27, -3039.19, -2.21),
            ["heading"] = 180.00,
            ["model"] = "a_c_horse_belgian_mealychestnut",
            ["price"] = 250,
            ["names"] = "比利时挽马浅灰色",
        },
        [9] = {
            ["coords"] = vector3(-5534.55, -3051.61, -1.42),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_breton_grullodun",
            ["price"] = 300,
            ["names"] = "布列塔尼马浅棕色",
        },
        [10] = {
            ["coords"] = vector3(-5538.84, -3052.61, -1.11),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_ardennes_strawberryroan",
            ["price"] = 500,
            ["names"] = "阿尔登马",
        },
        [11] = {
            ["coords"] = vector3(-5543.72, -3053.49, -0.89),
            ["heading"] = 5.00,
            ["model"] = "a_c_horse_shire_darkbay",
            ["price"] = 250,
            ["names"] = "夏尔马深骝色",
        },
    },  
}
