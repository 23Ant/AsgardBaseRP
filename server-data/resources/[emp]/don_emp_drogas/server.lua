-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","don_emp_drogas")

local perg = false

----- By DonSpeed - Maconha

RegisterServerEvent('Don_Speed:PermissaoM')
AddEventHandler('Don_Speed:PermissaoM', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    TriggerClientEvent('Don_Speed:ContinuaM', source)
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)

RegisterServerEvent('Don_Speed:Pagar')
AddEventHandler('Don_Speed:Pagar', function(a1, a2)
	local source = source
	local user_id = vRP.getUserId(source)
	local testevalor = a1*a2
		
	if vRP.tryGetInventoryItem(user_id,"maconha",a1,false) and perg == false then
	    perg = true
	    local dsMac = vRP.request(source,"<b>Deseja entregar "..a1.."x Maconhas??? R$ "..testevalor..",00</b>",20)
		if dsMac then
	        vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(a1*a2))
			TriggerClientEvent('Don_Speed:ContinuaM', source)
			perg = false
		else perg = false end
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..a1.."x Maconhas</b> ou  menu de pergunta esta em execução.")		
	end
end)

----- By DonSpeed - Cocaina

RegisterServerEvent('Don_Speed:PermissaoC')
AddEventHandler('Don_Speed:PermissaoC', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    TriggerClientEvent('Don_Speed:ContinuaC', source)
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)

RegisterServerEvent('Don_Speed:PagarC')
AddEventHandler('Don_Speed:PagarC', function(a1, a2)
	local source = source
	local user_id = vRP.getUserId(source)
	local testevalor = a1*a2
		
	if vRP.tryGetInventoryItem(user_id,"cocaina",a1,true) and perg == false then
	    perg = true
	    local dsMac = vRP.request(source,"<b>Deseja entregar "..a1.."x Cocaina??? R$ "..testevalor..",00</b>",20)
		if dsMac then
	        vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(a1*a2))
			TriggerClientEvent('Don_Speed:ContinuaC', source)
			perg = false
		else perg = false end	
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..a1.."x Cocaina</b> ou  menu de pergunta esta em execução.")
	end
end)

----- By DonSpeed - LSD

RegisterServerEvent('Don_Speed:PermissaoL')
AddEventHandler('Don_Speed:PermissaoL', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    TriggerClientEvent('Don_Speed:ContinuaL', source)
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)

RegisterServerEvent('Don_Speed:PagarL')
AddEventHandler('Don_Speed:PagarL', function(quantidade, valor) --  virado
	local source = source
	local user_id = vRP.getUserId(source)
	local testevalor = quantidade*valor
	if vRP.tryGetInventoryItem(user_id,"lsd",quantidade,false) and perg == false then
	    perg = true
	    local dsMac = vRP.request(source,"<b>Deseja entregar "..quantidade.."x LSD??? R$ "..testevalor..",00</b>",20)
		if dsMac then
	        vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(quantidade*valor))
			TriggerClientEvent('Don_Speed:ContinuaL', source)
			perg = false
		else perg = false end
	else
	    TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..quantidade.."x LSD</b> ou  menu de pergunta esta em execução.")	
		TriggerClientEvent('Don_Speed:Cancelar', source)
	end
end)

----- By DonSpeed - META

RegisterServerEvent('Don_Speed:PermissaoMeta')
AddEventHandler('Don_Speed:PermissaoMeta', function(permissao)
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao) then
	    TriggerClientEvent('Don_Speed:ContinuaL', source)
	else
	    TriggerClientEvent("Notify",source,"aviso","Você não possui permissão .")
	end
end)

RegisterServerEvent('Don_Speed:PagarMeta')
AddEventHandler('Don_Speed:PagarMeta', function(a1, a2)
	local source = source
	local user_id = vRP.getUserId(source)
	local testevalor = a1*a2
		
	if vRP.tryGetInventoryItem(user_id,"metanfetamina",a1,true) and perg == false then
	    perg = true
	    local dsMac = vRP.request(source,"<b>Deseja entregar "..a1.."x Metanfetamina??? R$ "..testevalor..",00</b>",20)
		if dsMac then
	        vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(a1*a2))
			TriggerClientEvent('Don_Speed:ContinuaL', source)
			perg = false
		else perg = false end
	else
		TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..a1.."x Metanfetamina</b> ou  menu de pergunta esta em execução.")	
	end
end)

-- By Don_Speed    -      Don_Speed#6282
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed
-- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed -- Don_Speed