fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'oliann97'

version '1.0.0'

files {
    'html/*.*'
}

ui_page 'html/index.html'

client_scripts {
    'cl_main.lua',
}
server_script 'sv_main.lua'

