Config = {}
--------------------------------
-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- [员工团体]

Config.StaffGroups = {
    'god',
    'admin'
}

Config.EnableReportCommand = true

Config.ReportCommand = 'report'

--------------------------------
-- [清除玩家聊天]

Config.AllowPlayersToClearTheirChat = true

Config.ClearChatCommand = 'clear'

--------------------------------
-- [职员]

Config.EnableStaffCommand = true

Config.StaffCommand = 'announce'

Config.AllowStaffsToClearEveryonesChat = true

Config.ClearEveryonesChatCommand = 'clearall'

-- [仅限员工聊天]

Config.EnableStaffOnlyCommand = true

Config.StaffOnlyCommand = 'admin'

--------------------------------
-- [广告]

Config.EnableAdvertisementCommand = true

Config.AdvertisementCommand = 'advert'

Config.AdvertisementPrice = 1

Config.AdvertisementCooldown = 1 -- 分钟后

--------------------------------

-- [瓦伦丁]

Config.EnableValentineCommand = true

Config.ValentineCommand = 'valentine'

Config.ValentineJobName = 'valentine'

--------------------------------
-- [罗德]

Config.EnableRhodesCommand = true

Config.RhodesCommand = 'rhodes'

Config.RhodesJobName = 'rhodes'


-- [whisper]

Config.EnableWhisperCommand = true

Config.WhisperCommand = 'whisper'

Config.WhisperDistance = 10