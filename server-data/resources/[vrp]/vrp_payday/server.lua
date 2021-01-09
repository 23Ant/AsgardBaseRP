local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_salar")

salarii = {
     -- VIP´S
    {"ouro.permissao", 9000},
    {"prata.permissao", 5000},
    {"bronze.permissao", 2000},

    -- POLICIA´S
   {"paramedico.permissao", 3500},
   {"rota.permissao", 4000},
   {"pm.permissao", 3500},
 
   -- EMPREGOS´S
   {"taxista.permissao", 750 },
   --{"mecanico.permissao", 750},
 
   -- OUTRO´S
   {"instrutor.permissao", 1500}
} 


RegisterServerEvent('salar')
AddEventHandler('salar', function(salar)
	local user_id = vRP.getUserId(source)
	for i,v in pairs(salarii) do
		permisiune = v[1]
		if vRP.hasPermission(user_id, permisiune)then
			salar = v[2]
			vRP.giveBankMoney(user_id,salar)
			TriggerClientEvent("Notify",source,"sucesso","Salario recebido - R$ "..salar..",00")
		end
	end
end)
