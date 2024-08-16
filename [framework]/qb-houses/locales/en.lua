local Translations = {
    error = {
        not_enough_replicas = "你没有足够的现金！",
    },
    success = {
        success_var = 'Example Text',
    },
    primary = {
        primary_var = 'Example Text',
    },
    menu = {
        menu_var = 'Example Text',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
