local Translations = {
    error = {
        crafting_failed_due_to_unlucky='很不幸，制作失败了',
        you_dont_have_the_required_items = "你没有所需的物品！",
    },
    success = {
        crafting_finished='制作完成',
        

    },
    primary = {
        var = 'text goes here',

    },
    menu = {
        open_musicbox='使用留声机',
        musicbox_title='留声机',
        musiclist_title='音乐列表'
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        crafting_a = '制作',
    },
    text = {
        var = 'text goes here',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
