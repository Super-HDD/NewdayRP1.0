fx_version 'adamant'
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'A stamina based pass out script with a revamped sedative varmint'
autor 'TheAmazingCobra'

client_script {
	'client/client.lua',
	'client/func.lua',
	'config.lua',
}

shared_script {
'language.lua',
'config.lua',
}

server_script {
	'server/server.lua',
}

escrow_ignore {
	'config.lua',
	'language.lua',
  }

lua54 'yes'
dependency '/assetpacks'