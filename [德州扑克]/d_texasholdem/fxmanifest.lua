fx_version "adamant"

games { 'rdr3' }

author '@DArkSouL'
description 'Full Texas Holdem Poker Script. Reliable and optimized for the best game feeling'
version '2.0.4'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Client Scripts
client_scripts {
    'config.lua',
    'language/*.lua',
    'client/utils-c.lua',
    'client/main-c.lua',
    'client/animations-c.lua',
    'client/objects-c.lua'
} 

-- Server Scripts
server_scripts {
    'config.lua',
    'language/*.lua',
    'server/util-s.lua',
    'server/main-s.lua',
    'server/evaluateHands-s.lua',
    'server/objects-s.lua',
    'server/compatibility.lua'
} 

-- html
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/reset.css',
    'html/style.css',
    'html/img/cards/playing_cards_01/*.png',
    'html/img/cards/playing_cards_02/*.png',
    'html/img/cards/playing_cards_03/*.png',
    'html/img/cards/playing_cards_04/*.png',
    'html/img/cards/playing_cards_05/*.png',
    'html/img/cards/playing_cards_06/*.png',
    'html/img/cards/playing_cards_07/*.png',
    'html/img/cards/playing_cards_08/*.png',
    'html/img/cards/playing_cards_09/*.png',
    'html/img/*.png',
    'html/img/*.gif',
    'html/img/*.jpg',
    'html/main.js'
}

escrow_ignore {
    'config.lua', 
    'server/compatibility.lua',
    'language/*.lua',
}
dependency '/assetpacks'
dependency '/assetpacks'