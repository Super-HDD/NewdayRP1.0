Config = {}

-- ////////////////////// 安定剂设置 ////////////// -------------
Config.UseRagdoll = true -- 如果你想要让被麻醉的玩家倒地
Config.TranquilizeChance = 2 -- 当耐力值降为0时，有1/2的概率让玩家晕倒
Config.TranquilizerTime = 15 * 1000 -- 在晕倒前，玩家经历醉酒效果的时间
Config.TranquilizedTime = 60 * 1000 -- 玩家晕倒的持续时间
Config.ScreenEffect = "playerdrugshalluc01"
-- //////////////////////////////////////////////////////////////////////////


-- /////////////////// Webhook配置 ///////////////////////////

Config.UseWebhook = true -- 当有人更换皮肤时，是否发送日志？
Config.DiscordWebHook = "在这里插入Webhook链接" -- 你的Discord日志的Webhook链接。
Config.DiscordColor = 4372213 -- 蓝色的十进制值。
Config.DiscordName = "Cobra-Blackout"
Config.DiscordFooter = "Cobra scripts 2023 all rights reserved"

-- //////////////////////////////////////////////////////////////////////////