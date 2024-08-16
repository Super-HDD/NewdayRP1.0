Config = Config or {}
Config.FarmPlants = {}

-- 工作设置
Config.EnableJob = false -- (true = 需要工作 / false = 任何人都可以种植)
Config.JobRequired = false -- 需要的工作来进行种植 (如果 Config.EnableJob = false，此项无效)

-- 开始种植设置
Config.GrowthTimer = 60000 -- 60000 = 每1分钟/测试1000 = 1秒
Config.DeadPlantTime = 60 * 60 * 24 -- 植物死亡并从数据库中删除的时间 - 例如: 60 * 60 * 24表示1天 / 60 * 60 * 48表示2天 / 60 * 60 * 72表示3天
Config.StartingThirst = 100.0 -- 初始植物口渴百分比
Config.StartingHunger = 100.0 -- 初始植物饥饿百分比
Config.HungerIncrease = 25.0 -- 浇水时增加的饥饿值
Config.ThirstIncrease = 25.0 -- 使用肥料时增加的口渴值
Config.Degrade = {min = 3, max = 5} -- 植物凋谢时间范围
Config.QualityDegrade = {min = 8, max = 12} -- 植物品质减少范围
Config.GrowthIncrease = {min = 10, max = 20} -- 植物增长值范围
Config.MaxPlantCount = 40 -- 玩家最多可以拥有的植物数量
Config.UseFarmingZones = true -- true = 使用农场区域 / false = 不使用农场区域
Config.UseSeedBasedZones = false -- true = 使用基于种子的农场区域 / false = 不使用基于种子的特定农场区域
Config.NotificationSound = true -- 当启用 UseSeedBasedZones 时，当玩家执行某些操作时播放通知声音
Config.ProgressBar = true -- 当玩家执行某些操作时添加进度条
Config.CollectWaterTime = 3000 -- 设置收集水的时间
Config.CollectPooTime = 3000 -- 设置收集肥料的时间

-- farm plants
Config.FarmItems = {
    {
        planttype = 'corn',
        item = 'corn',
        label = Lang:t('label.corn'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'sugar',
        item = 'sugar',
        label =  Lang:t('label.sugar'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'tobacco',
        item = 'tobacco',
        label = Lang:t('label.tobacco'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'carrot',
        item = 'carrot',
        label = Lang:t('label.carrot'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'tomato',
        item = 'tomato',
        label = Lang:t('label.tomato'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'broccoli',
        item = 'broccoli',
        label = Lang:t('label.broccoli'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
    {
        planttype = 'potato',
        item = 'potato',
        label = Lang:t('label.potato'),
        -- reward settings
        poorRewardMin = 1,
        poorRewardMax = 2,
        goodRewardMin = 3,
        goodRewardMax = 4,
        exellentRewardMin = 5,
        exellentRewardMax = 6,
    },
}
-- end plant settings

Config.Blip = {
    blipName = Lang:t('blip.farm_shop'), -- Config.Blip.blipName
    blipSprite = 'blip_shop_market_stall', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- farm shop
Config.FarmShop = {
     [1] = { name = "carrotseed",   price = 0.10, amount = 500,  info = {}, type = "item", slot = 1, },
     [2] = { name = "cornseed",     price = 0.10, amount = 500,  info = {}, type = "item", slot = 2, },
     [3] = { name = "sugarseed",    price = 0.10, amount = 500,  info = {}, type = "item", slot = 3, },
     [4] = { name = "tobaccoseed",  price = 0.10, amount = 500,  info = {}, type = "item", slot = 4, },
     [5] = { name = "tomatoseed",   price = 0.10, amount = 500,  info = {}, type = "item", slot = 5, },
     [6] = { name = "broccoliseed", price = 0.10, amount = 500,  info = {}, type = "item", slot = 6, },
     [7] = { name = "potatoseed",   price = 0.10, amount = 500,  info = {}, type = "item", slot = 7, },
     [8] = { name = "bucket",       price = 10,   amount = 50,   info = {}, type = "item", slot = 8, },
     [9] = { name = "fertilizer",   price = 0.10, amount = 5000, info = {}, type = "item", slot = 9, },
}

--农场商店位置
Config.FarmShopLocations = {
    [1] = {name = Lang:t('blip.farm_shop'), coords = vector3(-249.43, 685.72, 113.33), showblip = true, showmarker = true},
}
  
-- farm zone settings
Config.FarmZone = { 
    [1] = {
        zones = { -- 瓦伦丁公共种植地
            vector2(-347.09591674805, 894.11151123047),
            vector2(-390.92279052734, 889.30194091797),
            vector2(-392.01412963867, 911.32104492188),
            vector2(-373.91583251953, 913.11346435547),
            vector2(-369.53713989258, 944.28149414063),
            vector2(-349.36514282227, 941.19653320313),
        },
        --name = "carrot",
        blipname =  Lang:t('公共种植地'),
        minZ = 115.78807830811,
        maxZ = 122.06151580811,
        showblip = true,
        blipcoords = vector3(-375.72, 900.24, 116.08)
    },

    [2] ={
        zones ={
            vector2(1434.18, 316.4),
            vector2(1433.37, 297.9),
            vector2(1449.4, 297.92),
            vector2(1447.66, 317.41)
        },
        minZ = 70.78807830811,
        maxZ = 122.06151580811,
        showblip = false,
    }

   

    
    
}

Config.WaterProps = {
    `p_watertrough01x`,
    `p_watertroughsml01x`,
    `p_watertrough01x_new`,
    `p_watertrough02x`,
    `p_watertrough03x`,
}

Config.FertilizerProps = {
    `p_horsepoop02x`,
    `p_horsepoop03x`,
    `new_p_horsepoop02x_static`,
    `p_poop01x`,
    `p_poop02x`,
    `p_poopile01x`,
    `p_sheeppoop01`,
    `p_sheeppoop02x`,
    `p_sheeppoop03x`,
    `p_wolfpoop01x`,
    `p_wolfpoop02x`,
    `p_wolfpoop03x`,
    `s_horsepoop01x`,
    `s_horsepoop02x`,
    `s_horsepoop03x`,
    `mp007_p_mp_horsepoop03x`,
}
