fx_version "adamant"
game "rdr3"
lua54 'yes'
this_is_a_map "yes"

client_scripts {
    'client.lua',
}

escrow_ignore {
    'stream/*.ydr'   -- Ignore all .ydr
  }

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
dependency '/assetpacks'