local Translations = {
    error = {
        you_are_already_goldpanning = '你已经在淘金了！',
        you_are_mounted = '你骑着马时无法这么做！',
    },
    success = {
        var = 'text goes here',
    },
    primary = {
        you_need_the_river_to_goldpan = '你需要在河边淘金',
not_much_this_pan = '这次盘子里没多少金子',
looks_like_good_gold = '看起来是好的金子',
gold_fever_jackpot = '淘金狂热大奖..',
no_gold_this_time = '这次没有找到金子..',
    },
    menu = {
        var = 'text goes here',
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
