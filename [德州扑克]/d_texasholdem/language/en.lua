Language["en"] = {
    --提示名称
    ["Title"] = "德州扑克",
    ["StartPrompt"] = "开始游戏",
    ["InfoPrompt"] = "规则",
    ["BetPrompt"] = "下注金额",
    ["PlaceBetPrompt"] = "下注",
    ["RdyToPlayPrompt"] = "准备",
    ["FoldPrompt"] = "弃牌",
    ["SurrenderPrompt"] = "认输",
    ["RebuyPrompt"] = "补充筹码",
    ["ChooseBlindPrompt"] = "小盲注：~t2~$~q~{AMOUNT}",
    ["ShowCardsPrompt"] = "显示手牌",
    ["StartMoney"] = "\n~t2~购买筹码金额：~q~",
    ["BetTextSet"] = "设置",
    ["BetTextCheck"] = "过牌",
    ["BetTextAllIn"] = "全押",
    ["BetTextCall"] = "跟注",
    ["BetTextRaise"] = "加注",
    --通知
    ["CantJoinTable"] = "~t8~很抱歉，扑克桌已经满员！~q~",
    ["ActionReminder"] = "~t8~轮到你行动了，否则你将被踢出桌子并失去下注的金额！~q~",
    ["ActionKick"] = "~t8~你已被踢出桌子...~q~",
    ["TakeAction"] = "~t8~采取行动~q~",
    ["NoBuyInMoney"] = "~t8~很遗憾，你没有足够的钱来入座！~q~",
    ["NoReBuyMoney"] = "~t8~很遗憾，你没有足够的钱。~q~",
    ["PlaceBet"] = "~t8~下注~q~",
    ["SetBlindValue"] = "~t8~选择小盲注的数值~q~",
    ["PlayerPlacedBet"] = "~t8~{PLAYER_NAME}~q~ 下注了~t6~{MONEY}$~q~ 放入了 ~t2~{POT_NAME}~q~。",
    ["PlayerFolded"] = "~t8~{PLAYER_NAME}~q~ 弃牌了。",
    ["PlayerChecked"] = "~t8~{PLAYER_NAME}~q~ 过牌了。",
    ["PlayerWinsPot"] = "~t8~{PLAYER_NAME}~q~ 赢得了 ~t6~${MONEY}~q~ 的 ~t2~{POT_NAME}~q~。",
    ["PlayerTiePot"] = "~t8~{PLAYER_NAME}~q~ 同时赢得了 ~t6~${MONEY}~q~ 的 ~t2~{POT_NAME}~q~。",
    ["GeneralPot"] = "底池",
    --Card stuff
    ["cardLabels"] = {
        ["2"] = {"two","twos"},
        ["3"] = {"three","threes"},
        ["4"] = {"four","fours"},
        ["5"] = {"five","fives"},
        ["6"] = {"six","sixes"},
        ["7"] = {"seven","sevens"},
        ["8"] = {"eight","eights"},
        ["9"] = {"nine","nines"},
        ["10"] ={"ten","tens"},
        ["J"] = {"jack","jacks"},
        ["Q"] = {"queen","queens"},
        ["K"] = {"king","kings"},
        ["A"] = {"ass","ass"}
    },
    --手牌等级标签
    ["RoyalFlush"] = "皇家同花顺",
    ["StraightFlush"] = "同花顺",
    ["FourOfaKind"] = "四条，{CARD_LABEL}", 
    ["FullHouse"] = "葫芦",
    ["Flush"] = "同花",
    ["Street"] = "顺子，最高牌 {CARD_LABEL}",
    ["ThreeOfaKind"] = "三条，{CARD_LABEL}",
    ["TwoPairs"] = "两对，{CARD_LABEL1} 和 {CARD_LABEL2}",
    ["OnePair"] = "一对 {CARD_LABEL}",
    ["HighCard"] = "{CARD_LABEL} 作为最高牌",
    --NUI stuff
    ["NoPlayerNamePrefix"] = "ID: {SERVER_ID}",
    ["MainPot"] = "底池",
    ["SidePot"] = "边池",
    ["PotWinning"] = "{CARD_LABEL}，赢得 ${MONEY}",
    ["PotTie"] = "{CARD_LABEL}，平局 ${MONEY}",
    ["WaitingForStart"] = "等待中...",
    ["NotRdy"] = "未准备好",
    ["IsRdy"] = "已准备好",
    ["PlayersMove"] = "轮到你...",
    ["OtherPlayersMove"] = "的回合...",
    ["WaitingForPlayer"] = "等待玩家中...",
    ["ShuffleDeck"] = "洗牌",
    ["WaitingForCards"] = "等待发牌...",
    ["MoveCheck"] = "让牌",
    ["MoveSet"] = "下注",
    ["MoveCall"] = "跟注",
    ["MoveFold"] = "弃牌",
    ["MoveRaise"] = "加注",
    ["MoveAllin"] = "全押",
    --Modal Stuff
    ["ModalClose"] = "关闭",
    ["ModalBack"] = "返回",
    ["ModalCards"] = "扑克牌",
    ["Rules"] = "扑克牌游戏的目标是在游戏结束时通过拥有最好的牌赢得底池。<br/><br/>"..
                "在几个回合中，牌将发放到桌子中央，玩家可以下注。<br/>"..
                "一个玩家的手牌由他们自己的两张牌和桌子中央的三张牌组成。"..
                "</div><hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>",
    ["CardValues"] = "<hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>"..
                "<div style='padding-bottom:20px;height:150px;'>组合：<br/>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>皇家同花顺</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.RoyalFlush.."</div>"..
                "<div style='float:left;width:40%;height:50px;line-height:50px;text-align:left'>同花顺</div><div style='float:right;width:60%;text-align:right'>"..TexasHoldemConfig.StraightFlush.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>四条</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.FourKind.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>葫芦</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.FullHouse.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>同花</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.Flush.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>顺子</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.Street.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>三条</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.ThreeKind.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>两对</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.TwoPairs.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>一对</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.OnePair.."</div>"..
                "<div style='float:left;width:40%;height:50px;line-height:50px;text-align:left'>最高牌</div><div style='float:right;width:60%;text-align:right'>"..TexasHoldemConfig.Ace.."</div>"..
                "<br/>"..
                "</div><hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>"
}