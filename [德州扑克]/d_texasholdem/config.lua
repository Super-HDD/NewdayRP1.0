UsedLang = "en" -- make sure your language is added in the ./language folder
-- DO NOT CHANGE THESE
Language = {}
TexasHoldemConfig = {}
TexasHoldemConfig.Decks = 1
TexasHoldemConfig.Cards = {2,3,4,5,6,7,8,9,10,"J","Q","K","A"}
TexasHoldemConfig.Suits = {"♦","♤","♥","♧"}
TexasHoldemConfig.Ace = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_a.png' style='height: 48px'/>"
TexasHoldemConfig.RoyalFlush = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_a.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_k.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_q.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_j.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_10.png' style='height: 48px'/>"
TexasHoldemConfig.StraightFlush = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_5.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_6.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_7.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_8.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_9.png' style='height: 48px'/>"
TexasHoldemConfig.FourKind = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/clubs_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_j.png' style='height: 48px'/>"
TexasHoldemConfig.FullHouse = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_6.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_6.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_6.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/clubs_3.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_3.png' style='height: 48px'/>"
TexasHoldemConfig.Flush = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_9.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_2.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_6.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_5.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_q.png' style='height: 48px'/>"
TexasHoldemConfig.Street = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_9.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/clubs_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_j.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_q.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_k.png' style='height: 48px'/>"
TexasHoldemConfig.ThreeKind = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_2.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_2.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_2.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_4.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_7.png' style='height: 48px'/>"
TexasHoldemConfig.TwoPairs = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_4.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_4.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_8.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_8.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_a.png' style='height: 48px'/>"
TexasHoldemConfig.OnePair = "<img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_7.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_7.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/diamonds_a.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/spades_10.png' style='height: 48px'/><img src='nui://d_texasholdem/html/img/cards/playing_cards_01/hearts_3.png' style='height: 48px'/>"
-- END DO NOT CHANGE THESE
TexasHoldemConfig.Framework = "custom" --decide which framework u use (vorp/vorp2/redemrp/redemrp2/custom)
TexasHoldemConfig.Logmanager = false
TexasHoldemConfig.ConsoleMSG = false --turn on prints
TexasHoldemConfig.HoldToSeeCards = false --decide if you want a "hold to see" or "click to see" cards function
TexasHoldemConfig.UsePlayerName = true --decide if the player name or the server id with a prefix should be displayed / Prefix setup in language file "NoPlayerNamePrefix"
TexasHoldemConfig.UsePlayerFullName = true --use only firstname or first and last name | only if TexasHoldemConfig.UsePlayerName is true
TexasHoldemConfig.StartKey = 0xEB2AC491 --R
TexasHoldemConfig.InfoKey = 0x1ECA87D4 --Q
TexasHoldemConfig.FoldKey = 0xD596CFB0 -- F
TexasHoldemConfig.SurrenderKey = 0x156F7119 --Backspace
TexasHoldemConfig.BetUKey = 0x6319DB71 -- ARROW UP
TexasHoldemConfig.BetDKey = 0x05CA7C52 -- ARROW DOWN
TexasHoldemConfig.PlaceBetKey = 0xC7B5340A -- ENTER
TexasHoldemConfig.RdyToPlayKey = 0xC7B5340A -- ENTER
TexasHoldemConfig.RebuyKey = 0xEB2AC491 --R
TexasHoldemConfig.CardsKey = 0x07B8BEAF -- Left Click
TexasHoldemConfig.ComCardsKey = 0xC13A6564 -- Right Click
TexasHoldemConfig.TipTime = 3500 --timer for notification events
TexasHoldemConfig.ActionTimer = 120 --timer for player input | kicks players if player wont react on his/her turn until ActionTimer * 2
TexasHoldemConfig.Locations = {
    ["Valentine"] = {
        showBlip = 75,
        blipSprite = 1243830185,
        blipLocation = {x = -304.53515625, y = 801.1351928710938, z = 117.97854614257812, h = 0.0},
        tblLod = 15,
        tblCoords = {x = -304.53515625, y = 801.1351928710938, z = 117.97854614257812, h = 117.97},
        Name = "Texas Hold'em",
        promptLocation = {x = -304.53515625, y = 801.1351928710938, z = 117.97854614257812, h = 0.0},
        promptRadius = 2.1,
        deckStyle = 4,
        buyIn = 2.5,
        smallBlind = 0.02,
        limitHoldem = false,
        seats = {
            [1] = {x=-304.22540283203125, y=799.9967041015625, z=117.98006439208984, h=-165.00001525878906},  
            [2] = {x=-305.36395263671875, y=800.2947998046875, z=117.98006439208984, h=135.0000457763672},
            [3] = {x=-305.6805114746094, y=801.4326782226562, z=117.98006439208984, h=74.99998474121094},
            [4] = {x=-304.8514404296875, y=802.2727661132812, z=117.98006439208984, h=14.99997615814209},
            [5] = {x=-303.7059631347656, y=801.9777221679688, z=117.98006439208984, h=-44.99993896484375},
            [6] = {x=-303.3963623046875, y=800.8367919921875, z=117.98006439208984, h=-105.00000762939453}
        },
        props = {
            ["deck"] = {model= "p_cardssplit01x_val", x= -304.4264221191406, y= 800.7904052734375, z= 118.78, h = 28.7154598236084}
        }, 
        delete = {}
    },
    ["Tumbleweed"] = {
        showBlip = 100,
        blipSprite = 1243830185,
        blipLocation = {x = -5510.39453125, y = -2913.763671875, z = 0.63532996177673, h = 30.0},
        tblLod = 15,
        tblCoords = {x = -5510.39453125, y = -2913.763671875, z = 0.63532996177673, h = 30.0},
        Name = "Texas Hold'em",
        promptLocation = {x = -5510.39453125, y = -2913.763671875, z = 0.63532996177673, h = 30.0},
        promptRadius = 2.1,
        deckStyle = 2,
        buyIn = 25.0,
        smallBlind = 0.1,
        limitHoldem = 5.0,
        seats = {
            [1] = {x=-5511.030761718, y=-2912.75854492, z=0.63760805130004, h=30.0},
            [2] = {x=-5509.816894531, y=-2912.76171875, z=0.63760805130004, h=-25.0},
            [3] = {x=-5509.076171875, y=-2913.73657226, z=0.63760805130004, h=-85.0},
            [4] = {x=-5509.748535156, y=-2914.83959960, z=0.63760805130004, h=-148.0},
            [5] = {x=-5510.962402343, y=-2914.77026367, z=0.63760805130004, h=150.0},
            [6] = {x=-5511.638671875, y=-2913.77880859, z=0.63760805130004, h=95.0}
        },
        props = {
            ["deck"] = {model= "p_cardssplit01x", x= -5510.96, y=-2913.46, z=1.44, h=-118.09}
        }, 
        delete = {}
    },
    ["Blackwater"] = {
        showBlip = 75,
        blipSprite = 1243830185,
        blipLocation = {x = -813.2147827148438, y = -1316.54736328125, z = 42.67874908447265, h = 60.0},
        tblLod = 15,
        tblCoords = {x = -813.2147827148438, y = -1316.54736328125, z = 42.67874908447265, h = 60.0},
        Name = "Texas Hold'em",
        promptLocation = {x = -813.2147827148438, y = -1316.54736328125, z = 42.67874908447265, h = 60.0},
        promptRadius = 2.1,
        deckStyle = 5,
        buyIn = 5.0,
        smallBlind = 0.04,
        limitHoldem = false,
        seats = {
            [1] = {x=-814.27996826, y=-1317.16235351, z=42.67876052856445, h=119.999},
            [2] = {x=-814.28009033, y=-1315.93249511, z=42.67867279052734, h=60.0000},
            [3] = {x=-813.21484375, y=-1315.31738281, z=42.67880630493164, h=0.00000},
            [4] = {x=-812.14965820, y=-1315.93237304, z=42.67874526977539, h=-60.000},
            [5] = {x=-812.14978027, y=-1317.16247558, z=42.67879104614258, h=-119.99},
            [6] = {x=-813.21478271, y=-1317.77734375, z=42.67873001098633, h=180.000}
        },
        props = {
            ["deck"] = {model= "p_cardssplit01x_bla", x= -813.65, y=-1317.04, z=43.48, h=300.00}
        }, 
        delete = {}
    },
    ["FlatneckStation"] = {
        showBlip = 100,
        blipSprite = 1243830185,
        blipLocation = {x = -327.6681213378906, y = -357.79595947265625, z = 87.05500030517578, h = -63.0},
        tblLod = 15,
        tblCoords = {x = -327.6681213378906, y = -357.79595947265625, z = 87.05500030517578, h = -63.0},
        Name = "Texas Hold'em",
        promptLocation = {x = -327.6681213378906, y = -357.79595947265625, z = 87.05500030517578, h = -63.0},
        promptRadius = 2.1,
        deckStyle = 3,
        buyIn = 2.5,
        smallBlind = 0.02,
        limitHoldem = false,
        seats = {
            [1] = {x=-326.5965576171875, y=-357.231201171, z=87.05473327636719, h=-63.00},
            [2] = {x=-326.6343383789062, y=-358.448577880, z=87.05473327636719, h=-123.0},
            [3] = {x=-327.7151184082031, y=-359.009826660, z=87.05473327636719, h=176.99},
            [4] = {x=-328.7348327636719, y=-358.356079101, z=87.05473327636719, h=116.99},
            [5] = {x=-328.6898498535156, y=-357.153656005, z=87.05473327636719, h=56.999},
            [6] = {x=-327.6202392578125, y=-356.576171875, z=87.05473327636719, h=-3.000}
        },
        props = {
            ["deck"] = {model= "p_cardssplit01x_camp", x= -327.31, y=-357.29, z=87.86, h=-63.50}
        }, 
        delete = {}
    },
    ["SaintDenis"] = {
        showBlip = 75,
        blipSprite = 1243830185,
        blipLocation = {x = 2630.739990234375, y = -1226.25048828125, z = 52.3793716430664, h = 0.0},
        tblLod = 15,
        tblCoords = {x = 2630.739990234375, y = -1226.25048828125, z = 52.3793716430664, h = 0.0},
        Name = "Texas Hold'em",
        promptLocation = {x = 2630.739990234375, y = -1226.25048828125, z = 52.3793716430664, h = 0.0},
        promptRadius = 2.1,
        deckStyle = 6,
        buyIn = 5.0,
        smallBlind = 0.04,
        changeBlindsPerRound = 1,--player can change the value of the smal blind every X game round
        blindsStepSize = 0.01,--value to increase/decrease small blind
        limitHoldem = false,
        seats = {
            [1] = {x=2630.726074218, y=-1225.04992675781, z=52.37958526611328, h=0.00000},
            [2] = {x=2631.767578125, y=-1225.65026855468, z=52.37975311279297, h=-60.000},
            [3] = {x=2631.766601562, y=-1226.81713867187, z=52.37975311279297, h=-119.99},
            [4] = {x=2630.746582031, y=-1227.4375,        z=52.37958526611328, h=180.000},
            [5] = {x=2629.714355468, y=-1226.84997558593, z=52.37958526611328, h=119.990},
            [6] = {x=2629.706787109, y=-1225.66064453125, z=52.37958526611328, h=60.0000},
        },
        props = {
            ["deck"] = {model= "p_cardssplit01x_std_labastille", x= 2630.52, y=-1225.68, z=53.18, h=0.00}
        }, 
        delete = {}
    },
}


-- Wrapper event names. Only used when TexasHoldemConfig.Framework is set to "custom"
Wrapper = {}
Wrapper.objectiveEvent = "myFrameWork:Objective"
Wrapper.TipEvent       = "myFrameWork:Tip"
Wrapper.HudOverride    = "myFrameWork:OverrideHUD"
Wrapper.getCharFromId  = "d_texasholdem:custom:getCharacterFromId" -- calls wrapper function from compatibility.lua