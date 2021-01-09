local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('leiteiro_entregas:itensReceber')
AddEventHandler('leiteiro_entregas:itensReceber', function(quantidade)
	local src = source
	local user_id = vRP.getUserId(src)
    local pagamento = math.random(20,40)
    if user_id then
		if vRP.tryGetInventoryItem(user_id,"garrafadeleite",quantidade,true) then
			vRP.giveMoney(user_id,pagamento*quantidade)
			TriggerClientEvent("Notify",source,"sucesso","Venda realizada "..pagamento*quantidade.." Dolares Recebido")
			SetTimeout(5000,function()
				vRPclient.removeDiv(src, "Alerta")
			end)
			quantidade = nil
			return true
		else
			TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..quantidade.."x Garrafa de leite</b>.")
			
		end
	end
end)