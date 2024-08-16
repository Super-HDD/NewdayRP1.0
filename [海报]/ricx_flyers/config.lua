Config {}
-- 配置游戏模式，可选项为"redemrp"、"vorp"、"qbr"、"qbr2"、"redemrp-reboot"或"rsg"
Config.framework = "rsg"

-- 删除传单时使用的物品名称
Config.FlyerRemoveItem = "flyer_remover"

-- 是否在删除传单时移除Config.FlyerRemoveItem物品
Config.RemoveRemover = true

-- 删除传单工作的职业，使用"Config.RemoverJob = false"表示不需职业
Config.RemoverJob = {"lbzf"}

-- 在删除传单时是否还给删除者一个传单
Config.AddFlyerAtRemove = true

-- 增加传单时允许的职业，使用"Config.AddFlyerJob = false"表示不需职业
Config.AddFlyerJob = {"artist", "cleaner"}

-- 传单可视范围
Config.ViewDistance = 50.0

-- 是否需要按键才能查看传单内容
Config.FlyerViewWithKey = false  --填写按键的哈希值，而非自动打开传单代码  翻译

Config.Prompts = {
    Prompt1 = 0x05CA7C52,
    PromptClose = 0x05CA7C52,
    PromptRemove = 0x05CA7C52,
}

