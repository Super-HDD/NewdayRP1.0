Config = Config or {}

Config.Debug = true
Config.FarmCows = {}

Config.BlipBuy = {
    blipName = '奶牛贩卖点', 
    blipSprite = 423351566, 
    blipScale = 0.2 
}

Config.BlipCowshed = {
    blipName = '牛棚', 
    blipSprite = -1179229323, 
    blipScale = 0.2 
}

Config.Milk = 'niunai' --这里是获取牛奶的项目，您可以将其更改为您自己的项目
Config.RequiresKey = false --是否需要使用钥匙打开牛棚
Config.CowshedKey = 'cowshedkey' --打开牛棚的物品
Config.MilkCooldown = 120 --牛可重新挤奶的时间。分钟
Config.WaitMilking = 60000 --挤奶动画时间
Config.CowPrice = 250 --牛的价格
Config.WaitStateMinus = 864000 --以毫秒为单位，牛状态减少1％的时间。 864000 = 从100到0在24小时内
Config.MinDelay = 5 --改善时间的最小值，以分钟为单位
Config.MaxDelay = 10 --改善时间的最大值，以分钟为单位

--Config.Milk = 'milk' --here we get milk, you can change it to your own item
--Config.RequiresKey = true -- Do I need to use a key to open the Cowshed
--Config.CowshedKey = 'cowshedkey' -- item to open Cowshed
--Config.MilkCooldown = 120 -- time after which a cow can be re-milked. minutes
--Config.WaitMilking = 60000 -- milking animation time
--Config.CowPrice = 250 --Price cow
--Config.WaitStateMinus = 864000 -- the time after which the state of the cow decreases by 1% in milliseconds. 864000 = from 100 to 0 in 24 hours
--Config.MinDelay = 5 -- minimum time to improve in minutes
--Config.MaxDelay = 10 --maximum time to improve in minutes  


--cow seller
Config.Cow = {
    {name = '奶牛贩卖点', location = 'buycow1',  coords = vector3(1404.3058, 280.5532, 89.2616 -0.8),  showblip = true}, --annesburg
}

--menu Cowshed. you can add more, but then be sure to add to Config.CowZone
Config.MenuCowshed = {
    {name = '牛棚', location = 'cowshed1',  coords = vector3(1822.1469, -54.7049, 58.0874),  showblip = true},
	{name = '牛棚', location = 'cowshed2',  coords = vector3(3009.0032, 2202.3442, 165.9195),  showblip = true},
	{name = '牛棚', location = 'cowshed3',  coords = vector3(-840.7876, 357.3697, 96.9096),  showblip = true}, 
	{name = '牛棚', location = 'cowshed4',  coords = vector3(1379.7551, -851.2039, 68.9721),  showblip = true},
}

--zone Cowshed.
Config.CowZone = {
    vector3(1822.7917, -48.8627, 58.2550 - 0.8), -- cowshed1
	vector3(3013.6492, 2200.6182, 165.9599 - 0.8), -- cowshed2
	vector3(-845.6230, 365.3882, 97.1857 - 0.8), -- cowshed3
	vector3(1378.1912, -840.9808, 69.8247 - 0.8), -- cowshed4
}
