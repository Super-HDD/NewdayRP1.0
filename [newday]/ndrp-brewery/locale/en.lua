local Translations = {
    error = {

    },
    success = {

    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        winery_menu='酿酒菜单',
        storage_menu='储藏库',
        system_name='酿酒厂',
        main_menu='主菜单',
        align='左上角'
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
