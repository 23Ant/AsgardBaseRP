local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_assaltobanco",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = 0
local recompensa = 0
local andamento = false
local dinheirosujo = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALIDADES-----------------------------------------------------------------------------------------------------------------------------------------
local caixas = {
	[1] = { ['seconds'] = 300 },
	[2] = { ['seconds'] = 300 }, 
	[3] = { ['seconds'] = 300 },
	[4] = { ['seconds'] = 300 },
	[5] = { ['seconds'] = 300 },
	[6] = { ['seconds'] = 300 },
	[7] = { ['seconds'] = 300 },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkRobbery(id,x,y,z,head)
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = vRP.getUsersByPermission("policia.permissao")
	if user_id then
		if #policia < 4 then
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
		elseif (os.time()-timers) <= 1800 then
			TriggerClientEvent("Notify",source,"aviso","Os caixas estão vazios, aguarde <b>"..vRP.format(parseInt((1800-(os.time()-timers)))).." segundos</b> até que os civis depositem dinheiro.")
		else
			andamento = true
			timers = os.time()
			dinheirosujo = {}
			dinheirosujo[user_id] = caixas[id].seconds
			vRPclient.setStandBY(source,parseInt(700))
			recompensa = parseInt(math.random(8000,17000)/caixas[id].seconds)
			TriggerClientEvent('iniciandoassaltobanco',source,x,y,z,caixas[id].seconds,head)
			--vRPclient._playAnim(source,false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
			for l,w in pairs(policia) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('blip:criar:assaltobanco',player,x,y,z)
						vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
						TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"O roubo começou no ^1Banco^0, dirija-se até o local e intercepte os assaltantes.")
					end)
				end
			end
			SetTimeout(caixas[id].seconds*1000,function()
				if andamento then
					andamento = false
					for l,w in pairs(policia) do
						local player = vRP.getUserSource(parseInt(w))
						if player then
							async(function()
								TriggerClientEvent('blip:remover:assaltobanco',player)
								TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
							end)
						end
					end
				end
			end)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.cancelRobbery()
	if andamento then
		andamento = false
		local policia = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(policia) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					TriggerClientEvent('blip:remover:assaltobanco',player)
					TriggerClientEvent('chatMessage',player,"COPOM",{245,0,0},"O assaltante saiu correndo e deixou tudo para trás.")
				end)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			for k,v in pairs(dinheirosujo) do
				if v > 0 then
					dinheirosujo[k] = v - 1
					vRP._giveInventoryItem(k,"dinheirosujo",recompensa)
				end
			end
		end
	end
end)