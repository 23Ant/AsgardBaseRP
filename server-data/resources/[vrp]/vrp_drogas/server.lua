
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterCommand('donlenda',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	
	TriggerClientEvent('don_Iniciar', source, 1)
	--TriggerClientEvent("Notify",source,"sucesso","Limpou inventario do jogador.")
	end)
	
RegisterServerEvent('don_Permissao')
AddEventHandler('don_Permissao', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"vermelhos.permissao")then
	   -- cocaina
	   TriggerClientEvent('don_Iniciar', source, "cocaina")
	elseif vRP.hasPermission(user_id,"amarelos.permissao")then
	   -- meta
	   TriggerClientEvent('don_Iniciar', source, "metanfetamina")
	elseif vRP.hasPermission(user_id,"verdes.permissao")then
	   -- maconha
	   TriggerClientEvent('don_Iniciar', source, "maconha")
	elseif vRP.hasPermission(user_id,"roxos.permissao")then
	   -- lsd
	   TriggerClientEvent('don_Iniciar', source, "lsd")
	end
end)
RegisterServerEvent('don_Entrega')
AddEventHandler('don_Entrega', function(Tipo, Quantidade, Unidade)
	local source = source
	local user_id = vRP.getUserId(source)
	local donResposta = vRP.getInventoryItemAmount(user_id, Tipo)
    if donResposta ~= 0 then
	    local donPreco = Quantidade * Unidade
		local donPergunta = vRP.request(source,"Deseja vender para <b>Americano</b> "..Tipo.."("..Quantidade") por R$ "..donPreco.."",10)
		if donPergunta then
		    if vRP.tryGetInventoryItem(user_id,Tipo,Quantidade,true) then
	            TriggerClientEvent("Notify",source,"sucesso","Venda efetuada com sucesso . R$ "..donPreco.."")
				vRP.giveMoney(user_id, donPreco)
				TriggerClientEvent('don_Iniciar', source, Tipo)
			end
		else
		    TriggerClientEvent("Notify",source,"sucesso","Venda rejeitada .!")
		    TriggerClientEvent('don_Cancelar', source)
		end
    else
        TriggerClientEvent("Notify",source,"negado","Não tem "..Tipo.." , volte a farmar .")
		TriggerClientEvent('don_Cancelar', source)
    end
end)	