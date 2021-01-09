local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_assaltobanco")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local andamento = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1, ['x'] = -353.310, ['y'] = -54.129, ['z'] = 49.036, ['h'] = 230.0 },
	{ ['id'] = 2, ['x'] =  263.698, ['y'] = 214.275, ['z'] = 101.683, ['h'] = 230.0 },
	{ ['id'] = 3, ['x'] =  311.662, ['y'] = -283.405, ['z'] = 54.164, ['h'] = 230.0 },
	{ ['id'] = 4, ['x'] =  -1211.208, ['y'] = -335.544, ['z'] = 37.780, ['h'] = 230.0 },
	{ ['id'] = 5, ['x'] =  -2957.618, ['y'] = 481.821, ['z'] = 15.697, ['h'] = 230.0 },
	{ ['id'] = 6, ['x'] =  -103.917, ['y'] = 6477.572, ['z'] = 31.626, ['h'] = 230.0 },
	{ ['id'] = 7, ['x'] =  1175.897, ['y'] = 2711.786, ['z'] = 38.087, ['h'] = 230.0 },
} 
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIO/CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if andamento then
				drawTxt("APERTE ~r~M~w~ PARA CANCELAR O ROUBO EM ANDAMENTO",4,0.5,0.91,0.36,255,255,255,30)
				drawTxt("RESTAM ~g~"..segundos.." SEGUNDOS ~w~PARA TERMINAR",4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(0,244) or GetEntityHealth(ped) <= 100 then
					andamento = false
					ClearPedTasks(ped)
					func.cancelRobbery()
					TriggerEvent('cancelando',false)
				end
			else
				if distance <= 1.5 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR O ROUBO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
							func.checkRobbery(v.id,v.x,v.y,v.z,v.h)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIADO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciandoassaltobanco")
AddEventHandler("iniciandoassaltobanco",function(x,y,z,secs,head)
	segundos = secs
	andamento = true
	SetEntityHeading(PlayerPedId(),head)
	SetEntityCoords(PlayerPedId(),x,y,z-1,false,false,false,false)
	SetPedComponentVariation(PlayerPedId(),5,45,0,2)
	SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
	TriggerEvent('cancelando',true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				andamento = false
				ClearPedTasks(PlayerPedId())
				TriggerEvent('cancelando',false)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARCAÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
local blip = nil
RegisterNetEvent('blip:criar:assaltobanco')
AddEventHandler('blip:criar:assaltobanco',function(x,y,z)
	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(x,y,z)
		SetBlipScale(blip,0.5)
		SetBlipSprite(blip,1)
		SetBlipColour(blip,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo: Banco")
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,false)
		SetBlipRoute(blip,true)
	end
end)

RegisterNetEvent('blip:remover:assaltobanco')
AddEventHandler('blip:remover:assaltobanco',function()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end
end)