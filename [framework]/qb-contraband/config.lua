Config = Config or {}

Config.MinimumLawmen = 1 -- 服务器上需要有的警员数量才能进行交易
Config.LawmenJob = 'police' -- 服务器上警员的职业名称

-- 违禁品清单
Config.ContrabandList = {
    "moonshine", -- 月光酒
}

-- 违禁品价格
Config.ContrabandPrice = { -- 设置违禁品的正常出售价格和欺诈价格
    ["moonshine"] = { min = 3, max = 7, scammin = 1, scammax = 3 }, -- 白蘭地的价格范围
}




