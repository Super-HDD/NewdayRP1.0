Config = {}

Config.Debug                    = false

-- 设置
Config.JobRequired = 'medic' -- 需要的工作为医务人员
Config.StorageMaxWeight = 4000000 -- 最大仓库重量
Config.StorageMaxSlots = 1000 -- 最大仓库槽数量
Config.DeathTimer = 1500 -- 死亡计时器时间，单位为毫秒（300 = 5分钟/测试中的60 = 1分钟）
Config.WipeInventoryOnRespawn = true -- 重生时清空物品栏
Config.WipeCashOnRespawn = true -- 重生时清空现金
Config.MaxHealth = 600 -- 玩家的最大生命值
Config.MedicReviveTime = 5000 -- 医务人员复活时间，单位为毫秒
Config.MedicTreatTime = 5000 -- 医务人员治疗时间，单位为毫秒
Config.DisableRegeneration = false -- 启用/禁用玩家生命值恢复
Config.AddGPSRoute = true -- 添加GPS导航路线
Config.MedicCallDelay = 60 -- 下一次呼叫医务人员之前的延迟时间，单位为秒

-- Blip Settings
-- Config.Blip =
-- {
    -- blipName                    = '医疗', -- Config.Blip.blipName
    -- blipSprite                  = 'blip_shop_doctor', -- Config.Blip.blipSprite
   --  blipScale                   = 0.2 -- Config.Blip.blipScale
-- }

Config.SaloonTenderLocations = {
    {name = '瓦伦丁诊所医疗菜单',         location = 'medic',      coords = vector3(-287.59, 811.28, 119.39), showblip = false, showmarker = ture},
    {name = '黑水镇城镇医院医疗菜单',         location = 'medic',      coords = vector3(-785.2396, -1303.2222, 43.7962), showblip = false, showmarker = ture},
    {name = '罗德镇诊所医疗菜单',         location = 'medic',      coords = vector3(1368.2417, -1307.7574, 78.0208), showblip = false, showmarker = ture}, 
    {name = '圣丹尼斯城市医院医疗菜单',         location = 'medic',      coords = vector3(2733.8359, -1230.2860, 50.3704), showblip = false, showmarker = ture}, 
    }

-- Prompt Locations
Config.MedicJobLocations =
{
    {name = '瓦伦丁诊所', prompt = 'valmedic', coords = vector3(-287.59, 811.28, 119.39 -0.8), showblip = true}, 
    {name = '黑水镇城镇医院', prompt = 'blamedic', coords = vector3(-785.2396, -1303.2222, 43.7962 -0.8), showblip = true},
    {name = '罗德镇诊所', prompt = 'rhomedic', coords = vector3(1368.2417, -1307.7574, 78.0208 -0.8), showblip = true},
    {name = '圣丹尼斯城市医院', prompt = 'stdmedic', coords = vector3(2733.8359, -1230.2860, 50.3704 -0.8), showblip = true},
    
    }

-- Medic Supplies
Config.MedicSupplies =
{
    [1] = {name = "bandage", price = 0, amount = 500, info = {}, type = "item", slot = 1},
    [2] = {name = "firstaid", price = 0, amount = 500, info = {}, type = "item", slot = 2}
}

-- Respawn Locations
Config.RespawnLocations =
{
    [1] = {coords = vector4(-242.69, 796.27, 121.16, 110.18)}, -- Valentine
    [2] = {coords = vector4(-733.28, -1242.97, 44.73, 87.64)}, -- Blackwater
    [3] = {coords = vector4(-1801.98, -366.95, 161.66, 236.04)}, -- Strawberry
    [4] = {coords = vector4(-3613.85, -2640.1, -11.73, 47.92)}, -- Armadillo
    [5] = {coords = vector4(-5436.5, -2930.96, 0.69, 182.25)}, -- Tumbleweed
    [6] = {coords = vector4(2725.33, -1067.42, 47.4, 168.42)}, -- Staint Denis
    [7] = {coords = vector4(1291.85, -1236.22, 80.93, 210.67)}, -- Rhodes
    [8] = {coords = vector4(3033.01, 433.82, 63.81, 65.9)}, -- Van Horn
    [9] = {coords = vector4(3016.71, 1345.64, 42.69, 67.85)} -- Annesburg
}




Config.AuthorizedVehicles = {
    -- Grade 0
    [0] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 1
    [1] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 2
    [2] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 3
    [3] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 4
    [4] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 5
    [5] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 6
    [6] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 7
    [7] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 8
    [8] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 9
    [9] = {
        ["wagondoc01x"] = "Medic Vagon",
    },
    -- Grade 10
    [10] = {
        ["wagondoc01x"] = "Medic Vagon",
    }
}