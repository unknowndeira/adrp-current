resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'ESX Animal Hunt'
version '1.0.0'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/markers.lua',
	'client/gui.lua'
}