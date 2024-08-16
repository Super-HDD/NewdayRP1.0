fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'qb-billing'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change this to your preferred language
    'config.lua',
}

dependency 'qb-core'
dependency 'qb-input'
dependency 'qb-menu'

lua54 'yes'
