local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista")


local aaa = false
function ToggleActionMenu()
	aaa = not aaa
	if aaa then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local CoordenadaX = 453.48
local CoordenadaY = -607.74
local CoordenadaZ = 28.57
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { x=309.95,y=-760.52,z=30.09 },
	[2] = { x=69.59,y=-974.80,z=30.14 },
	[3] = { x=95.00,y=-634.89,z=45.02 },
	[4] = { x=58.27,y=-283.32,z=48.20 },
	[5] = { x=47.74,y=-160.44,z=56.03 },
	[6] = { x=323.93,y=-267.58,z=54.71 },
	[7] = { x=443.75,y=119.16,z=100.41 },
	[8] = { x=125.62,y=-4.42,z=68.48 },
	[9] = { x=-524.08,y=133.59,z=63.91 },
	[10] = { x=-586.64,y=268.39,z=83.24 },
	[11] = { x=-640.38,y=-163.16,z=38.49 },
	[12] = { x=-597.89,y=-361.27,z=35.77 },
	[13] = { x=-646.06,y=-804.09,z=25.78 },
	[14] = { x=-932.63,y=-1199.67,z=5.91 },
	[15] = { x=-1234.65,y=-1080.87,z=9.12 },
	[16] = { x=-1373.99,y=-793.23,z=20.09 },
	[17] = { x=-2011.25,y=-160.04,z=29.40 },
	[18] = { x=-2981.70,y=404.50,z=15.75 },
	[19] = { x=-3101.58,y=1112.65,z=21.28 },
	[20] = { x=-2556.10,y=2322.01,z=33.89 },
	[21] = { x=-1094.86,y=2675.87,z=20.08 },
	[22] = { x=-72.63,y=2813.83,z=54.60 },
	[23] = { x=540.55,y=2685.25,z=43.20 },
	[24] = { x=1119.93,y=2682.04,z=39.31 },
	[25] = { x=1470.51,y=2725.47,z=38.48 },
	[26] = { x=2002.62,y=2603.65,z=55.07 },
	[27] = { x=379.58,y=-599.20,z=29.58 },
	[28] = { x=850.61328125,y=69.799438476563,z=67.542724609375},
	[29] = { x=717.00653076172,y=7.0212593078613,z=83.383476257324},
	[30] = { x=1017.6552124023,y=474.69067382813,z=95.634811401367},
	[31] = { x=1523.5881347656,y=824.99542236328,z=76.865333557129},
	[32] = { x=2431.8544921875,y=2861.3100585938,z=48.44787979126},
	[33] = { x=2296.7021484375,y=2999.2827148438,z=46.022369384766},
	[34] = { x=2245.2395019531,y=3235.6735839844,z=47.543769836426},
	[35] = { x=1923.8132324219,y=3257.2685546875,z=45.112487792969},
	[36] = { x=1176.2513427734,y=2975.5048828125,z=39.921745300293},
	[37] = { x=1141.6080322266,y=2695.2421875,z=37.550636291504},
	[38] = { x=611.53448486328,y=2700.6689453125,z=40.699077606201},
	[39] = { x=296.60238647461,y=2641.9306640625,z=44.070949554443},
	[40] = { x=-470.04107666016,y=2855.0844726563,z=33.628940582275},
	[41] = { x=-1107.3537597656,y=2681.9357910156,z=18.383943557739},
	[42] = { x=-2541.7404785156,y=2294.9780273438,z=32.23872756958},
	[43] = { x=-3091.546875,y=1335.8004150391,z=19.644758224487},
	[44] = { x=-3208.6750488281,y=1118.4012451172,z=9.5712099075317},
	[45] = { x=-3172.0280761719,y=907.31793212891,z=13.927681922913},
	[46] = { x=-3004.1076660156,y=409.40283203125,z=14.349877357483},
	[47] = { x=-2200.2512207031,y=-355.58557128906,z=12.590641975403},
	[48] = { x=-658.15679931641,y=-559.52203369141,z=34.149471282959},
	[49] = { x=-652.58679199219,y=-606.70764160156,z=32.659557342529},
	[50] = { x=-149.21115112305,y=-715.42248535156,z=34.135692596436},
	[51] = { x=-58.893852233887,y=-568.96771240234,z=37.705894470215},
	[52] = { x=467.64831542969,y=-624.27209472656,z=27.912242889404}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR ROTA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
					    ToggleActionMenu()
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
			if distance <= 50 then
				DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z-0.70,0,0,0,0,180.0,130.0,2.0,2.0,1.0,211,176,72,100,1,0,0,1)
				if distance <= 2.5 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("mi4")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("coach"))then
							RemoveBlip(blip)
							if destino == 27 then
								emP.checkPayment(300)
								destino = 0
								emservico = false
				                RemoveBlip(blip)
							end
							if destino == 57 then
								emP.checkPayment(500)
								destino = 0
								emservico = false
				                RemoveBlip(blip)
                            end								
							emP.checkPayment(0)
							destino = destino + 1
							CriandoBlip(entregas,destino)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if emservico then
			if IsControlJustPressed(0,168) then
				emservico = false
				RemoveBlip(blip)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(entregas,destino)
	blip = AddBlipForCoord(entregas[destino].x,entregas[destino].y,entregas[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
end
RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "rota1" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
        emservico = true
		destino = 1
		CriandoBlip(entregas,destino)
		ToggleActionMenu()
	elseif data == "rota2" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		emservico = true
		destino = 28
		CriandoBlip(entregas,destino)
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)