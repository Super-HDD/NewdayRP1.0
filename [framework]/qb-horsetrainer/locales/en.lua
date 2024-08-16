local Translations = {
    error = {
        horse_brush_needed = '需要驯马刷！',
         not_horse_trainer = '你不是驯马师！',
         horse_too_clean = '马现在太干净了！',
         carrot_needed = '喂马需要胡萝卜！',
         horse_too_full = '马现在太满了！',
         horse_too_far = '请靠近你的马！'
    },
    success = {
        xp_now = ' EXP 现在 ',
    },
    info = {
        --var = 'text goes here',
    },
    menu = {
        --var = 'text goes here',
    },
    commands = {
        --var = 'text goes here',
    },
    progressbar = {
        --var = 'text goes here',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('error.horse_too_full')