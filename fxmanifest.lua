fx_version 'adamant'

game 'gta5'

description 'klamer Shops robbery'
lua54 'yes'
version '1.0'
legacyversion '1.9.1'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'@ox_lib/init.lua'
}

server_scripts {
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua'
}



dependency 'es_extended'
