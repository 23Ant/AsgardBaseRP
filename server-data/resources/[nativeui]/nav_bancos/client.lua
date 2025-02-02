local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPNserver = Tunnel.getInterface("nav_bancos")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANCOS
-----------------------------------------------------------------------------------------------------------------------------------------
local bancos = {
	{ -1212.63,-330.80,37.78 },
	{ -351.02,-49.97,49.04 },
	{ 314.13,-279.09,54.17 },
	{ 149.85,-1040.71,29.37 },
	{ -2962.56,482.95,15.70 },
	{ -111.97,6469.19,31.62 },
	{ 1175.05,2706.90,38.09 },
	{ -31.49,-1121.44,26.55 },
	{ -1314.76,-835.98,16.96 },
	{ -1315.72,-834.70,16.96 },
	{ 147.57,-1035.77,29.34 },
	{ 145.96,-1035.19,29.34 },
	{ 24.45,-945.97,29.35 },
	{ 5.24,-919.84,29.55 },
	{ 119.08,-883.70,31.12 },
	{ 112.60,-819.41,31.33 },
	{ 114.41,-776.43,31.41 },
	{ 111.30,-775.25,31.43 },
	{ 296.46,-894.22,29.23 },
	{ 295.77,-896.10,29.22 },
	{ -203.83,-861.38,30.26 },
	{ -301.70,-830.00,32.41 },
	{ -303.28,-829.72,32.41 },
	{ 289.08,-1256.83,29.44 },
	{ 288.84,-1282.33,29.63 },
	{ 33.16,-1348.25,29.49 },
	{ -56.89,-1752.10,29.42 },
	{ -721.04,-415.52,34.98 },
	{ 89.69,2.47,68.30 },
	{ 527.35,-160.72,57.09 },
	{ -846.29,-341.30,38.68 },
	{ -846.83,-340.21,38.68 },
	{ -1205.03,-326.27,37.84 },
	{ -1205.76,-324.80,37.85 },
	{ -1305.40,-706.38,25.32 },
	{ 158.63,234.22,106.62 },
	{ 1153.77,-326.69,69.20 },
	{ 1167.00,-456.07,66.79 },
	{ 1138.23,-468.91,66.73 },
	{ 238.33,215.97,106.28 },
	{ 237.90,216.88,106.28 },
	{ 237.48,217.78,106.28 },
	{ 237.05,218.71,106.28 },
	{ 236.61,219.66,106.28 },
	{ 285.43,143.39,104.17 },
	{ 356.96,173.55,103.06 },
	{ 380.75,323.37,103.56 },
	{ 228.19,338.37,105.56 },
	{ 1077.70,-776.54,58.24 },
	{ -165.14,232.74,94.92 },
	{ -165.15,234.81,94.92 },
	{ -3040.78,593.09,7.90 },
	{ -1827.29,784.87,138.30 },
	{ 540.32,2671.14,42.15 },
	{ -2072.36,-317.29,13.31 },
	{ 2683.11,3286.56,55.24 },
	{ 1171.52,2702.57,38.17 },
	{ 1172.49,2702.59,38.17 },
	{ -2956.88,487.64,15.46 },
	{ -2958.99,487.74,15.46 },
	{ -526.60,-1222.90,18.45 },
	{ -717.71,-915.70,19.21 },
	{ 1701.19,6426.50,32.76 },
	{ 1735.22,6410.51,35.03 },
	{ -3241.15,997.61,12.55 },
	{ -3144.37,1127.60,20.85 },
	{ 174.14,6637.93,31.57 },
	{ 155.91,6642.87,31.60 },
	{ -95.54,6457.18,31.46 },
	{ -97.25,6455.44,31.46 },
	{ 1968.09,3743.53,32.34 },
	{ 1703.01,4933.54,42.06 },
	{ 2558.82,351.01,108.62 },
	{ 2558.48,389.45,108.62 },
	{ -386.72,6046.08,31.50 },
	{ -282.98,6226.08,31.49 },
	{ -132.93,6366.53,31.47 },
	{ -1571.03,-547.37,34.95 },
	{ -1570.09,-546.69,34.95 },
	{ -712.89,-818.90,23.72 },
	{ -709.99,-818.89,23.72 },
	{ -273.06,-2024.50,30.14 },
	{ -262.00,-2012.28,30.14 },
	{ -821.66,-1081.91,11.13 },
	{ 129.24,-1291.15,29.26 },
	{ 129.68,-1291.92,29.26 },
	{ 130.10,-1292.64,29.26 },
	{ -1391.03,-590.32,30.31 },
	{ 1686.84,4815.79,42.00 },
	{ -258.84,-723.36,33.47 },
	{ -256.22,-715.97,33.52 },
	{ -254.41,-692.47,33.60 },
	{ 296.17,-591.52,43.27 },
	{ 419.05,-986.33,29.38 },
	{ -618.28,-708.93,30.05 },
	{ -618.23,-706.90,30.05 },
	{ -614.59,-704.84,31.23 },
	{ -611.94,-704.82,31.23 },
	{ -3240.59,1008.60,12.83 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAIXA ELETRÔNICO
-----------------------------------------------------------------------------------------------------------------------------------------
local caixas = {

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local hora = 0
function CalculateTimeToDisplay()
	hora = GetClockHours()
	if hora <= 9 then
		hora = "0" .. hora
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPOSITAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("depositar",function(source,args)
	for _,v in pairs(bancos) do
		local x,y,z = table.unpack(v)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
		if distance <= 3 then
			CalculateTimeToDisplay()
			if parseInt(hora) >= 07 and parseInt(hora) <= 17 then
				vRPNserver.Depositar(parseInt(args[1]))
			else
				TriggerEvent("Notify","importante","Funcionamento dos bancos é das <b>07:00</b> as <b>18:00</b>.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SACAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("sacar",function(source,args)
	if args[1] then
		for _,v in pairs(bancos) do
			local x,y,z = table.unpack(v)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 1 then
				CalculateTimeToDisplay()
				if parseInt(hora) >= 07 and parseInt(hora) <= 17 then
					vRPNserver.Sacar(parseInt(args[1]))
				else
					TriggerEvent("Notify","importante","Funcionamento dos bancos é das <b>07:00</b> as <b>18:00</b>.")
				end
			end
		end
	else
		for _,v in pairs(caixas) do
			local x,y,z = table.unpack(v)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 1 then
				vRPNserver.Sacar()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MULTAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("multas",function(source,args)
	for _,v in pairs(bancos) do
		local x,y,z = table.unpack(v)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
		if distance <= 3 then
			CalculateTimeToDisplay()
			if parseInt(hora) >= 07 and parseInt(hora) <= 17 then
				vRPNserver.Multas(parseInt(args[1]))
			else
				TriggerEvent("Notify","importante","Funcionamento dos bancos é das <b>07:00</b> as <b>18:00</b>.")
			end
		end
	end
end)