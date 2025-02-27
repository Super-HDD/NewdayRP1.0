game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/vue.min.js",
    "ui/script.js",
    "ui/jquery-3.3.1.min.js",
    "ui/main.css",
    "ui/styles/police.css",
    "ui/badges/police.png",
    "ui/bg.jpg",
    "ui/mugshot.png"
}

client_scripts {
    -- 'config.lua',
    'cl_mdt.lua',
}


shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locale/en.lua',
}

server_scripts {
    -- 'config.lua',
    'sv_mdt.lua',
    -- 'version.lua',
}

version '1.0'
