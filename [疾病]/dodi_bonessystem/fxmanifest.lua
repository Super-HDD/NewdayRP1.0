fx_version "adamant"

games { 'rdr3', 'gta5' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'bone'

shared_scripts {
    'config.lua',
    'not.js'
}

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
    'not.js',
    'config.lua'
}

files {
    'not.js',

}

