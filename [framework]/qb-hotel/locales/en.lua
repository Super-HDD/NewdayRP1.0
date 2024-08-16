local Translations = {
    error = {
        not_enought_cash_to_rent_room = '现金不足，无法租房!',
        you_already_have_room_here = '你已经在这里有一间房间!',
        you_dont_have_room_here = "你在这里没有房间!",
        not_enough_cash = "现金不足，无法购买!",
    },
    success = {
        you_rented_room = '你租了房间 ',
        room_credit_added_for = '房间信用增加 ',
    },
    primary = {
        your_credit_is_now = '你的信用现在是 $'
    },
    menu = {
        open = '打开 ',
        check_in = '办理入住',
        rent_room_deposit = '租一间房 ($ %{startCredit} 押金)',
        close_menu = '关闭菜单',
        room_menu = '房间菜单',
        hotel_room = '酒店房间: ',
        add_credit = '充值',
        wardrobe = '衣柜',
        room_locker = '房间储物柜',
        leave_room = '离开房间',
        add_credit_room = '给房间充值 ',
        room = '房间 ',
    },
    text = {
        current_credit = '当前余额 $',
        amount = '金额 ($)',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        var = 'text goes here',
    },
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
