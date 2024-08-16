fx_version 'cerulean'

game { 'rdr3' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.' 

lua54 'yes'

client_scripts {
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua'
}
ui_page 'html/ui.html'


escrow_ignore {
  'config.lua',
  'client/*.lua',
  'server/*.lua'
}

files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/js/*.js',
	'html/assets/css/*.css',
	'html/assets/bootstrap/css/*.css',
	'html/assets/bootstrap/js/*.js',
	'html/assetsnew/img/*.png',
	'html/assetsnew/fonts/*.ttf',
	'html/assetsnew/fonts/*.otf',
	'html/assetsnew/fonts/*.woff',
	'html/assetsnew/fonts/*.woff2',
	'html/assetsnew/fonts/*.svg',
	'html/assetsnew/fonts/*.eot',
	'html/assetsnew/fonts/*.css',
	'html/assetsnew/fonts',
	'html/assetsnew/css/*.css',
	'html/assetsnew/bootstrap/css/*.css',
	'html/assetsnew/bootstrap/js/*.js',
}


dependency '/assetpacks'





--Changed by oliann97