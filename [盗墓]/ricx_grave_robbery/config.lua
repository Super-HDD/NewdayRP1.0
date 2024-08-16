Config = {}

Config.framework = "rsg" --"redemrp" or "vorp" or "rsg"

Config.PrayAnim =  {
    {"amb_misc@world_human_pray_rosary@base", "base"},
    {"amb_misc@prop_human_seat_pray@male_b@idle_b", "idle_d"},
    {"script_common@shared_scenarios@stand@random@town_burial@stand_mourn@male@react_look@loop@generic", "front"},
    {"amb_misc@world_human_grave_mourning@kneel@female_a@idle_a", "idle_a"},
    {"script_common@shared_scenarios@kneel@mourn@female@a@base", "base"},
    {"amb_misc@world_human_grave_mourning@female_a@idle_a", "idle_a"},
    {"amb_misc@world_human_grave_mourning@male_b@idle_c", "idle_g"},
    {"amb_misc@world_human_grave_mourning@male_b@idle_c", "idle_h"},
}

Config.ShovelItem = "shovel" --inventory name of the shovel item for grave dig
Config.DiggingTimer = 30--seconds
Config.Dig = {
    shovel = `p_shovel02x`,
    anim = {"amb_work@world_human_gravedig@working@male_b@idle_a", "idle_a"},
    bone = "skel_r_hand",
    pos = {0.06, -0.06, -0.03, 270.0, 165.0, 17.0},
}

Config.Rewards = {
    {item = "golden_ring", label = "著名黑人老凯文的金戒指"},
    {item = "golden_nugget", label = "坟墓里面找到的古老金块"},
    {item = "rock", label = "坟墓里面找到的破碎石块"},
}

Config.Prompts = {
    Prompt1 = 0x05CA7C52,
    Prompt2 = 0x156F7119,
}

Config.Texts = {
    Prompt1 = "盗墓",
    Prompt2 = "祈祷",
    GraveRobbery = "盗墓行为",
    GraveDisplay = "墓碑:",
    CantDoThat = "您现在不能这样做!",
    GraveRobbed = "这个墓已经被挖空了，小逼崽子!",
    NoShovel = "这个墓空空如也，你什么也没有发现!",
    FoundItem = "算你走运，找到了一些物品!",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.Graves = {
    --Rhodes
    [1] = {
        name = "传奇牛仔 亚瑟 摩根",
        coords = vector3(1282.042, -1242.295, 79.989),
        heading = 26.0788,
    },
    [2] = {
        name = "臭名昭著的诈骗犯 赫伯特 达伦",
        coords = vector3(1280.190, -1243.406, 79.721),
        heading = 26.999,
    },
    [3] = {
        name = "著名黑人演讲家 凯文 本",
        coords = vector3(1277.646, -1243.937, 79.641),
        heading = 28.891,
    },
    [4] = {
        name = "客死他乡的同性恋 唐纳德 迈克尔",
        coords = vector3(1273.183, -1238.915, 79.715),
        heading = 21.938,
    },
    [5] = {
        name = "有趣的老侦探 约瑞克 洛佩兹",
        coords = vector3(1275.114, -1237.997, 79.923),
        heading = 17.2695,
    },
    [6] = {
        name = "伯明翰人 汤米 史密斯",
        coords = vector3(1277.472, -1237.081, 80.183),
        heading = 22.858,
    },
    [7] = {
        name = "港口的浮尸 比尔 约翰逊",
        coords = vector3(1277.429, -1231.219, 80.685),
        heading = 9.5856,
    },
    [8] = {
        name = "短跑健将 约翰 史密斯",
        coords = vector3(1273.790, -1229.006, 80.594),
        heading = 5.973,
    },
    [9] = {
        name = "红色左轮武器店第一任老板 约翰 戴维斯",
        coords = vector3(1270.969, -1230.913, 80.255),
        heading = 11.065,
    },
    [10] = {
        name = "直面野狼的拳击手 瑞德 马托",
        coords = vector3(1267.327, -1232.056, 79.946),
        heading = 16.203,
    },
    [11] = {
        name = "前国会议员 卢斯考奥 斯忒朗",
        coords = vector3(1268.745, -1228.923, 80.280),
        heading = 15.811,
    },
    [12] = {
        name = "天真懵懂的 盖伦 史密斯",
        coords = vector3(1275.525, -1220.127, 81.420),
        heading = 18.769,
    },
    [13] = {
        name = "卖假药的 亚瑟 阿德勒",
        coords = vector3(1271.028, -1224.483, 80.772),
        heading = 15.9214,
    },
    [14] = {
        name = "被陷害者 汤姆 汉密尔顿",
        coords = vector3(1272.812, -1224.395, 80.905),
        heading = 16.95,
    },
    [15] = {
        name = "瓦伦丁正式警员 里尔根·乔",
        coords = vector3(1274.721, -1223.716, 81.162),
        heading = 22.049,
    },
    [16] = {
        name = "永远的黑水镇好邻居 让·皮尔斯",
        coords = vector3(1279.936, -1214.892, 81.869),
        heading = 14.358,
    },
    [17] = {
        name = "牺牲的优秀警员 鲁迪 帕斯",
        coords = vector3(1275.776, -1207.828, 82.502),
        heading = 192.68,
    },
    [18] = {
        name = "Unknown",
        coords = vector3(1292.837, -1214.911, 81.841),
        heading = 358.166,
    },
    [19] = {
        name = "Unknown",
        coords = vector3(1295.810, -1215.574, 81.551),
        heading = 14.873,
    },
    [20] = {
        name = "Unknown",
        coords = vector3(1298.355, -1214.914, 81.341),
        heading = 4.81563,
    },
    [21] = {
        name = "Unknown",
        coords = vector3(1297.090, -1212.736, 81.562),
        heading = 15.6860,
    },
    [22] = {
        name = "Unknown",
        coords = vector3(1295.598, -1213.070, 81.674),
        heading = 103.038,
    },
    [23] = {
        name = "Unknown",
        coords = vector3(1294.745, -1213.792, 81.716),
        heading = 17.239,
    },
    [24] = {
        name = "Unknown",
        coords = vector3(1292.806, -1211.421, 82.019),
        heading = 19.154,
    },
    [25] = {
        name = "Unknown",
        coords = vector3(1293.655, -1210.771, 81.990),
        heading = 11.1098,
    },
    [26] = {
        name = "Unknown",
        coords = vector3(1295.177, -1210.914, 81.834),
        heading = 28.956,
    },
    [27] = {
        name = "William 'Willie' Bowley",
        coords = vector3(1302.913, -1214.625, 80.995),
        heading = 14.057,
    },
    [28] = {
        name = "Unknown",
        coords = vector3(1292.054, -1209.464, 82.274),
        heading = 24.189,
    },
    [29] = {
        name = "Unknown",
        coords = vector3(1290.816, -1210.013, 82.305),
        heading = 17.146,
    },
    [30] = {
        name = "Unknown",
        coords = vector3(1296.455, -1210.326, 81.760),
        heading = 26.106,
    },
}


--[[
    --REDEM:RP INVENTORY 2.0 ITEM

    ["item"] =
    {
        label = "",
        description = "",
        weight = 0.05,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 50,
        imgsrc = "items/item.png",
        type = "item_standard",
    },
]]
