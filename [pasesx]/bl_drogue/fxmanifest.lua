fx_version 'adamant'

game 'gta5'

description 'Blz'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'config.lua'
}
