Config = {}

-- blip settings
Config.Blip = {
    blipName = '城镇政务厅', -- Config.Blip.blipName
    blipSprite = 'blip_town', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

Config.TownHallLocations = {
    -- town hall locations
    { name = '瓦伦丁市政厅', location = 'VALENTINE-townhall', coords = vector3(-262.8333, 762.4367, 118.15124), showblip = true, showmarker = true }, 
    { name = '圣丹尼斯市政厅', location = 'SAINTDENIS-townhall', coords = vector3(2531.7854, -1202.3481, 53.6328), showblip = true, showmarker = true }, 
    { name = '黑水镇市政厅', location = 'BLACKWATER-townhall', coords = vector3(-763.4799, -1454.2567, 55.4458), showblip = true, showmarker = true }, 


}

Config.Jobs = { -- not job must be in : qr-core -> shared -> jobs
    { job = 'farmer', lable = '农夫', description = '休闲养生，与世无争' },
    { job = 'unemployed', lable = '自由职业者', description = '喜欢做自己的事' },
   -- { job = 'cinema', lable = '亲爱的观众朋友', description = '喜欢看电影吗' }, 
}

