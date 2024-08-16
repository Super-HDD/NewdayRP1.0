Config = {}


Config.Debug = false -- 不用管


Config.StorageMaxWeight = 4000000 --这个 为 酒馆 存储 库 的 容量大小
Config.StorageMaxSlots = 1000 --这个为 酒馆 存储库 的 格子 数量
Config.DukeBoxDefaultVolume = 0.5 --这个为 酒馆 杜克盒子 的 默认音量
Config.DukeBoxRadius = 20 --这个为 杜克盒子的 声音范围

-----------------------------------------------------------------------------------

--下面两个 为 地图 图标 
Config.Blip = {
    blipSprite = 'blip_saloon',-- rdr2 图标名称 可以在这里找到 更多 图标https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures/blips
    blipScale = 0.2 --大小
}

--下面为 酒馆 名称 ，职位 ，位置 配置
--已为你 改成 建议配置了  
-- 已 把 地图 图标 和 菜单 主标题 名称 改成 读取 下面的 name 意味着 你只需 在 下面 name 后面填写 新增 酒馆 名称 就能达到 目的 --一步到位
-- location 是 职业名称 对应着 可以使用 指定位置 酒馆 的 职业 
-- coords 为 酒馆位置 需要 填写 vector3 位置 通常  tx 面板 复制下来的 位置为 vector4  需要把 最后 一维 删掉 才能用 比如 -- -313.5073, 805.80718, 118.98068, 999.99 只需 把 , 999.99(含最后一个逗号) 删掉 输入 到下面 vector3 括号里 就行
-- showblip = true 为显示图标 
-- 最后一个 showmarker 不用管 没卵用


-- 不需要 为 酒馆菜单 添加 新的内容的话 只需 把 新 酒馆 以下 信息 填写 下 就行 --一步到位

--别忘了 新增 或者 刚改完 好好 检查一遍 不要 少个 符号 或者 多个 莫名其妙的 符号
Config.SaloonTenderLocations = {
    {name = '丹尼斯吧酒馆',         location = 'stdenissaloontender1',      coords = vector3(2640.0005, -1225.2694, 53.3804), showblip = true, showmarker = true}, 
    {name = '黑水镇酒馆',         location = 'blasaloontender',      coords = vector3(-817.6622, -1318.1022, 43.6290), showblip = true, showmarker = true}, 
    {name = '罗德镇酒馆',         location = 'rhosaloontender',      coords = vector3(1340.2400, -1374.6765, 80.4306), showblip = true, showmarker = true}, 
    {name = '瓦伦丁酒馆',         location = 'valsaloontender',      coords = vector3(-313.1184, 804.8615, 118.9304), showblip = true, showmarker = true}, 
}

--Config.MusicPath='../../[standalone]/xsound/html/sounds/'
Config.MusicPath='./resources/[standalone]/xsound/html/sounds/'
Config.Music={}
Config.RecipeList={
    ['coffee'] ={
        name = 'coffee',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'kafeifen',  amount = 1 },     
        },
        txt='咖啡粉x1',
    },
}
