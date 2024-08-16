fx_version "adamant"
games {"rdr3"}
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

version '1.5.1'

shared_scripts{
    -- '@lum-lib/library/linker.lua',
    
    'data/animations.lua',
    'data/cardsOffset.lua',
    'data/chipsOffset.lua',
    'data/saloons.lua',
    'data/tables.lua',

    "config/config_shared.lua",

    "config/locale.lua",
}

escrow_ignore {
    "config/config_client.lua",
    "config/config_server.lua",
    "config/config_shared.lua",
    "config/config_prompts.lua",

    "config/locale.lua",

    'server/version_check.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    
    "config/config_prompts.lua",
    'config/config_client.lua',
    'client/polyzone.lua',
    'client/cl_dataview.lua',
    'client/dataview.lua',
    'client/custom_tables.lua',
    'client/ui.lua',
    'client/client.lua',
    'client/utils.lua',
    'client/research.lua',
}

files {
    'nui/dist/index.html',
    'nui/dist/cards/*.png',
    'nui/dist/assets/*.css',
    'nui/dist/assets/*.js',
    'nui/dist/assets/*.svg',
    'nui/dist/assets/*.ttf',
}

ui_page 'nui/dist/index.html'

server_scripts{
    'config/config_server.lua',
    'server/server.lua',
    'server/version_check.lua',
} 

lua54 "yes"
dependency '/assetpacks'