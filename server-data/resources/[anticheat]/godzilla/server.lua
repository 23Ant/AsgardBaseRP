local logs = "https://discordapp.com/api/webhooks/703783480282054670/dOjT7JsetXzdwlIi7DqDv3firOixyplo0e3uyV8AGM8WxKF170x4_ZSA1sAx6EPxHFue"

RegisterServerEvent("modmenu")
AddEventHandler("modmenu", function()
sendToDiscord()
DropPlayer(source, 'Você caiu na operação LAVA RATO')
end)


function sendToDiscord()
local steam = GetPlayerIdentifier(source)
local nick = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)	
  local embed = {
        {
            ["color"] = 23295,
            ["title"] = "Possível Cheater",
            ["description"] = "\nNick: ".. nick.."\n Steam:" .. steam.."\n IP:" ..ip.."\n",
            ["footer"] = {
                ["text"] = "Vistorie o mesmo",
            },
        }
    }

  PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end