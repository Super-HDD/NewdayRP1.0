fx_version "cerulean"

description "NewdayRP证件系统"
author "Veronica"
version '0.1.0'

lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

games {
  "rdr3"
}

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script "server/**/*"

files {
	'web/build/index.html',
	'web/build/**/*',
}