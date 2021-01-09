local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('Verificar')
AddEventHandler('Verificar', function()
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasGroup(user_id,"Ouro") or vRP.hasGroup(user_id,"Prata") or vRP.hasGroup(user_id,"Bronze") then
	    if vRP.tryGetInventoryItem(user_id,"minutos", 1, true) then 
	       --
	    else
	        if vRP.tryGetInventoryItem(user_id,"horas", 1, true) then 
		        vRP.giveInventoryItem(user_id,"minutos", 60)
		    else
		        if vRP.tryGetInventoryItem(user_id,"dias", 1, true) then 
	                vRP.giveInventoryItem(user_id,"horas", 24)
					vRP.giveInventoryItem(user_id,"minutos", 60)
			    else
			        vRP.removeUserGroup(user_id,"Ouro")
				    vRP.removeUserGroup(user_id,"Prata")
				    vRP.removeUserGroup(user_id,"Bronze")
			       -- TriggerClientEvent("Notify",source,"sucesso","Acabou seu vip")
				end
			end
		end
	end
end)

local webvip = ""

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
RegisterCommand('limparinv2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local id = vRP.getUserSource(parseInt(args[1]))
	if id  then
	    if vRP.hasPermission(user_id,"owner.permissao") then
		    
			vRP.clearInventory2(id)
			
		    TriggerClientEvent("Notify",source,"sucesso","Limpou inventario do jogador.")
	        TriggerClientEvent("Notify",parseInt(args[1]),"sucesso","Limparam seu inventario")
		    local identity44 = vRP.getUserIdentity(args[1])
		
		    local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." limpou inventario de ["..parseInt(args[1]).."] "..identity44.name.." "..identity44.firstname.." ```" 
            SendWebhookMessage(webhookadm,msg)
		end
	end
end)