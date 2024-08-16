local Translations =
{
    desc =
    {
        ["prompt_desc"] = "鸟信",
        ["prompt_button"] = "取回信件",
        ["blip_name"] = "鸟信",
        ["send_button_free"] = "发送信件",
        ["send_button_paid"] = "支付 $%{lPrice} 发送信件",
        ["send_message_header"] = "发送信件",
        ["recipient"] = "收件人",
        ["subject"] = "主题",
        ["message"] = "在这里写下你的信息！",
        ["message_prefix"] = "鸟信"
    },
    info =
    {
        ["bird_approaching"] = "有一只鸟信正在接近您！",
["wait_for_bird"] = "请等待鸟信接近您！",
["inside_building"] = "请离开建筑物，鸟信无法到达您！"
    },
    error =
    {
        ["send_to_self"] = "您不能给自己发送信件！",
["player_unavailable"] = "目标人物不在该区域内！",
["player_on_horse"] = "请先下马！",
["cancel_send"] = "发送信件已取消！",
["insufficient_balance"] = "您的现金不足！",
["no_message"] = "没有可用的消息！",
["delete_fail"] = "删除消息失败！",
["delivery_fail1"] = "您决定不取信件了！",
["delivery_fail2"] = "信鸽累了，决定飞走了！",
["delivery_fail3"] = "您可以从当地邮局取回信件！",
["send_receiving"] = "您不能在等待收到鸟信时写信！",
["wait_between_send"] = "请在发送另一封信件前等待 %{tDelay} 秒！"
    },
    success =
    {
        ["letter_delivered"] = "成功向 %{pName} 发送了信件！",
["delete_success"] = "消息删除成功！"
    }
}

Lang = Locale:new
({
    phrases = Translations,
    warnOnMissing = true
})