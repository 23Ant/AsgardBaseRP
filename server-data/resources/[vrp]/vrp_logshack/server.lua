local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_logshack",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookhack = "https://discordapp.com/api/webhooks/710269996734873620/TKKKXvzBM7fc-7p6_rey24-1wgmCQ5a8JQwZMbYYcRnAXuFsf6scThVg6wWWapQj_bFb"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

--------------------------------------
-- WEB

function func.buttonInsert()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [INSERT].```")
	end
end

function func.buttonNumOito()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [NUMPAD 8].```")
	end
end

function func.buttonNumSeis()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [NUMPAD 6].```")
	end
end

function func.buttonSetaCima()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [SETA PRA CIMA].```")
	end
end

function func.buttonSetaBaixo()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [SETA PRA BAIXO].```")
	end
end

function func.buttonfUm()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [F1].```")
	end
end

AddEventHandler('explosionEvent', function(sender, ev)
	local jogador = GetPlayerName(sender)
	local idExplosao = ev.explosionType
	local user_id = vRP.getUserId(sender)
	print(GetPlayerName(sender), json.encode(ev))
	if (idExplosao == 29) then
		PerformHttpRequest("https://discordapp.com/api/webhooks/710269996734873620/TKKKXvzBM7fc-7p6_rey24-1wgmCQ5a8JQwZMbYYcRnAXuFsf6scThVg6wWWapQj_bFb", function(err, text, headers) end, 'POST', json.encode({content =  "**Explosões** ```" .. "ID: " .. user_id .. " Nome: " .. jogador .. "\nServidor: " .. GetConvar('sv_name', 'ND') .. "\nData: " .. os.date("%H:%M:%S %d/%m/%Y") .. "```"}), { ['Content-Type'] = 'application/json' })
	end
  CancelEvent(explosionEvent)
end)
