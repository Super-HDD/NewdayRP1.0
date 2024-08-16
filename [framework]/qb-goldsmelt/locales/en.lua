local Translations = {
    error = {
        you_donthave_the_required_items = "你没有所需的物品!",
    },
    success = {
        smelting_finished = '冶炼完毕',
    },
    primary = {
        gold_smelt_deployed = '黄金冶炼部署',
    },
    menu = {
        smelting_menu = '☢️ | 熔炼菜单',
        close_menu = '❌ | 关闭菜单',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        smelting_a = '熔炼一个',
    },
    text = {
        gold_bar = '金条',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
