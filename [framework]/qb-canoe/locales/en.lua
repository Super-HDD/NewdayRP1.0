local Translations = {
    error = {
        cant_take_out_boat = '你不能在这里取出你的独木舟！',
         Boat_already_out = '你的独木舟已经出来了！',
         no_item = '您没有该物品！',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('error.horse_too_far')