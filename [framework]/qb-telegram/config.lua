Config = {}

-- General Settings
Config.Debug                = false -- Dnable/disable debug functions
Config.AllowSendToSelf      = false -- 调试功能允许向我们自己发送信件（测试目的）
Config.ChargePlayer         = true -- 发信时是否向玩家收费
Config.CostPerLetter        = 0.50 -- 寄信费用

-- Bird Post settings
Config.BirdModel            = 'A_C_Owl_01' -- Bird model to use
Config.AutoResurrect        = true -- 发送信件时死亡的小鸟会自动复活
Config.BirdArrivalDelay     = 20000 -- 设置小鸟在 20 秒后到达
Config.BirdTimeout          = 180 -- 当超时时，小鸟将无法投递信件

Config.Blip =
{
    blipSprite              = 'blip_post_office', -- Config.Blip.blipSprite
    blipScale               = 0.2 -- Config.Blip.blipScale
}

-- prompt locations
Config.PostOfficeLocations =
{

    {name = '瓦伦丁邮局', location = 'valentine-postoffice',  coords = vector3(-178.9489, 626.83941, 114.08961), showblip = true}, -- valentine
    {name = '罗德镇邮局', location = 'rhodes-postoffice',     coords = vector3(1225.57, -1293.87, 76.91),        showblip = true}, -- rhodes
    {name = '圣丹尼斯邮局', location = 'saintdenis-postoffice', coords = vector3(2731.55, -1402.37, 46.18),        showblip = true}, -- saintdenis
    {name = '范霍恩港邮局', location = 'vanhorn-postoffice',    coords = vector3(2986.1557, 568.51599, 44.627922), showblip = true}, -- vanhorn
    {name = '安尼斯堡邮局', location = 'annesburg-postoffice',   coords = vector3(2939.5173, 1288.5345, 44.652824), showblip = true}, -- annsburg
    {name = '华莱士站邮局', location = 'wallace-postoffice',    coords = vector3(-1299.277, 401.93942, 95.383865), showblip = true}, -- wallace
    {name = '里格斯站邮局', location = 'riggs-postoffice',      coords = vector3(-1094.87, -575.608, 82.410873),   showblip = true}, -- riggs
    {name = '黑水镇邮局', location = 'flatneck-postoffice',   coords = vector3(-875.054, -1328.753, 43.958003),  showblip = true}, -- blackwater
    {name = '犰狳镇邮局', location = 'armadillo-postoffice',  coords = vector3(-3733.965, -2597.86, -12.92674),  showblip = true}, -- armadillo
    {name = '风滚草镇邮局', location = 'tumbleweed-postoffice', coords = vector3(-5487.083, -2936.11, -0.402813),  showblip = true}, -- tumbleweed
    {name = '草莓镇邮局', location = 'strawberry-postoffice', coords = vector3(-1765.084, -384.1582, 157.74119), showblip = true}, -- strawberry
}