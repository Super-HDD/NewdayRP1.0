fx_version "adamant"

games { 'rdr3', 'gta5' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


shared_scripts {
    'config.lua',
}

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    -- '@mysql-async/lib/MySQL.lua',     -- MySQL init
    'server.lua',
    'config.lua'
}


