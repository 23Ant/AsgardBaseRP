------------------------CREDITS------------------------
--------- Script made by Vlad, DevStudios Owner -------
--      Script made for StreamForce Romania RP       --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("vRP:Discord")
		Citizen.Wait(10000000000000000)
	end
end)
-------------------------- https://discordapp.com/developers/applications/ -----------------------------------

RegisterNetEvent('vRP:Discord-rich')
AddEventHandler('vRP:Discord-rich', function(user_id, faction, name)
SetDiscordAppId(725055221113421854)-- Discord app ID
SetDiscordRichPresenceAsset('logotipo96') -- PNG file
SetDiscordRichPresenceAssetText('logotipo96') -- PNG text desc
SetDiscordRichPresenceAssetSmall('') -- PNG small
SetDiscordRichPresenceAssetSmallText('') -- PNG text desc2
SetRichPresence("[ID:"..user_id.."] "..name.. " | "..GetNumberOfPlayers().."/32")
end)
