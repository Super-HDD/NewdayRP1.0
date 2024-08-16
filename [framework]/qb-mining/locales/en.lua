local Translations = {
    error = {
        you_dont_have_pickaxe = "你没有矿镐！",
         Something_went_wrong = '出了点问题！',
    },
    success = {
        your_pickaxe_broke = '你的矿稿坏了！',
    },
    primary = {
        you_are_busy_the_moment = '你此刻很忙！',
         small_haul_time = '获得了少量矿物！',
         medium_haul_this_time = '获得了中量矿物！',
         laargq_haul_this_time = '获得了大量矿物！',
    },
    menu = {
        start = '开始 ',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        var = 'text goes here',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
