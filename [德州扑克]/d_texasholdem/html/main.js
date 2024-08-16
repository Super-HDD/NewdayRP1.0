var currentGame = {}
var myId = -1
var Language = {}
$(function() {
    // fade in/out wrapper element (show/hide NUI)
    function display(bool) {
        if (bool) {
            $("#texasholdem-wrapper").fadeIn(400);
        } else {
            $("#texasholdem-wrapper").fadeOut(250);
            currentGame = {}
        }
    };

    // listen for NUI events
    window.addEventListener("message", function(event) {
        //show/hide the whole NUI 
        if (event.data.type === "ui") {
            display(event.data.status)
        } 
        else if (event.data.type === "gamestate") {
            display(true)
            if (event.data.state) {
                $(".cardinfo").html("")
                currentGame = event.data.state
                updatePlayer(currentGame.players)
            }
            if (event.data.playerSeat) { 
                myId = event.data.playerSeat
            }
        }
        else if (event.data.type === "language") {
            Language = event.data.language
        }
    })

    function getCardVal(card) {
        var c = card.split("-");
        if      (c[0] == "♦") { c[0] = "diamonds" }
        else if (c[0] == "♤") { c[0] = "spades" }
        else if (c[0] == "♥") { c[0] = "hearts" }
        else if (c[0] == "♧") { c[0] = "clubs" }  
        c[1] = c[1].toLowerCase();
        return c
    }

    // sort array by key parameter asc & desc
    // https://koukia.ca/sorting-an-array-of-objects-with-jquery-d01e12047ce4
    function sortByKeyAsc(array, key) {
        return array.sort(function (a, b) {
            var x = a[key]; var y = b[key];
            return ((x > y) ? -1 : ((x < y) ? 1 : 0));
        });
    }

    function updatePlayer(players) {
        var playerHTML = ""
        $("#player-cards").html(playerHTML)
        // playerlist needs to be sorted. So for that we build an Array out of that object
        var playerlist = []
        for (const [key, value] of Object.entries(players)) {
            value.id = key
            playerlist.push(value)
        }
        playerlist = sortByKeyAsc(playerlist, "seat");
        $.each(playerlist, function( id, data ) {
            // depending on playerstate do some animations in the gui
            var state = ""
            if (data.playerstate == "input move" && myId == data.seat ) {
                state = "active yourself"
            } else if (data.playerstate == "input move" && myId != data.seat ) {
                state = "active otherplayer"
            }
            // translate playerstates to actual information to display
            if (data.playerstate == "waiting for start") {
                data.playerstate = Language.WaitingForStart
            } else if (data.playerstate == "is not rdy") {
                data.playerstate = Language.NotRdy;
            } else if (data.playerstate == "is rdy") {
                data.playerstate = Language.IsRdy
            } else if (data.playerstate == "check" || data.playerstate == "move:check") {
                data.playerstate = Language.MoveCheck
            } else if (data.playerstate == "set" || data.playerstate == "move:set") {
                data.playerstate = Language.MoveSet
            } else if (data.playerstate == "call" || data.playerstate == "move:call") {
                data.playerstate = Language.MoveCall
            } else if (data.playerstate == "fold" || data.playerstate == "move:fold") {
                data.playerstate = Language.MoveFold
            } else if (data.playerstate == "raise" || data.playerstate == "move:raise" || data.playerstate == "reraise" || data.playerstate == "move:reraise") {
                data.playerstate = Language.MoveRaise
            } else if (data.playerstate == "allin" || data.playerstate == "move:allin") {
                data.playerstate = Language.MoveAllin
            } else if (data.playerstate == "input move") {
                if (myId == data.seat) {
                    data.playerstate = Language.PlayersMove
                } else {
                    data.playerstate = data.name + Language.OtherPlayersMove
                }
            } else if (data.playerstate == "shuffle deck") {
                data.playerstate = Language.ShuffleDeck
            } else if (data.playerstate == "waiting for player") {
                data.playerstate = Language.WaitingForPlayer
            } else if (data.playerstate == "waiting for cards") {
                data.playerstate = Language.WaitingForCards
            }
            
            // create the player box with cardinfo and append it to the main player container
            playerHTML = "<div class='player' id='player-"+id+"'><div id='player-"+id+"-pic' class='player-pic "+ state +"'>" + data.seat + "</div><ul id='pInfo-"+id+"' class='leftBlock'></ul><ul id='pCards-"+id+"' class='rightBlock'></ul><div class='cardinfo "+ state +"'><span>[" + data.bet.toFixed(2) + "] "+data.playerstate+"</span></div></div>"
            $("#player-cards").append(playerHTML)
        });
        if (currentGame.state === "main") {
            // summ up all pot values
            var mainPot = 0
            var sidePot1 = 0
            var sidePot2 = 0
            var sidePot3 = 0
            var sidePot4 = 0
            $.each(currentGame.roundBets, function(round, roundValues) {
                $.each(roundValues.pot, function(potId, data) {
                    if (potId === "mainPot") {
                        mainPot = mainPot + data.value
                    } else if (potId === "sidePot1") {
                        sidePot1 = sidePot1 + data.value
                    } else if (potId === "sidePot2") {
                        sidePot2 = sidePot2 + data.value
                    } else if (potId === "sidePot3") {
                        sidePot3 = sidePot3 + data.value
                    } else if (potId === "sidePot4") {
                        sidePot4 = sidePot4 + data.value
                    }
                });
            });
            // clear all current html pots
            $("#sidePot1").html("")
            $("#sidePot2").html("")
            $("#sidePot3").html("")
            $("#sidePot4").html("")
            
            // insert new values to html pots
            //$("#dealer-cards .cardinfo").html("Pot [ $"+ mainPot.toFixed(2) +" ]")
            $("#mainPot").html(Language.MainPot+" [ $"+ mainPot.toFixed(2) +" ]")
            if (sidePot1 > 0.0) {
                $("#sidePot1").html(Language.SidePot+" 1 [ $"+ sidePot1.toFixed(2) +" ]")
            }
            if (sidePot2 > 0.0) {
                $("#sidePot2").html(Language.SidePot+" 2 [ $"+ sidePot2.toFixed(2) +" ]")
            }
            if (sidePot3 > 0.0) {
                $("#sidePot3").html(Language.SidePot+" 3 [ $"+ sidePot3.toFixed(2) +" ]")
            }
            if (sidePot4 > 0.0) {
                $("#sidePot4").html(Language.SidePot+" 4 [ $"+ sidePot4.toFixed(2) +" ]")
            }
        } else {
            $("#dealer-cards .cardinfo").html("")
        }

        // create visible player deck or display moneypot + name when in idle mode
        $.each(playerlist, function( id, data ) { 
            var seattype = ""
            if (data.seat == currentGame.Dseat) {
                seattype = "<span class='seattype'>D</span>"
            } else if (data.seat == currentGame.SBseat) {
                seattype = "<span class='seattype'>S</span>"
            } else if (data.seat == currentGame.BBseat) {
                seattype = "<span class='seattype'>B</span>"
            }
            var MoneyAndName = "<li class='name redtext'>" + data.name + "</li><li class='money'>$" + data.pot.toFixed(2) + seattype + "</li>"
            $("#pInfo-" + id).html(MoneyAndName)
            if(currentGame.state != "idle") {
                var cardHTML = ""       
                $.each( data.cards, function( i, card ) {
                    var count = getCardVal(card)
                    // if first card of dealer is not visible, render its back side
                    if (myId == data.seat || currentGame.state == "end") {
                        cardHTML = cardHTML + "<li class='card'><img class='card-" + card + "' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/" + count[0] + "_" + count[1] + ".png'/></li>"
                    } else {
                        cardHTML = cardHTML + "<li class='card'><img class='card-blank' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/back.png'/></li>"
                    }
                })
                
                // attach it to the player box
                $("#pCards-" + id).html(cardHTML)
                if (currentGame.currentCardTo == id) {
                    $("#pCards-" + id + " li:last-child" ).addClass("animate__animated").addClass("animate__bounceIn")    
                }
            }
        });

        // create dealer cards
        if (currentGame.state === "main") {
            var cardCount = 5 - currentGame.communityCards.length;
            var dCardHTML = ""  
            for (let i = 0; i < cardCount; i++) {
                dCardHTML =  dCardHTML + "<li class='card'><img class='card-blank' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/back.png'/></li>"
            }
            // go backwards through communityCards array
            for (let index = currentGame.communityCards.length - 1; index >= 0; index--) {
                const card = currentGame.communityCards[index]
                var count = getCardVal(card)
                dCardHTML =  dCardHTML + "<li class='card'><img class='card-" + card + "' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/" + count[0] + "_" + count[1] + ".png'/></li>"
            }
            $("#dCards").html(dCardHTML)
            // handle card bouncing of communityCards
        } else {
            $("#dCards").html("")
        }
    }
})
