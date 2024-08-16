Language["de"] = {
    --prompt names
    ["Title"] = "Texas Holdem",
    ["StartPrompt"] = "Spielen",
    ["InfoPrompt"] = "Regeln",
    ["BetPrompt"] = "Betrag",
    ["PlaceBetPrompt"] = "Setzen",
    ["RdyToPlayPrompt"] = "Bereit",
    ["FoldPrompt"] = "Passen",
    ["SurrenderPrompt"] = "Aufgeben",
    ["RebuyPrompt"] = "Neu einkaufen",
    ["ChooseBlindPrompt"] = "Small Blind: ~t2~$~q~{AMOUNT}",
    ["ShowCardsPrompt"] = "Karten",
    ["StartMoney"] = "\n~t2~Startgeld: ~q~",
    ["BetTextSet"] = "Setzen",
    ["BetTextCheck"] = "Schieben",
    ["BetTextAllIn"] = "All-In",
    ["BetTextCall"] = "Mitgehen",
    ["BetTextRaise"] = "Erhöhen",
    --Notifications
    ["CantJoinTable"] = "~t8~Es läuft schon ein Spiel oder es ist kein Sitzplatz mehr frei am Tisch!~q~",
    ["ActionReminder"] = "~t8~Mach einen Zug, oder du wirst vom Tisch verwiesen und verlierst dein gesetztes Geld!~q~",
    ["ActionKick"] = "~t8~Du wurdest vom Tisch verwiesen...~q~",
    ["TakeAction"] = "~t8~Wähle eine Aktion aus~q~",
    ["NoBuyInMoney"] = "~t8~Leider hast du nicht genug Bargeld bei dir, um am Tisch Platz zu nehmen!~q~",
    ["NoReBuyMoney"] = "~t8~Leider hast du nicht genug Bargeld bei dir.~q~",
    ["PlaceBet"] = "~t8~Mache deinen Einsatz~q~",
    ["SetBlindValue"] = "~t8~Lege die Höhe des small Blinds fest!~q~",
    ["PlayerPlacedBet"] = "~t8~{PLAYER_NAME}~q~ wirft ~t6~${MONEY}~q~ in den ~t2~{POT_NAME}~q~.",
    ["PlayerFolded"] = "~t8~{PLAYER_NAME}~q~ hat gepasst.",
    ["PlayerChecked"] = "~t8~{PLAYER_NAME}~q~ hat geschoben.",
    ["PlayerWinsPot"] = "~t8~{PLAYER_NAME}~q~ gewann ~t6~${MONEY}~q~ aus dem ~t2~{POT_NAME}~q~.",
    ["PlayerTiePot"] = "~t8~{PLAYER_NAME}~q~ gewannen jeweils ~t6~${MONEY}~q~ aus dem ~t2~{POT_NAME}~q~.",
    ["GeneralPot"] = "Pot",
    --Card stuff
    ["cardLabels"] = {
        ["2"] = {"Zwei","Zweien"},
        ["3"] = {"Drei","Dreien"},
        ["4"] = {"Vier","Vieren"},
        ["5"] = {"Fünf","Fünfen"},
        ["6"] = {"Sechs","Sechsen"},
        ["7"] = {"Sieben","Siebenen"},
        ["8"] = {"Acht","Achten"},
        ["9"] = {"Neun","Neunen"},
        ["10"] ={"Zehn","Zehnen"},
        ["J"] = {"Bube","Buben"},
        ["Q"] = {"Dame","Damen"},
        ["K"] = {"König","Könige"},
        ["A"] = {"Ass","Asse"}
    },
    --labels for hand ranks
    ["RoyalFlush"] = "Royal Flush",
    ["StraightFlush"] = "Straight Flush",
    ["FourOfaKind"] = "Vierling, {CARD_LABEL}",
    ["FullHouse"] = "Full House",
    ["Flush"] = "Flush",
    ["Street"] = "Straße, höchste Karte {CARD_LABEL}",
    ["ThreeOfaKind"] = "Drilling, {CARD_LABEL}",
    ["TwoPairs"] = "Zwei Paare, {CARD_LABEL1} und {CARD_LABEL2}",
    ["OnePair"] = "Ein Paar {CARD_LABEL}",
    ["HighCard"] = "{CARD_LABEL} als höchste Karte",
    --NUI stuff
    ["NoPlayerNamePrefix"] = "Spieler Id: {SERVER_ID}",
    ["MainPot"] = "Hauptpot",
    ["SidePot"] = "Nebenpot",
    ["PotWinning"] = "{CARD_LABEL}, gewonnen ${MONEY}",
    ["PotTie"] = "{CARD_LABEL}, unentschieden ${MONEY}",
    ["WaitingForStart"] = "Warten…",
    ["NotRdy"] = "Nicht Bereit",
    ["IsRdy"] = "Bereit",
    ["PlayersMove"] = "Du bist dran…",
    ["OtherPlayersMove"] = " ist am Zug…",
    ["WaitingForPlayer"] = "Warten auf Mitspieler…",
    ["ShuffleDeck"] = "Mischt die Karten...",
    ["WaitingForCards"] = "Warten auf Karten…",
    ["MoveCheck"] = "geschoben",
    ["MoveSet"] = "gesetzt",
    ["MoveCall"] = "mitgegangen",
    ["MoveFold"] = "gepasst",
    ["MoveRaise"] = "erhöht",
    ["MoveAllin"] = "All-In",
    --Modal Stuff
    ["ModalClose"] = "Schließen",
    ["ModalBack"] = "Zurück",
    ["ModalCards"] = "Karten",
    ["Rules"] = "Das Ziel beim Pokern ist es, den Pot zu gewinnen, indem man am Ende des Spiels die besten Karten hat.<br/><br/>"..
                "Über mehrere Runden hinweg werden Karten in die Tischmitte gegeben und die Spieler können Ihre Wett-Einsätze platzieren.<br/>"..
                "Das Blatt eines Spielers ist die Kombination aus 5 Karten, die 2 aus der eigenen Hand und 3 zusätzliche aus der Tischmitte."..
                "</div><hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>",
    ["CardValues"] = "<hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>"..
                "<div style='padding-bottom:20px;height:150px;'>Kombinationen:<br/>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Royal Flush</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.RoyalFlush.."</div>"..
                "<div style='float:left;width:40%;height:50px;line-height:50px;text-align:left'>Straight Flush</div><div style='float:right;width:60%;text-align:right'>"..TexasHoldemConfig.StraightFlush.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Vierling</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.FourKind.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Full House</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.FullHouse.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Flush</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.Flush.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Straße</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.Street.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Drilling</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.ThreeKind.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Zwei Paare</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.TwoPairs.."</div>"..
                "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Ein Paar</div><div style='float:right;width:70%;text-align:right'>"..TexasHoldemConfig.OnePair.."</div>"..
                "<div style='float:left;width:40%;height:50px;line-height:50px;text-align:left'>Höchste Karte</div><div style='float:right;width:60%;text-align:right'>"..TexasHoldemConfig.Ace.."</div>"..
                "<br/>"..
                "</div><hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>",
}