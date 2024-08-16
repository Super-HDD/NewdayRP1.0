fx_version "cerulean"

description "Basic React (TypeScript) & Lua Game Scripts Boilerplate"
author "Project Error"
version '1.0.0'
repository 'https://github.com/project-error/fivem-react-boilerplate-lua'

lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script "server/**/*"

files {
	'web/build/index.html',
	'web/build/**/*',
}