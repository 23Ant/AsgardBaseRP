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

--[[	
              vrp/cfg/item.lua
    
    ["partspistol"] = { "Peças Pistola", 0.5},
	["wammopistol"] = { "(M)Peças Pistola", 0.1},
	
	["partsminismg"] = { "Peças SMG", 0.5},
	["wammominismg"] = { "(M)Peças SMG", 0.1},
	
	["partsassault"] = { "Peças Assault", 1.0},
	["wammoassault"] = { "(M)Peças Assault", 0.1},
	
	
	
	        vrp_inventario/config
			
	items["partspistol"] = {"none",0 ,0 ,0 , "WEAPON_PISTOL.png"}
	items["wammopistol"] = {"none",0 ,0 ,0 , "municaopistola.png"}
	items["partsminismg"] = {"none",0 ,0 ,0 , "WEAPON_MICROSMG.png"}
	items["wammominismg"] = {"none",0 ,0 ,0 , "municaopistola.png"}
	items["partsassault"] = {"none",0 ,0 ,0 , "WEAPON_ASSAULTRIFLE.png"}
	items["wammoassault"] = {"none",0 ,0 ,0 , "municaorifle.png"}

]]
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

local dsBlipWeapon = nil
local dsEmRota = false
local dsYRota = nil

local dsWeapon = {
    -- weapon_pistol
    [1] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[2] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[3] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[4] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[5] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[6] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[7] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[8] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[9] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	[10] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partspistol"} ,
	
	[11] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[12] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[13] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[14] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[15] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[16] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[17] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[18] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[19] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	[20] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 30 ,['parts'] = "wammopistol"} ,
	-- weapon_minismg
	[21] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[22] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[23] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[24] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[25] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[26] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[27] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[28] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[29] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	[30] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 1500 ,['parts'] = "partsminismg"} ,
	
	[31] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[32] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[33] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[34] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[35] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[36] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[37] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[38] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[39] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	[30] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 50 ,['parts'] = "wammominismg"} ,
	
	-- weapon_assaultrifle
	[31] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[32] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[33] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[34] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[35] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[36] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[37] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[38] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[39] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	[40] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 3 ,['wvalor'] = 5000 ,['parts'] = "partsassault"} ,
	
	[41] = { ['x'] = 1689.60 ,['y'] = 3757.78 ,['z'] = 34.70 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[42] = { ['x'] = 255.19 ,['y'] = -46.53 ,['z'] = 69.94 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[43] = { ['x'] = 846.81 ,['y'] = -1035.20 ,['z'] = 28.35 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[44] = { ['x'] = -666.68 ,['y'] = -933.75 ,['z'] = 21.82 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[45] = { ['x'] = -1303.21 ,['y'] = -390.42 ,['z'] = 36.69 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[46] = { ['x'] = -1122.14 ,['y'] = 2696.84 ,['z'] = 18.55 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[47] = { ['x'] = 2572.35 ,['y'] = 292.77 ,['z'] = 108.73 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[48] = { ['x'] = -3175.13 ,['y'] = 1084.32 ,['z'] = 20.83 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[49] = { ['x'] = 18.78 ,['y'] = -1109.03 ,['z'] = 29.79 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
	[50] = { ['x'] = 819.70 ,['y'] = -2155.37 ,['z'] = 29.61 ,['wqtd'] = 100 ,['wvalor'] = 100 ,['parts'] = "wammoassault"} ,
}

Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		local dsTrabalhoYakuza = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -2673.46 , 1336.17 , 144.26 , true)
		if dsTrabalhoYakuza < 4.0  then
		    sdDrawText3Ds( -2673.46 , 1336.17 , 144.26 , "[H] PARA INICIAR BUSCA DE <b>PEÇAS DE ARMAS</b>")
			DrawMarker(20, -2673.46 , 1336.17 , 144.26 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsEmRota == false then
			   TriggerServerEvent('Don_Speed:PermissaoWeapon', "yakuza.permissao")
		    end
		end
		local TrabalhoYakuza = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1398.36,1156.91,114.33 , true)
		if TrabalhoYakuza < 4.0  then
		    sdDrawText3Ds( 1398.36, 1156.91,114.33 , "[H] PARA INICIAR BUSCA DE <b>PEÇAS DE ARMAS</b>")
			DrawMarker(20, 1398.36, 1156.91,114.33 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74) and dsEmRota == false then
			   TriggerServerEvent('Don_Speed:PermissaoWeapon', "mafia.permissao")
		    end
		end
		
		
	end
end)
RegisterNetEvent("Don_Speed:ContinuaWeapon")
AddEventHandler("Don_Speed:ContinuaWeapon",function()

    RemoveBlip(dsBlipWeapon)
    dsEmRota = true
    dsYRota = math.random(1, 50)	
    CriandoBlip(dsWeapon[dsYRota].x,dsWeapon[dsYRota].y, dsWeapon[dsYRota].z)
	
	PlaySoundFrontend(-1,"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET",false)
	
	TriggerEvent("Notify","sucesso","Siga sua rota , para obter suas peças .")
	
end)
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		if dsEmRota then
		    local dsWeaponblip = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z, true)
		    if dsWeaponblip < 4.0  then
		
		        sdDrawText3Ds(dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z, "[H] PARA COMPRAR PEAÇS DESTA LOJA")
			    DrawMarker(20,dsWeapon[dsYRota].x, dsWeapon[dsYRota].y, dsWeapon[dsYRota].z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				
				if IsControlJustPressed(0,74)then
			        TriggerServerEvent('Don_Speed:WeacomComprar', "yakuza.permissao",dsWeapon[dsYRota].wqtd, dsWeapon[dsYRota].wvalor, dsWeapon[dsYRota].parts)
		        end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(1)
		local dsTransformar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -2678.50,1330.30,140.88 , true)
		if dsTransformar < 4.0  then
		    sdDrawText3Ds( -2678.50,1330.30,140.88 , "[H] PARA INICIAR A MONTAGEM DA <b>ARMA</b>")
			DrawMarker(20, -2678.50,1330.30,140.88 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74)then
			   TriggerServerEvent('Don_Speed:MontagemWeapon', "yakuza.permissao")
		    end
		end
		
		local Transformar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1393.14 , 1134.80 , 114.33 , true)
		if Transformar < 4.0  then
		    sdDrawText3Ds( 1393.14 , 1134.80 , 114.33 , "[H] PARA INICIAR A MONTAGEM DA <b>ARMA</b>")
			DrawMarker(20, 1393.14 , 1134.80 , 114.33 ,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
		    if IsControlJustPressed(0,74)then
			   TriggerServerEvent('Don_Speed:MontagemWeapon', "mafia.permissao")
		    end
		end
	end
end)

----------------------------
Citizen.CreateThread(function() -- Don_Speed / Cancelar missao
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) then
			RemoveBlip(dsBlipWeapon)
		    dsBlipWeapon = nil
            dsEmRota = false
            dsYRota = nil
			PlaySoundFrontend(-1,"ScreenFlash", "MissionFailedSounds",false)
		end
	end
end)

function CriandoBlip(x,y,z)
	dsBlipWeapon = AddBlipForCoord(x,y,z)
	SetBlipSprite(dsBlipWeapon,1)
	SetBlipColour(dsBlipWeapon,5)
	SetBlipScale(dsBlipWeapon,0.7)
	SetBlipAsShortRange(dsBlipWeapon,false)
	SetBlipRoute(dsBlipWeapon,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de drogas")
	EndTextCommandSetBlipName(dsBlipWeapon)
end

function sdDrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
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