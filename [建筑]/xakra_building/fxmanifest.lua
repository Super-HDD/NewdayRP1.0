author 'Xakra <Discord:Xakra#8145>'
version '1.4'
description 'xakra_building'

fx_version "adamant"
lua54 "on"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

shared_scripts {
    'config.lua',
    'locale.lua',
    'languages/*.lua',
	'client/functions.lua',
}

client_scripts {
	'framework/client.lua',
	'client/client.lua',
}

server_scripts {
	'framework/server.lua',
	'server/server.lua',
}

escrow_ignore {
	'config.lua',
	'languages/*.lua',
	'framework/client.lua',
	'framework/server.lua',
}
dependency '/assetpacks'