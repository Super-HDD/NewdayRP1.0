local Translations = {
    notifications = {
        enoughmoney = "你没有足够的钱.",
        FullInventory = "您的库存已满，您的钱已存入银行.",
        recieved = "你收到 ",
        currency = "$",
        paid = "您已支付 "
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
