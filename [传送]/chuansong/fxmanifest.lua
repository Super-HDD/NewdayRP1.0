-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

description "NEWDAYRPchuansong"

author 'OLIANN97'

version '1.0.2'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

dependencies {
	'ox_lib'
}
