local Translations = {
    notify = {
        notfound = "未找到玩家.",
        deleted = '角色已成功从服务器中删除',
        InvalidFormat = '这是无效格式.',
        WrongSecureWord = '安全词错误',
    },
    utils = {
        descriptions = "杀死/删除玩家角色（永久）",
        IDPlayer = "ID（玩家 ID）/CID（公民 ID）",
        WriteIn = "这里写一个ID或公民ID，取决于你选择哪一个。",
        kickreason = '正在投胎，请等待.......',
        SecretWord = '这里写下密语Wink',
    },
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})