local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


local weebvip = ""

RegisterServerEvent('nav_vip:vip1')
AddEventHandler('nav_vip:vip1', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasGroup(user_id,"Ouro") or vRP.hasGroup(user_id,"Prata") or vRP.hasGroup(user_id,"Bronze") then
        TriggerClientEvent("Notify",source,"sucesso","Voce ja tem vip aguarde acabar.")
	else
	    local aok = vRP.request(source,"Deseja comprar 7 dias de vip + R$ 200.000 por 5.500 Vales?",20)
		if aok then
	        if vRP.tryGetInventoryItem(user_id,"vale", 5500,true) then
		        vRP.addUserGroup(user_id,"Ouro")
		        vRP.giveInventoryItem(user_id,"minutos", 59)
		        vRP.giveInventoryItem(user_id,"horas", 23)
		        vRP.giveInventoryItem(user_id,"dias", 6)
				vRP.giveMoney(user_id, 200000)
		        local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." comprou 7 dias de Vip Ouro .```" 
                SendWebhookMessage(weebvip,msg)
	        else
	            TriggerClientEvent("Notify",source,"sucesso","Voce nao tem vale suficiente.")
		    end
		end
	end
end)
RegisterServerEvent('nav_vip:vip2')
AddEventHandler('nav_vip:vip2', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasGroup(user_id,"Ouro") or vRP.hasGroup(user_id,"Prata") or vRP.hasGroup(user_id,"Bronze") then
        TriggerClientEvent("Notify",source,"sucesso","Voce ja tem vip aguarde acabar.")
	else
	    local aok = vRP.request(source,"Deseja comprar 7 dias de vip + R$ 100.000 por 3.500 Vales?",20)
		if aok then
	        if vRP.tryGetInventoryItem(user_id,"vale", 3500,true) then
		        vRP.addUserGroup(user_id,"Prata")
		        vRP.giveInventoryItem(user_id,"minutos", 59)
		        vRP.giveInventoryItem(user_id,"horas", 23)
		        vRP.giveInventoryItem(user_id,"dias", 6)
				vRP.giveMoney(user_id, 100000)
		        local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." comprou 7 dias de Vip Prata .```" 
                SendWebhookMessage(weebvip,msg)
	        else
	            TriggerClientEvent("Notify",source,"sucesso","Voce nao tem vale suficiente.")
		    end
		end
	end
end)
RegisterServerEvent('nav_vip:vip3')
AddEventHandler('nav_vip:vip3', function()
	local src = source
	local user_id = vRP.getUserId(src)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasGroup(user_id,"Ouro") or vRP.hasGroup(user_id,"Prata") or vRP.hasGroup(user_id,"Bronze") then
        TriggerClientEvent("Notify",source,"sucesso","Voce ja tem vip aguarde acabar.")
	else
	    local aok = vRP.request(source,"Deseja comprar 7 dias de vip + R$ 50.000 por 2.500 Vales?",20)
		if aok then
	        if vRP.tryGetInventoryItem(user_id,"vale", 2500,true) then
		        vRP.addUserGroup(user_id,"Bronze")
		        vRP.giveInventoryItem(user_id,"minutos", 59)
		        vRP.giveInventoryItem(user_id,"horas", 23)
		        vRP.giveInventoryItem(user_id,"dias", 6)
			    vRP.giveMoney(user_id, 50000)
		        local msg = "```[ADMINISTRAÇÃO] ["..user_id.."] "..identity.name.." "..identity.firstname.." comprou 7 dias de Vip Bronze .```" 
                SendWebhookMessage(weebvip,msg)
	        else
	            TriggerClientEvent("Notify",source,"sucesso","Voce nao tem vale suficiente.")
		    end
		end
	end
end)