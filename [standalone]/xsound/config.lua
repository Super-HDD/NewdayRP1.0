
config = {}

-- 玩家位置更新的频率（以秒为单位）
config.RefreshTime = 300

-- 与交互相关的默认声音格式
config.interact_sound_file = "ogg"

-- 是否启用模拟器？
config.interact_sound_enable = false

-- 在开始更新位置之前，玩家必须离声音多近（以游戏内单位计算）
config.distanceBeforeUpdatingPos = 40

-- 消息列表
config.Messages = {
    ["streamer_on"]  = "流媒体模式已开启。从现在开始，您将听不到任何音乐/声音。",
    ["streamer_off"] = "流媒体模式已关闭。从现在开始，您将能够听到其他玩家可能播放的音乐。",

    ["no_permission"] = "您无法使用此命令，因为您没有权限！",
}

-- 插件列表
-- True/False 表示启用/禁用
config.AddonList = {
    crewPhone = false,
}