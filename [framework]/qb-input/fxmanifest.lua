fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'qb-input'

client_scripts {
    'client/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles/*.css',
    'html/script.js',
    'html/styles/puiL8kX.png'
}

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua'
}