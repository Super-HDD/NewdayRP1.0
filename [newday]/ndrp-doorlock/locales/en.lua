local Translations = {
    error = {
        nokey = "您没有钥匙!",
    },
    success = { 
        
    },
    menu={
        main_menu='钥匙列表',
        align='左上角',
        system_name='钥匙串',
    },
    info = {
        unlocked = "解锁中...",
        unlocking = "解锁完成！",
        locking = "锁定完成！",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
