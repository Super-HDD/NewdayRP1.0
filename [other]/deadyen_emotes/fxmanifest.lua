name         'deadyen_emotes'
author       'deadyen.com - totsu☂️'
version      '1.4'

fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/NativeUI.lua',
    'client/AnimationList.lua',
    'client/menu.lua',
    'client/keybinds.lua',
    'client/handsup.lua',
    'client/ragdoll.lua',
}

server_scripts{
    'server/server.lua',
}

escrow_ignore {
    'config.lua',
    'client/keybinds.lua'
}

dependency '/assetpacks'