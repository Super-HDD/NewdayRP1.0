local Translations = {
    error = {
        not_online = '玩家不在线',
no_player = '附近没有玩家',
no_firstaid = '你需要急救包',
no_bandage = '你需要绷带',
not_medic = '你不是医务人员',
    },
    success = {
        revived = '你让一个人复活了',
    },
    info = {
        revive_player_a = '复活玩家或自己（仅管理员）',
kill_player = '杀死玩家（仅管理员）',
player_id = '玩家ID(可以为空)',
blip_text = '医务人员警报 - %{text}',
new_call = '新的呼叫',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
