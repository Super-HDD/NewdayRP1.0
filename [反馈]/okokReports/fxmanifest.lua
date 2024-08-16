fx_version 'adamant'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'okok#3488'
description 'okokReports'
version '1.1'

ui_page 'web/ui.html'

files {
	'web/*.*',
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}

