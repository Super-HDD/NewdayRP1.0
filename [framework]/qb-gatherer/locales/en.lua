local Translations = {
    error = {
        you_dont_have_an_axe = "你没有斧头！",
        your_axe_is_broken = '你的斧头坏了！',
    },
    success = {
        you_chopped_wood = '你砍了 %{givewood} 木头',
    },
    primary = {
        you_are_busy_at_the_moment = '你现在很忙!',
    },
    menu = {
        start_choping  = '开始砍',
    },
    commands = {
            var = 'text goes here',
    },
    progressbar = {
            var = 'text goes here',
    },
    text = {
        tree = '树'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
