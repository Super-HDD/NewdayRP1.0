fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'qb-sellvendor'

client_script {
    'client/client.lua',
    'config.lua'
}

server_script {
    'server/server.lua',
}

dependency 'qb-core'
dependency 'qb-menu'
dependency 'qb-input'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua'
}