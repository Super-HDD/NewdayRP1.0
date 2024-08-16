version '1.0'
lua54 'yes'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
   'c_main.lua',
}

server_scripts {
   'sv_main.lua',
}

files {
   'nui/**.*'
}

ui_page 'nui/ui.html'

