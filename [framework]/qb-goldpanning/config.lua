Config = {}

-- set the reward items
Config.RewardItems = {
    'smallnugget',
    'mediumnugget',
    'largenugget',
}

-- set the amount of nuggets to give
Config.SmallRewardAmount  = 1
Config.MediumRewardAmount = 1
Config.LargeRewardAmount  = 1
Config.GoldChance = 30 -- (30 = 70% changce of not finding gold)

-- set the amount of nuggets to give in hotspot
Config.HSSmallRewardAmount   = 3
Config.HSMediumRewardAmount  = 3
Config.HSHSLargeRewardAmount = 3
Config.HSGoldChance = 70 -- (70 = 30% changce of not finding gold

-- gold hotspot zones
Config.HotspotZones = { 
    [1] = {
        zones = { 
            vector2(-2668.4643554688, -331.17501831055),
            vector2(-2676.6958007813, -345.48364257813),
            vector2(-2692.796875, -341.9401550293),
            vector2(-2691.8974609375, -334.74746704102)
        },
        minZ = 142.12985229492,
        maxZ = 143.64106750488
    },
    [2] = {
        zones = { 
            vector2(1542.0013427734, -7162.8862304688),
            vector2(1547.5384521484, -7171.96875),
            vector2(1556.6940917969, -7168.587890625),
            vector2(1550.9084472656, -7158.328125)
        },
        minZ = 62.612213134766,
        maxZ = 63.129043579102
    },
}

Config.WaterTypes = {
    [1] =  {["name"] = "圣路易斯河",        ["waterhash"] = -1504425495,    ["watertype"] = "river"},
[2] =  {["name"] = "上蒙塔那河",        ["waterhash"] = -1781130443,    ["watertype"] = "river"},
[3] =  {["name"] = "奥万吉拉湖",        ["waterhash"] = -1300497193,    ["watertype"] = "river"},
[4] =  {["name"] = "鹰眼溪",            ["waterhash"] = -1276586360,    ["watertype"] = "river"},
[5] =  {["name"] = "小溪河",            ["waterhash"] = -1410384421,    ["watertype"] = "river"},
[6] =  {["name"] = "达科他河",          ["waterhash"] = 370072007,      ["watertype"] = "river"},
[7] =  {["name"] = "贝尔图斯溪",        ["waterhash"] = 650214731,      ["watertype"] = "river"},
[8] =  {["name"] = "死靴溪",            ["waterhash"] = 1245451421,     ["watertype"] = "river"},
[9] =  {["name"] = "蜘蛛峡谷",          ["waterhash"] = -218679770,     ["watertype"] = "river"},
[10] = {["name"] = "罗诺克山谷",        ["waterhash"] = -1229593481,    ["watertype"] = "river"},
[11] = {["name"] = "兰纳希河",          ["waterhash"] = -2040708515,    ["watertype"] = "river"},
[12] = {["name"] = "随机1",            ["waterhash"] = 231313522,      ["watertype"] = "river"},
[13] = {["name"] = "随机2",            ["waterhash"] = 2005774838,     ["watertype"] = "river"},
[14] = {["name"] = "随机3",            ["waterhash"] = -1287619521,    ["watertype"] = "river"},
[15] = {["name"] = "随机4",            ["waterhash"] = -1308233316,    ["watertype"] = "river"},
[16] = {["name"] = "随机5",            ["waterhash"] = -196675805,     ["watertype"] = "river"},
[17] = {["name"] = "鳄鱼溪",            ["waterhash"] = -49694339,      ["watertype"] = "river"},

}
