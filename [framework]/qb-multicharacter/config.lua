Config = {}
Config.StartingApartment = false -- 启用/禁用初始公寓（请确保设置默认的生成坐标）
Config.Interior = vector3(-814.89, 181.95, 76.85) -- 加载角色预览的室内位置
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- 如果禁用了初始公寓，则使用这个默认生成坐标
Config.PedCoords = vector4(-813.97, 176.22, 76.74, -7.5) -- 在这些坐标创建预览角色
Config.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- 当您在选择角色时隐藏您的实际角色
Config.CamCoords = vector4(-813.46, 178.95, 76.85, 174.5) -- 角色预览屏幕的摄像机坐标

Config.DefaultNumberOfCharacters = 1 -- 定义默认角色的最大数量（默认最多可以定义5个角色）
Config.PlayersNumberOfCharacters = { -- 按照Rockstar许可证定义玩家角色的最大数量（您可以在服务器数据库的玩家表中找到这个许可证）
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
    { license = "license:52e8ccaeee81200dfbce7e50d1ab9e2873228850", numberOfChars = 3 }, --veronica
    { license = "license:1b239891313dd75cca01c74f7690fcca3128d602", numberOfChars = 2 }, --kevin
}