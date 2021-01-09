local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emp = Tunnel.getInterface("leiteiro_entregas")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local quantidade = 0 
local statuses = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { x = 1135.35,y = -980.69, z = 46.41 },
	[2] = { x = 25.75, y = -1346.49, z = 29.49 },
	[3] = { x = -48.54, y = -1758.17,z = 29.42 },
	[4] = { x = 373.69, y = 325.99, z = 103.56 },
	[5] = { x = 1163.37, y = -322.49, z = 69.20 },
	[6] = { x = -1487.80, y = -378.52, z = 40.16 },
	[7] = { x = -2967.94, y = 389.41, z = 15.04 },
	[8] = { x = -707.40, y = -914.98, z = 19.21 },
	[9] = { x = -1224.17, y = -908.10, z = 12.32 }


}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('leiteiro_entregas:permissao')
AddEventHandler('leiteiro_entregas:permissao',function()
	if not emservico then
		emservico = true
		destino = math.random(1,8)
		quantidade = math.random(1,6)
		CriandoBlip(entregas,destino)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA 
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not emservico then 
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 173.10,-26.04,68.34,true) <= 1 then
				DrawMarker(20,173.10,-26.04,68.34,0,0,0,0,340.0,130.0,0.5,0.5,0.5,255,25,25,55,0,1,0,0)
				DrawText3Ds(173.10,-26.04,68.34+0.5,"PRESSIONE ~r~E~w~ PARA ENTREGAR LEITE")
				if IsControlJustPressed(0,38) then	
					TriggerEvent('leiteiro_entregas:permissao')
				end
			end
		else
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 173.10,-26.04,68.34,true) <= 1 then
				DrawMarker(20,173.10,-26.04,68.34,0,0,0,0,180.0,130.0,0.5,0.5,0.5,25,255,25,55,0,0,0,0)
				DrawText3Ds(173.10,-26.04,68.34,"~w~VOCÊ É UM LEITEIRO.")
			end
			local ui = GetMinimapAnchor()
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
			if IsControlJustPressed(0,56) then	
				statuses = not statuses
			end
			if statuses then
				drawTxt(ui.right_x+0.005,ui.bottom_y-0.185,1.0,1.0,0.35,"PRESSIONE ~r~F11 ~w~PARA CANCELAR A MISSÃO",255,255,255,150)
				drawTxt(ui.right_x+0.005,ui.bottom_y-0.115,1.0,1.0,0.45,"ENTREGUE ~g~"..quantidade.."~w~ GARRAFA DE LEITE",255,255,255,255)
			else
				drawTxt(ui.right_x+0.005,ui.bottom_y-0.185,1.0,1.0,0.35,"PRESSIONE ~r~F9 ~w~PARA VER A MISSÃO",255,255,255,150)
			end
			if distance <= 50 then
				DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z+0.10,0,0,0,0,180.0,130.0,1.0,1.0,1.0,211,176,72,100,1,0,0,1)
				if distance < 3 then
					DrawText3Ds(entregas[destino].x,entregas[destino].y,entregas[destino].z, "[H] ENTREGAR")
                    if IsControlJustPressed(0,101) then
                        destinoantigo = destino
                        RemoveBlip(blip)
                        TriggerServerEvent('leiteiro_entregas:itensReceber', quantidade)
                        while true do
                            if destinoantigo == destino then
								destino = math.random(1,10)
								quantidade = math.random(1,6)
                            else
                                break
                            end
                            Citizen.Wait(1)
                        end
                        CriandoBlip(entregas,destino)
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
		if IsControlJustPressed(0,344) and emservico then
			emservico = false
			RemoveBlip(blip)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------

function drawTxt(x,y,width,height,scale,text,r,g,b,a)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

function DrawText3Ds(x,y,z, text)
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

function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

function CriandoBlip(entregas,destino)
	blip = AddBlipForCoord(entregas[destino].x,entregas[destino].y,entregas[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.7)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Leite")
	EndTextCommandSetBlipName(blip)
end