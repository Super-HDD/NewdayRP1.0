local Translations = {
    error = {
        not_give = "无法将物品给予指定的ID。",
        givecash = "使用方法 /givecash [ID] [金额]",
        wrong_id = "错误的ID。",
        dead = "你死了，哈哈。",
        too_far_away = "你离得太远了，哈哈。",
        not_enough = "你没有足够的数量。",
        invalid_amount = "给定的金额无效。"
    },
    success = {
        debit_card = "你已成功订购了一张借记卡。",
cash_deposit = "你成功存入了 %{value} 现金。",
cash_withdrawal = "你成功取出了 %{value} 现金。",
updated_pin = "你已成功更新了借记卡密码。",
savings_deposit = "你成功存入了 %{value} 储蓄。",
savings_withdrawal = "你成功取出了 %{value} 储蓄。",
opened_savings = "你成功开设了一个储蓄账户。",
give_cash = "成功给予 ID %{id} %{cash} 现金。",
received_cash = "成功从 ID %{id} 收到 %{cash} 现金。"
    },
    info = {
        bank_blip = "银行",
access_bank_target = "进入银行",
access_bank_key = "[E] - 进入银行",
current_to_savings = "将活期账户转入储蓄账户",
savings_to_current = "将储蓄账户转入活期账户",
deposit = "将 %{amount} 存入活期账户",
withdraw = "从活期账户取出 %{amount}"
    },
    command = {
        givecash = "给玩家现金."
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
