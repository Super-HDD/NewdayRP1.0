Config = {}

-- 优先级列表可以是任何标识符。（十六进制SteamID，SteamID32，IP地址）Integer = 对其他优先级用户的权力
-- 很多SteamID转换网站现在都有问题，会给出错误的SteamID。我使用https://steamid.xyz/没有任何问题。
-- 你也可以通过API给予优先级，阅读示例/自述文件。
Config.Priority = {
    ["STEAM_0:1:0000####"] = 1,
    ["steam:110000######"] = 25,
    ["ip:127.0.0.0"] = 85
}

-- 要求玩家运行Steam客户端
Config.RequireSteam = false

-- 仅限"白名单"服务器
Config.PriorityOnly = false

-- 禁用硬连接限制，应保持为true
Config.DisableHardCap = true

-- 如果玩家在__秒内未加载完成，则断开连接；如果有许多下载内容，可能需要增加此值。
-- 我还没有找到一种简单的方法来确定玩家是仍在连接和下载内容，还是在加载屏幕中挂起。
-- 如果此值太低，可能会导致会话提供程序错误，因为已删除的玩家可能仍在连接，将允许下一个人通过...
-- 即使服务器已满，10分钟应该足够了
Config.ConnectTimeOut = 600

-- 如果服务器在__秒内没有收到来自玩家的消息，则将其从队列中删除
Config.QueueTimeOut = 90

-- 当玩家断开连接和开始加载时，给予他们临时优先权
Config.EnableGrace = false

-- 优先权权力时间
Config.GracePower = 5

-- 等待时间的持续时间（以秒为单位）
Config.GraceTime = 480

Config.AntiSpam = false
Config.AntiSpamTimer = 30
Config.PleaseWait = "请等待 %f 秒。NewdayRoleplay连接将自动开始!"

-- 在资源启动时，玩家可以加入队列，但不会让他们在__毫秒内加入
-- 这将让队列稳定下来，让其他资源完成初始化
Config.JoinDelay = 30000

-- 显示连接消息中有临时优先级的人数
Config.ShowTemp = ture  


Config.Language = {
    joining = "\xF0\x9F\x8E\x89加入中...",  -- 正在加入...
    connecting = "\xE2\x8F\xB3连接中...",  -- 正在连接...
    idrr = "\xE2\x9D\x97[队列] 错误: 无法检索到您的任何ID,请尝试重新启动。",  -- 错误：无法检索到您的任何ID，请尝试重新启动。
    err = "\xE2\x9D\x97[队列] 发生错误",  -- 错误：发生错误
    pos = "\xF0\x9F\x90\x8C您在队列中的位置: %d/%d \xF0\x9F\x95\x9C%s",  -- 您在队列中的位置：%d/%d %s
    connectingerr = "\xE2\x9D\x97[队列] 错误: 将您添加到连接列表时发生错误",  -- 错误：将您添加到连接列表时发生错误
    timedout = "\xE2\x9D\x97[队列] 错误: 超时？",  -- 错误：超时？
    wlonly = "\xE2\x9D\x97[队列] 您必须在白名单中才能加入此服务器",  -- 您必须在白名单中才能加入此服务器
    steam = "\xE2\x9D\x97 [队列] 错误: 必须运行 Steam"  -- 错误：必须运行 Steam
}
