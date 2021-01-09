local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","outback")

local webhookadmin = "https://discordapp.com/api/webhooks/732061268634107946/TUP4cToXrF9VCs6_HeQ9uUr38YSCXZnSKP8YZZ88gHdhZ9CFyVk8_71tkxZDU_A3N6Bi"


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


AddEventHandler('explosionEvent', function(sender, ev)
	local jogador = GetPlayerName(sender)
	local idExplosao = ev.explosionType
	local user_id = vRP.getUserId(sender)
	print(GetPlayerName(sender), json.encode(ev))
	if (idExplosao == 69 ) then

	
	else
    CancelEvent(explosionEvent)
	SendWebhookMessage(webhookadmin,"```prolog\n[HACK ID]:"..user_id..""..os.date("\n[Data]: %d/%m/%Y \n[Hora]: %H:%M:%S").." \r```")	
	end
end)

function KillAllPeds()
    local pedweapon
    local pedid
    for ped in EnumeratePeds() do 
        if DoesEntityExist(ped) then
            pedid = GetEntityModel(ped)
            pedweapon = GetSelectedPedWeapon(ped)
            if pedweapon == -1312131151 or not IsPedHuman(ped) then 
                ApplyDamageToPed(ped, 1000, false)
                DeleteEntity(ped)
            else
                switch = function (choice)
                    choice = choice and tonumber(choice) or choice
                  
                    case =
                    {
                        [451459928] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
                  
                        [1684083350] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [451459928] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
              
                        [1096929346] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [880829941] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
          
                        [-1404353274] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [2109968527] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                       default = function ( )
                       end,
                    }

                    if case[choice] then
                       case[choice]()
                    else
                       case["default"]()
                    end
                  
                  end
                  switch(pedid) 
            end
        end
    end
end


--- CONFIGURATION ---

RegisterServerEvent("anticheatkick")
AddEventHandler("anticheatkick", function(reson)
	if(IsPlayerAceAllowed(source, "applecheat.bypass")) then
		if(not reson == "keys") then
			print("Outbackcheats: " .. GetPlayerName(source) .. " [" .. source .. "] Achamos que isso não e normal.")
		end
	else
		if(GetPlayerName(source)) then
		end
		if(reson == "resources") then
			print()
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()		
			DropPlayer(source, "Outbackcheats: Registramos uma atitude suspeita! Não usa essa tecla novamente")
		elseif(reson == "keys") then
			print()
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "Outbackcheats: Registramos uma atitude suspeita!Não usa essa tecla novamente")

		end
	end
end)


