local Translations = {
    notifications = {
        enoughmoney = "Nemáš dostatek peněz.",
        FullInventory = "Tvůj inventář byl plný, proto jsme převedli tvé prostředky na bankovní účet.",
        recieved = "Obdržel jsi ",
        currency = "$",
        paid = "Zaplatil jsi "
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
