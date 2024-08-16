local Translations = {
    error = {

    },
    success = {

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
        crafting_a = '制作一个 ',
    },
    text = {
        var = 'text goes here',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
