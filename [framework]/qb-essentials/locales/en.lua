local Translations = {
    error = {
        var = 'text goes here',
    },
    success = {
            var = 'text goes here',
    },
    primary = {
            var = 'text goes here',
    },
    menu = {
            var = 'text goes here',
    },
    commands = {
        emoteMenu = 'Open emote menu.',
    },
    progressbar = {
            var = 'text goes here',
    },
    label = {
        take_a_drink = 'Take a Drink'
    },
    emotes = {
        title = ' 表情菜单',
actions = {
    mainMenu = '🚩 行动',
    secondMenu = '🚩 行动表情'
},
greeting = {
    mainMenu = '👋 打招呼',
    secondMenu = '👋 打招呼表情'
},
reaction = {
    mainMenu = '🎭 反应',
    secondMenu = '🎭 反应表情'
},
taunting = {
    mainMenu = '😡 嘲讽',
    secondMenu = '😡 嘲讽表情'
},
dancing = {
    mainMenu = '💃 跳舞',
    secondMenu = '💃 跳舞表情'
},
close = '❌ 退出'
    },
    log = {
        weapon_removed = '武器已移除!',
had_weapon_them_that_they_did_not_have = '** @staff ** ${firstname} ${lastname} 身上有一把他的背包里没有的武器：反作弊系统已经移除了该武器',
test_webhook = '测试Webhook',
webhook_setup_successfully = 'Webhook设置成功',
test_your_discord_webhook = '测试您的Discord Webhook以获取日志 (仅限管理员)'
    },
    afk = {
        will_kick = '您已进入离开状态，将在 ',
time_seconds = ' 秒内被踢出!',
time_minutes = ' 分钟内被踢出!'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
