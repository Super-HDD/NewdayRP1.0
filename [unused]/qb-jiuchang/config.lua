Config = {}

-- debug
Config.Debug = false

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.DukeBoxDefaultVolume = 0.5 -- music default volume 0.01 - 1
Config.DukeBoxRadius = 40 -- music radius

-----------------------------------------------------------------------------------

-- job blip
Config.Blip = {
    blipName = '圣丹尼斯艾丁格酒厂', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- job prompt locations
Config.BreweryLocations = {
    {name = '圣丹尼斯艾丁格酒厂(工厂)',         location = 'aidingge',      coords = vector3(2645.7507, -1159.4243, 30.9509), showblip = true, showmarker = true}, 
}