Config.Texts = {
    Prompt1 = "添加传单",
    PromptClose = "关闭",
    PromptRemove = "移除",
    --文本
    Flyer = "传单",
    PlaceFlyer = "放置传单",
    SelectFlyer = "选择传单",
    OwnedF = "拥有的传单",
    NoRemover = "你没有传单移除器",
    NothingtoAdd = "你没有可以添加的物品！",
    NoJob = "你没有所需的工作！",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.Flyers = {
    --Saint Denis
    flyer1 = {id = "flyer1", name = "Flyer 1", coords = vector3(2572.415, -796.766, 41.338), obj_heading = 90.0, obj_coords = vector3(2572.0, -796.770, 42.779), model = `p_cs_advertposter01x`, auto_remove = 30--[[days after placed the flyer will be removed]]},
    --flyer1 = {id = "flyer1", name = "Flyer 1", coords = vector3(2572.415, -796.766, 41.338), obj_heading = 90.0, obj_coords = vector3(2572.0, -796.770, 42.779), model = `p_cs_advertposter01x`, auto_remove = 30--[[days after placed the flyer will be removed]]},
    flyer2 = {id = "flyer2", name = "Flyer 2", coords = vector3(2575.266, -831.424, 41.284), obj_heading = 120.0, obj_coords = vector3(2574.89, -831.609, 42.400), model = `p_cs_advertposter01x`},
    flyer3 = {id = "flyer3", name = "Flyer 3", coords = vector3(2600.976, -863.518, 41.308), obj_heading = 106.0, obj_coords = vector3(2601.260009765625, -863.5, 42.38000106811523), model = `p_cs_advertposter01x`},
    flyer4 = {id = "flyer4", name = "Flyer 4", coords = vector3(2620.587, -905.872, 41.328), obj_heading = 100.0, obj_coords = vector3(2621.0, -905.9299926757812, 42.5099983215332), model = `p_cs_advertposter01x`},
    flyer5 = {id = "flyer5", name = "Flyer 5", coords = vector3(2637.871, -961.509, 42.603), obj_heading = 100.0, obj_coords = vector3(2638.27001953125, -961.6300048828125, 43.84999847412109), model = `p_cs_advertposter01x`},
    flyer6 = {id = "flyer6", name = "Flyer 6", coords = vector3(2657.957, -1053.268, 45.520), obj_heading = 117.0, obj_coords = vector3(2658.34, -1053.449951171875, 46.9900016784668), model = `p_cs_advertposter01x`},
    flyer7 = {id = "flyer7", name = "Flyer 7", coords = vector3(2670.796, -1118.901, 49.624), obj_heading = 104.0, obj_coords = vector3(2671.21, -1118.77001953125, 50.91999816894531), model = `p_cs_advertposter01x`},
    flyer8 = {id = "flyer8", name = "Flyer 8", coords = vector3(2717.883, -1132.514, 49.201), obj_heading = 330.0, obj_coords = vector3(2717.969970703125, -1132.1800537109375, 50.56000137329101), model = `p_cs_advertposter01x`},
    flyer9 = {id = "flyer9", name = "Flyer 9", coords = vector3(2734.686, -1155.156, 48.602), obj_heading = 144.0, obj_coords = vector3(2734.2, -1155.4200439453125, 49.72000122070312), model = `p_cs_advertposter01x`},
    flyer10 = {id = "flyer10", name = "Flyer 10", coords = vector3(2766.047, -1173.899, 47.398), obj_heading = 150.0, obj_coords = vector3(2765.889892578125, -1174.22998046875, 48.55), model = `p_cs_advertposter01x`},
    flyer11 = {id = "flyer11", name = "Flyer 11", coords = vector3(2751.073, -1202.172, 48.338), obj_heading = 150.0, obj_coords = vector3(2750.769775390625, -1202.53, 49.59000015258789), model = `p_cs_advertposter01x`},
    flyer12 = {id = "flyer12", name = "Flyer 12", coords = vector3(2738.773, -1225.569, 48.706), obj_heading = 64.0, obj_coords = vector3(2738.35, -1225.4000244140625, 50.31000137329101), model = `p_cs_advertposter01x`},
    flyer13 = {id = "flyer13", name = "Flyer 13", coords = vector3(2746.068, -1254.333, 48.663), obj_heading = 55.0, obj_coords = vector3(2746.39990234375, -1254.6400146484375, 50.0099983215332), model = `p_cs_advertposter01x`},
    flyer14 = {id = "flyer14", name = "Flyer 14", coords = vector3(2787.877, -1252.777, 46.451), obj_heading = 150.0, obj_coords = vector3(2787.60009765625, -1253.15, 47.79000091552734), model = `p_cs_advertposter01x`},
    flyer15 = {id = "flyer15", name = "Flyer 15", coords = vector3(2815.611, -1233.496, 46.530), obj_heading = 52.0, obj_coords = vector3(2815.949951171875, -1233.7099609375, 47.81000137329101), model = `p_cs_advertposter01x`},
    flyer16 = {id = "flyer16", name = "Flyer 16", coords = vector3(2826.874,-1167.266,46.093), obj_heading = 21.0, obj_coords = vector3(2826.669921875,-1166.9499511719,47.34), model = `p_cs_advertposter01x`},
    flyer17 = {id = "flyer17", name = "Flyer 17", coords = vector3(2856.513,-1181.564,45.241), obj_heading = 8.0, obj_coords = vector3(2856.4296875,-1181.98,46.479999542236), model = `p_cs_advertposter01x`},
    flyer18 = {id = "flyer18", name = "Flyer 18", coords = vector3(2760.784,-1352.063,45.33), obj_heading = 53.0, obj_coords = vector3(2760.4299316406,-1351.7900390625,46.509998321533), model = `p_cs_advertposter01x`},
    flyer19 = {id = "flyer19", name = "Flyer 19", coords = vector3(2727.763,-1401.054,45.203), obj_heading = 116.0, obj_coords = vector3(2728.08,-1400.6300048828,46.389999389648), model = `p_cs_advertposter01x`},
    flyer20 = {id = "flyer20", name = "Flyer 20", coords = vector3(2688.855,-1454.477,45.273), obj_heading = -154.0, obj_coords = vector3(2689.0700683594,-1454.8100585938,46.700000762939), model = `p_cs_advertposter01x`},
    flyer21 = {id = "flyer21", name = "Flyer 21", coords = vector3(2678.699,-1455.892,45.287), obj_heading = 26.0, obj_coords = vector3(2678.5100097656,-1455.4699707031,46.630001068115), model = `p_cs_advertposter01x`},
    --ART GALLERY
    flyer22 = {id = "flyer22", name = "Flyer 22", coords = vector3(2701.197, -1204.766, 55.469), obj_heading = 88.0, obj_coords = vector3(2702.08, -1204.74, 56.81), model = `p_cs_advertposter01x`},
    flyer23 = {id = "flyer23", name = "Flyer 23", coords = vector3(2701.106, -1201.738, 55.469), obj_heading = 92.0, obj_coords = vector3(2702.08, -1201.76, 56.81), model = `p_cs_advertposter01x`},
    flyer24 = {id = "flyer24", name = "Flyer 24", coords = vector3(2696.356, -1200.684, 55.469), obj_heading = 91.0, obj_coords = vector3(2695.42, -1200.72, 56.81), model = `p_cs_advertposter01x`},
    flyer25 = {id = "flyer25", name = "Flyer 25", coords = vector3(2694.793, -1201.117, 55.47), obj_heading = 91.0, obj_coords = vector3(2695.16, -1201.37, 56.81), model = `p_cs_advertposter01x`},
    flyer26 = {id = "flyer26", name = "Flyer 26", coords = vector3(2694.733, -1199.835, 55.469), obj_heading = 91.0, obj_coords = vector3(2695.17, -1199.576, 56.81), model = `p_cs_advertposter01x`},
    flyer27 = {id = "flyer27", name = "Flyer 27", coords = vector3(2689.388, -1199.387, 55.47), obj_heading = 2.0, obj_coords = vector3(2689.37, -1198.91, 56.81), model = `p_cs_advertposter01x`},
    flyer28 = {id = "flyer28", name = "Flyer 28", coords = vector3(2686.017, -1199.386, 55.47), obj_heading = 1.0, obj_coords = vector3(2686.06, -1199.0, 56.81), model = `p_cs_advertposter01x`},
    flyer29 = {id = "flyer29", name = "Flyer 29", coords = vector3(2694.706, -1205.525, 55.47), obj_heading = 90.0, obj_coords = vector3(2695.17, -1205.3, 56.81), model = `p_cs_advertposter01x`},
    flyer30 = {id = "flyer30", name = "Flyer 30", coords = vector3(2694.319, -1207.228, 55.469), obj_heading = 1.0, obj_coords = vector3(2694.33, -1207.63, 56.81), model = `p_cs_advertposter01x`},
    --RHODES
    flyer31 = {id = "flyer31", name = "Flyer 31", coords = vector3(1234.019, -1292.021, 75.963), obj_heading = 135.0, obj_coords = vector3(1233.77, -1292.37, 77.27), model = `p_cs_advertposter01x`},
    flyer32 = {id = "flyer32", name = "Flyer 32", coords = vector3(1239.603, -1293.172, 75.967), obj_heading = 46.0, obj_coords = vector3(1239.97, -1293.45, 77.19), model = `p_cs_advertposter01x`},
    flyer33 = {id = "flyer33", name = "Flyer 33", coords = vector3(1229.27, -1300.824, 75.912), obj_heading = 138.0, obj_coords = vector3(1229.61, -1300.53, 77.28), model = `p_cs_advertposter01x`},
    flyer34 = {id = "flyer34", name = "Flyer 34", coords = vector3(1248.566, -1316.6, 75.891), obj_heading = 45.0, obj_coords = vector3(1248.96, -1316.86, 77.19), model = `p_cs_advertposter01x`},
    flyer35 = {id = "flyer35", name = "Flyer 35", coords = vector3(1292.77, -1326.435, 76.233), obj_heading = 136.0, obj_coords = vector3(1292.95, -1326.05, 77.37), model = `p_cs_advertposter01x`},
    flyer36 = {id = "flyer36", name = "Flyer 36", coords = vector3(1317.01, -1311.403, 75.587), obj_heading = 178.0, obj_coords = vector3(1317.05, -1311.81, 76.78), model = `p_cs_advertposter01x`},
    flyer37 = {id = "flyer37", name = "Flyer 37", coords = vector3(1379.123, -1317.151, 76.327), obj_heading = 120.0, obj_coords = vector3(1379.49, -1316.94, 77.66), model = `p_cs_advertposter01x`},
    --VAN HORN
    flyer38 = {id = "flyer38", name = "Flyer 38", coords = vector3(2962.313, 472.95, 47.611), obj_heading = 110.0, obj_coords = vector3(2961.98, 472.85, 48.85), model = `p_cs_advertposter01x`},
    flyer39 = {id = "flyer39", name = "Flyer 39", coords = vector3(2954.442, 499.627, 44.858), obj_heading = 99.0, obj_coords = vector3(2953.96, 499.57, 46.28), model = `p_cs_advertposter01x`},
    flyer40 = {id = "flyer40", name = "Flyer 40", coords = vector3(2953.516, 544.269, 43.821), obj_heading = 82.0, obj_coords = vector3(2953.1, 544.32, 45.32), model = `p_cs_advertposter01x`},
    flyer41 = {id = "flyer41", name = "Flyer 41", coords = vector3(2980.544, 570.867, 43.635), obj_heading = 79.0, obj_coords = vector3(2980.2, 570.859, 45.1), model = `p_cs_advertposter01x`},
    flyer42 = {id = "flyer42", name = "Flyer 42", coords = vector3(2983.044, 570.468, 43.599), obj_heading = 80.0, obj_coords = vector3(2983.39, 570.459, 45.17), model = `p_cs_advertposter01x`},    
    --ANNESBURG
    flyer43 = {id = "flyer43", name = "Flyer 43", coords = vector3(2910.738, 1307.064, 43.713), obj_heading = 72.0, obj_coords = vector3(2910.24, 1307.2, 45.04), model = `p_cs_advertposter01x`},
    flyer44 = {id = "flyer44", name = "Flyer 44", coords = vector3(2930.419, 1267.25, 43.649), obj_heading = 160.0, obj_coords = vector3(2930.47, 1267.69, 45.13), model = `p_cs_advertposter01x`},
    flyer45 = {id = "flyer45", name = "Flyer 45", coords = vector3(2933.157, 1286.74, 43.653), obj_heading = 71.0, obj_coords = vector3(2933.63, 1286.7, 45.11), model = `p_cs_advertposter01x`},
    flyer46 = {id = "flyer46", name = "Flyer 46", coords = vector3(2949.306, 1342.707, 43.891), obj_heading = 160.0, obj_coords = vector3(2949.39, 1343.23, 45.56), model = `p_cs_advertposter01x`},
    --VALENTINE
    flyer47 = {id = "flyer47", name = "Flyer 47", coords = vector3(-259.711, 818.451, 118.991), obj_heading = 176.0, obj_coords = vector3(-259.65, 818.0, 120.38), model = `p_cs_advertposter01x`},
    flyer48 = {id = "flyer48", name = "Flyer 48", coords = vector3(-269.939, 805.169, 118.327), obj_heading = 8.0, obj_coords = vector3(-270.09, 805.58, 119.68), model = `p_cs_advertposter01x`},
    flyer49 = {id = "flyer49", name = "Flyer 49", coords = vector3(-318.068, 797.895, 116.433), obj_heading = 101.0, obj_coords = vector3(-318.61, 797.8, 118.03), model = `p_cs_advertposter01x`},
    flyer50 = {id = "flyer50", name = "Flyer 50", coords = vector3(-316.885, 777.227, 117.038), obj_heading = 100.0, obj_coords = vector3(-317.37, 777.06, 118.29), model = `p_cs_advertposter01x`},
    flyer51 = {id = "flyer51", name = "Flyer 51", coords = vector3(-335.781, 755.386, 115.887), obj_heading = 91.0, obj_coords = vector3(-335.41, 755.34, 117.29), model = `p_cs_advertposter01x`},
    flyer52 = {id = "flyer52", name = "Flyer 52", coords = vector3(-263.846, 631.984, 112.456), obj_heading = 142.0, obj_coords = vector3(-263.59, 632.35, 113.95), model = `p_cs_advertposter01x`},
    flyer53 = {id = "flyer53", name = "Flyer 53", coords = vector3(-243.544, 695.28, 112.392), obj_heading = 143.0, obj_coords = vector3(-243.79, 694.9, 113.83), model = `p_cs_advertposter01x`},
    flyer54 = {id = "flyer54", name = "Flyer 54", coords = vector3(-178.326, 640.068, 113.032), obj_heading = 58.0, obj_coords = vector3(-177.97, 639.77, 114.53), model = `p_cs_advertposter01x`},
     --STRAWBERRY
    flyer55 = {id = "flyer55", name = "Flyer 55", coords = vector3(-1758.784, -383.524, 156.689), obj_heading = 56.0, obj_coords = vector3(-1759.14, -383.23, 158.27), model = `p_cs_advertposter01x`},
    flyer56 = {id = "flyer56", name = "Flyer 56", coords = vector3(-1750.811, -409.109, 154.453), obj_heading = 13.0, obj_coords = vector3(-1750.76, -409.5, 155.89), model = `p_cs_advertposter01x`},
    flyer57 = {id = "flyer57", name = "Flyer 57", coords = vector3(-1779.63, -373.6, 158.91), obj_heading = 137.0, obj_coords = vector3(-1779.39, -373.26, 160.16), model = `p_cs_advertposter01x`},
    flyer58 = {id = "flyer58", name = "Flyer 58", coords = vector3(-1807.852, -353.821, 163.136), obj_heading = 67.0, obj_coords = vector3(-1808.15, -353.61, 164.8), model = `p_cs_advertposter01x`},
    flyer59 = {id = "flyer59", name = "Flyer 59", coords = vector3(-1786.447, -385.434, 159.233), obj_heading = 145.0, obj_coords = vector3(-1786.74, -385.67, 160.55), model = `p_cs_advertposter01x`},
    flyer60 = {id = "flyer60", name = "Flyer 60", coords = vector3(-1789.707, -421.974, 154.734), obj_heading = 175.0, obj_coords = vector3(-1789.64, -421.52, 156.1), model = `p_cs_advertposter01x`},
    flyer61 = {id = "flyer61", name = "Flyer 61", coords = vector3(-1811.354, -424.736, 158.997), obj_heading = 165.0, obj_coords = vector3(-1811.43, -425.08, 160.54), model = `p_cs_advertposter01x`},     
    --BLACKWATER
    flyer62 = {id = "flyer62", name = "Flyer 62", coords = vector3(-762.06, -1261.274, 42.519), obj_heading = 180.0, obj_coords = vector3(-761.991, -1261.74, 43.95), model = `p_cs_advertposter01x`},
    flyer63 = {id = "flyer63", name = "Flyer 63", coords = vector3(-764.357, -1261.183, 42.51), obj_heading = 180.0, obj_coords = vector3(-764.39, -1261.74, 43.95), model = `p_cs_advertposter01x`},
    flyer64 = {id = "flyer64", name = "Flyer 64", coords = vector3(-766.649, -1261.277, 42.575), obj_heading = 180.0, obj_coords = vector3(-766.6, -1261.74, 43.95), model = `p_cs_advertposter01x`},
    flyer65 = {id = "flyer65", name = "Flyer 65", coords = vector3(-755.207, -1331.789, 42.649), obj_heading = 180.0, obj_coords = vector3(-755.4, -1332.2, 44.23), model = `p_cs_advertposter01x`},
    flyer66 = {id = "flyer66", name = "Flyer 66", coords = vector3(-758.685, -1365.765, 42.658), obj_heading = 2.0, obj_coords = vector3(-758.74, -1365.3, 44.31), model = `p_cs_advertposter01x`},
    flyer67 = {id = "flyer67", name = "Flyer 67", coords = vector3(-794.039, -1343.556, 42.764), obj_heading = 2.0, obj_coords = vector3(-794.13, -1343.03, 44.24), model = `p_cs_advertposter01x`},
    flyer68 = {id = "flyer68", name = "Flyer 68", coords = vector3(-813.202, -1328.08, 42.664), obj_heading = 0.0, obj_coords = vector3(-813.352, -1327.74, 44.07), model = `p_cs_advertposter01x`},
    flyer69 = {id = "flyer69", name = "Flyer 69", coords = vector3(-831.438, -1345.225, 42.672), obj_heading = 180.0, obj_coords = vector3(-831.451, -1345.72, 44.17), model = `p_cs_advertposter01x`},
    flyer70 = {id = "flyer70", name = "Flyer 70", coords = vector3(-842.041, -1341.804, 42.409), obj_heading = 93.0, obj_coords = vector3(-842.43, -1341.97, 43.91), model = `p_cs_advertposter01x`},
    flyer71 = {id = "flyer71", name = "Flyer 71", coords = vector3(-879.85, -1326.377, 42.975), obj_heading = 90.0, obj_coords = vector3(-879.56, -1326.37, 44.54), model = `p_cs_advertposter01x`},
    flyer72 = {id = "flyer72", name = "Flyer 72", coords = vector3(-872.51, -1340.792, 42.247), obj_heading = 1.0, obj_coords = vector3(-872.55, -1340.4, 43.81), model = `p_cs_advertposter01x`},
    flyer73 = {id = "flyer73", name = "Flyer 73", coords = vector3(-877.984, -1359.408, 42.51), obj_heading = 1.0, obj_coords = vector3(-878.043, -1359.85, 44.02), model = `p_cs_advertposter01x`},
    --ARMADILLO
    flyer74 = {id = "flyer74", name = "Flyer 74", coords = vector3(-3627.061, -2598.268, -14.752), obj_heading = 29.0, obj_coords = vector3(-3626.78, -2598.64, -13.24), model = `p_cs_advertposter01x`},
    flyer75 = {id = "flyer75", name = "Flyer 75", coords = vector3(-3623.041, -2598.856, -14.778), obj_heading = 25.0, obj_coords = vector3(-3622.93, -2599.28, -13.29), model = `p_cs_advertposter01x`},
    flyer76 = {id = "flyer76", name = "Flyer 76", coords = vector3(-3643.345, -2589.466, -14.675), obj_heading = 90.0, obj_coords = vector3(-3643.79, -2589.43, -13.11), model = `p_cs_advertposter01x`},
    flyer77 = {id = "flyer77", name = "Flyer 77", coords = vector3(-3664.444, -2604.377, -14.649), obj_heading = 89.0, obj_coords = vector3(-3664.84, -2604.28, -13.16), model = `p_cs_advertposter01x`},
    flyer78 = {id = "flyer78", name = "Flyer 78", coords = vector3(-3679.746, -2618.675, -14.832), obj_heading = 125.0, obj_coords = vector3(-3679.99, -2618.81, -13.4), model = `p_cs_advertposter01x`},
    flyer79 = {id = "flyer79", name = "Flyer 79", coords = vector3(-3693.672, -2600.23, -14.303), obj_heading = 0.0, obj_coords = vector3(-3693.613, -2599.75, -12.92), model = `p_cs_advertposter01x`},
    flyer80 = {id = "flyer80", name = "Flyer 80", coords = vector3(-3696.604, -2601.191, -14.3), obj_heading = 90.0, obj_coords = vector3(-3696.99, -2601.279, -12.92), model = `p_cs_advertposter01x`},
    flyer81 = {id = "flyer81", name = "Flyer 81", coords = vector3(-3726.934, -2596.551, -14.423), obj_heading = 90.0, obj_coords = vector3(-3727.38, -2596.64, -13.0), model = `p_cs_advertposter01x`},
    flyer82 = {id = "flyer82", name = "Flyer 82", coords = vector3(-3726.99, -2598.724, -14.434), obj_heading = 90.0, obj_coords = vector3(-3727.38, -2598.71, -13.0), model = `p_cs_advertposter01x`},
    flyer83 = {id = "flyer83", name = "Flyer 83", coords = vector3(-3727.122, -2626.866, -14.269), obj_heading = 180.0, obj_coords = vector3(-3727.08, -2627.21, -12.79), model = `p_cs_advertposter01x`},
    flyer84 = {id = "flyer84", name = "Flyer 84", coords = vector3(-3733.706, -2612.584, -13.85), obj_heading = 92.0, obj_coords = vector3(-3733.24, -2612.57, -12.48), model = `p_cs_advertposter01x`},
    --TUMBLEWEED
    flyer85 = {id = "flyer85", name = "Flyer 85", coords = vector3(-5485.243, -2940.451, -2.126), obj_heading = 37.0, obj_coords = vector3(-5485.64, -2940.16, -0.43), model = `p_cs_advertposter01x`},
    flyer86 = {id = "flyer86", name = "Flyer 86", coords = vector3(-5496.271, -2935.493, -1.447), obj_heading = 128.0, obj_coords = vector3(-5496.02, -2935.28, -0.21), model = `p_cs_advertposter01x`},
    flyer87 = {id = "flyer87", name = "Flyer 87", coords = vector3(-5501.275, -2959.111, -1.655), obj_heading = 15.0, obj_coords = vector3(-5501.09, -2959.58, -0.18), model = `p_cs_advertposter01x`},
    flyer88 = {id = "flyer88", name = "Flyer 88", coords = vector3(-5529.36, -2948.655, -2.36), obj_heading = 105.0, obj_coords = vector3(-5529.69, -2948.74, -0.94), model = `p_cs_advertposter01x`},
    flyer89 = {id = "flyer89", name = "Flyer 89", coords = vector3(-5529.326, -2931.733, -2.957), obj_heading = 25.0, obj_coords = vector3(-5529.29, -2931.29, -1.3), model = `p_cs_advertposter01x`},
    flyer90 = {id = "flyer90", name = "Flyer 90", coords = vector3(-5525.324, -2927.346, -3.064), obj_heading = 115.0, obj_coords = vector3(-5525.79, -2927.54, -1.57), model = `p_cs_advertposter01x`},
}

Config.FlyerItemImages = {
    flyer_image1 = "../../picture/01.jpg",
    flyer_image2 = "../../picture/02.jpg",
    flyer_image3 = "../../picture/03.png",
    flyer_image4 = "../../picture/04.png",
    flyer_image5 = "../../picture/05.jpg",
    flyer_image6 = "../../picture/06.png",
    flyer_image7 = "../../picture/07.png",

}

--[[
    --REDEM:RP INVENTORY 2.0 ITEM
    ["flyer_remover"] = { label = "Flyer Remover", description = "Remove Flyers from Walls", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 50,imgsrc = "items/flyer_remover.png", type = "item_standard",},

    ["flyer_image1"] = { label = "Flyer Image 1", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image1.png", type = "item_standard",},
    ["flyer_image2"] = { label = "Flyer Image 2", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image2.png", type = "item_standard",},
    ["flyer_image3"] = { label = "Flyer Image 3", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image3.png", type = "item_standard",},
    ["flyer_image4"] = { label = "Flyer Image 4", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image4.png", type = "item_standard",},
    ["flyer_image5"] = { label = "Flyer Image 5", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image5.png", type = "item_standard",},
    ["flyer_image6"] = { label = "Flyer Image 6", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image6.png", type = "item_standard",},
    ["flyer_image7"] = { label = "Flyer Image 7", description = "A flyer", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 20,imgsrc = "items/flyer_image7.png", type = "item_standard",},
]]

--[[
    --QBR/QR ITEMS
    ['flyer_remover'] = {['name'] = 'flyer_remover', ['label'] = 'Flyer Remover', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_remover.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Remove Flyers from Walls'},

    ['flyer_image1'] = {['name'] = 'flyer_image1', ['label'] = 'Flyer Image 1', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image2'] = {['name'] = 'flyer_image2', ['label'] = 'Flyer Image 2', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image3'] = {['name'] = 'flyer_image3', ['label'] = 'Flyer Image 3', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image4'] = {['name'] = 'flyer_image4', ['label'] = 'Flyer Image 4', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image4.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image5'] = {['name'] = 'flyer_image5', ['label'] = 'Flyer Image 5', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image5.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image6'] = {['name'] = 'flyer_image6', ['label'] = 'Flyer Image 6', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image6.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
    ['flyer_image7'] = {['name'] = 'flyer_image7', ['label'] = 'Flyer Image 7', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/flyer_image7.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A flyer'},
]]