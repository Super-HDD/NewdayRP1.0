Config = {}

-------------------------- COMMANDS & FUNCTIONALITY

Config.FeedbackClientCommand = 'report' -- The command that the players use to report something

Config.FeedbackAdminCommand = 'reports' -- The command that the admins use to check the pendent feedbacks list

Config.FeedbackCooldown = 1 -- 反馈冷却时间（以分钟为单位）

-------------------------- 管理员权限

Config.ESX = false -- 如果使用ESX，请将此选项设置为true

-- 如果使用ESX，则不需要将任何标识符添加到Config.AdminList，因为它会通过您的玩家组（超级管理员，管理员，模特）检查您是否具有权限

-- 标识符类型：steam: | license: | xbl: | live: | discord: | fivem: | ip:

Config.AdminList = {
	'license:5aba446d2d44427c152fd59449fe1874f5ef95b4',
        'license:507553eeadcd5beec7cda0a3d5df571f9a5b286c',
        'license:1b239891313dd75cca01c74f7690fcca3128d602',
        'license:9ccac91ef4a37988fe549f78eb48767ab5d651ad',
        'license:ee4c931dc75db0f97bbd9e2ef373cc06bddd04ca',
        'license:a07fc4d29dd9425a556befc2c21df9feb6f195c7', 
	



}
-------------------------- DISCORD日志记录

-- 要设置您的Discord Webhook URL，请转到server.lua，第13行

Config.BotName = 'Penis Licker' -- 编写所需的机器人名称

Config.ServerName = 'London Network' -- 编写您的服务器名称

Config.IconURL = 'https://i.postimg.cc/J4G0RGhg/United-Gaming-icon2500.png' -- 插入您想要的图像链接

Config.DateFormat ='%d/%m/%Y [%X]' -- 要更改日期格式，请查看此网站-https://www.lua.org/pil/22.1.html

-- 要更改Webhook颜色，您需要设置颜色的十进制值，可以使用此网站来执行此操作-https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.NewFeedbackWebhookColor ='65352'
 
Config.AssistFeedbackWebhookColor ='16127'
 
Config.ConcludeFeedbackWebhookColor ='16711680'
 
Config.UserDcFeedbackWebhookColor ='255'

-- 好的？ 好的