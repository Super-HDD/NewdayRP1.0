fx_version "adamant"
game "rdr3"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 'yes'
author "Kharan"
version "1.0.0"

files {
	"stream/*.ymap",
	'stream/*.ytyp',
}

escrow_ignore {
    'stream/*.ydr',
  }



data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'


dependency '/assetpacks'