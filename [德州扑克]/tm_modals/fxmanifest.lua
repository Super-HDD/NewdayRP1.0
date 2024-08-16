fx_version "adamant"

games { 'rdr3' }

author '@turbomodus'
description 'highly configurable modal windows / dialog boxes'
version '1.0'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- UI
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/reset.css',
    'html/style.css',
    'html/img/*.png',
    'html/img/*.gif',
    'html/img/*.jpg',
    'html/icons/*.png',
    'html/icons/*.gif',
    'html/icons/*.jpg',
    'html/font/*.ttf',
    'html/modal.js'
}

-- Client Scripts
client_scripts {
   'client/modal-c.lua',
} 

escrow_ignore {
    'client/modal-c.lua', 
}

dependency '/assetpacks'