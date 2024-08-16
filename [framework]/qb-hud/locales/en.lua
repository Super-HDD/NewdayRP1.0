local Translations = {
    error = {
        
    },
    success = {
        
    },
    info = {
        getstress = "你感到压力很大",
        thirsty = "你有点渴",
        relaxing = "你正在放松",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
