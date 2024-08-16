local Translations = {
    error = {
        error_var = '错误',
    },
    success = {
        success_var = '成功',
    },
    primary = {
        primary_var = '主要',
    },
    menu = {
        menu_var = '传说动物狩猎',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
