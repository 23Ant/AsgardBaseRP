local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

local dsDrogas = {
    ['maconha'] = {
        [1] = { ['X'] = 249.50 , ['Y'] = -1730.58 , ['Z'] = 29.66 , ['UN'] = 100 },
		[2] = { ['X'] = 939.68 , ['Y'] = -1458.23 , ['Z'] = 31.37 , ['UN'] = 100 },
		[3] = { ['X'] = 452.51 , ['Y'] = -1594.11 , ['Z'] = 29.29 , ['UN'] = 100 },
		[7] = { ['X'] = 464.66 , ['Y'] = -1672.70 , ['Z'] = 29.29 , ['UN'] = 100 },
		[8] = { ['X'] = -762.59 , ['Y'] = 431.94 , ['Z'] = 100.05 , ['UN'] = 100 },
		[6] = { ['X'] = -355.12 , ['Y'] = 470.06 , ['Z'] = 112.50 , ['UN'] = 100 },
		[7] = { ['X'] = -1215.71 , ['Y'] = 458.88 , ['Z'] = 91.85 , ['UN'] = 100 },
		[8] = { ['X'] = -1254.65 , ['Y'] = 666.42 , ['Z'] = 142.82 , ['UN'] = 100 },
		[9] = { ['X'] = 85.52 , ['Y'] = -1959.01 , ['Z'] = 21.12 , ['UN'] = 100 },
		[10] = { ['X'] = 191.83 , ['Y'] = -1883.86 , ['Z'] = 24.85 , ['UN'] = 100 }
	},
	['cocaina'] = {
        [1] = { ['X'] = 249.50 , ['Y'] = -1730.58 , ['Z'] = 29.66 , ['UN'] = 100 },
		[2] = { ['X'] = 939.68 , ['Y'] = -1458.23 , ['Z'] = 31.37 , ['UN'] = 100 },
		[3] = { ['X'] = 452.51 , ['Y'] = -1594.11 , ['Z'] = 29.29 , ['UN'] = 100 },
		[7] = { ['X'] = 464.66 , ['Y'] = -1672.70 , ['Z'] = 29.29 , ['UN'] = 100 },
		[8] = { ['X'] = -762.59 , ['Y'] = 431.94 , ['Z'] = 100.05 , ['UN'] = 100 },
		[6] = { ['X'] = -355.12 , ['Y'] = 470.06 , ['Z'] = 112.50 , ['UN'] = 100 },
		[7] = { ['X'] = -1215.71 , ['Y'] = 458.88 , ['Z'] = 91.85 , ['UN'] = 100 },
		[8] = { ['X'] = -1254.65 , ['Y'] = 666.42 , ['Z'] = 142.82 , ['UN'] = 100 },
		[9] = { ['X'] = 85.52 , ['Y'] = -1959.01 , ['Z'] = 21.12 , ['UN'] = 100 },
		[10] = { ['X'] = 191.83 , ['Y'] = -1883.86 , ['Z'] = 24.85 , ['UN'] = 100 }}
	},
	['lsd'] = {
        [1] = { ['X'] = 249.50 , ['Y'] = -1730.58 , ['Z'] = 29.66 , ['UN'] = 100 },
		[2] = { ['X'] = 939.68 , ['Y'] = -1458.23 , ['Z'] = 31.37 , ['UN'] = 100 },
		[3] = { ['X'] = 452.51 , ['Y'] = -1594.11 , ['Z'] = 29.29 , ['UN'] = 100 },
		[7] = { ['X'] = 464.66 , ['Y'] = -1672.70 , ['Z'] = 29.29 , ['UN'] = 100 },
		[8] = { ['X'] = -762.59 , ['Y'] = 431.94 , ['Z'] = 100.05 , ['UN'] = 100 },
		[6] = { ['X'] = -355.12 , ['Y'] = 470.06 , ['Z'] = 112.50 , ['UN'] = 100 },
		[7] = { ['X'] = -1215.71 , ['Y'] = 458.88 , ['Z'] = 91.85 , ['UN'] = 100 },
		[8] = { ['X'] = -1254.65 , ['Y'] = 666.42 , ['Z'] = 142.82 , ['UN'] = 100 },
		[9] = { ['X'] = 85.52 , ['Y'] = -1959.01 , ['Z'] = 21.12 , ['UN'] = 100 },
		[10] = { ['X'] = 191.83 , ['Y'] = -1883.86 , ['Z'] = 24.85 , ['UN'] = 100 }
	},
	['metanfetamina'] = {
        [1] = { ['X'] = 249.50 , ['Y'] = -1730.58 , ['Z'] = 29.66 , ['UN'] = 100 },
		[2] = { ['X'] = 939.68 , ['Y'] = -1458.23 , ['Z'] = 31.37 , ['UN'] = 100 },
		[3] = { ['X'] = 452.51 , ['Y'] = -1594.11 , ['Z'] = 29.29 , ['UN'] = 100 },
		[7] = { ['X'] = 464.66 , ['Y'] = -1672.70 , ['Z'] = 29.29 , ['UN'] = 100 },
		[8] = { ['X'] = -762.59 , ['Y'] = 431.94 , ['Z'] = 100.05 , ['UN'] = 100 },
		[6] = { ['X'] = -355.12 , ['Y'] = 470.06 , ['Z'] = 112.50 , ['UN'] = 100 },
		[7] = { ['X'] = -1215.71 , ['Y'] = 458.88 , ['Z'] = 91.85 , ['UN'] = 100 },
		[8] = { ['X'] = -1254.65 , ['Y'] = 666.42 , ['Z'] = 142.82 , ['UN'] = 100 },
		[9] = { ['X'] = 85.52 , ['Y'] = -1959.01 , ['Z'] = 21.12 , ['UN'] = 100 },
		[10] = { ['X'] = 191.83 , ['Y'] = -1883.86 , ['Z'] = 24.85 , ['UN'] = 100 }
	},
	['crack'] = {
        [1] = { ['X'] = 249.50 , ['Y'] = -1730.58 , ['Z'] = 29.66 , ['UN'] = 100 },
		[2] = { ['X'] = 939.68 , ['Y'] = -1458.23 , ['Z'] = 31.37 , ['UN'] = 100 },
		[3] = { ['X'] = 452.51 , ['Y'] = -1594.11 , ['Z'] = 29.29 , ['UN'] = 100 },
		[7] = { ['X'] = 464.66 , ['Y'] = -1672.70 , ['Z'] = 29.29 , ['UN'] = 100 },
		[8] = { ['X'] = -762.59 , ['Y'] = 431.94 , ['Z'] = 100.05 , ['UN'] = 100 },
		[6] = { ['X'] = -355.12 , ['Y'] = 470.06 , ['Z'] = 112.50 , ['UN'] = 100 },
		[7] = { ['X'] = -1215.71 , ['Y'] = 458.88 , ['Z'] = 91.85 , ['UN'] = 100 },
		[8] = { ['X'] = -1254.65 , ['Y'] = 666.42 , ['Z'] = 142.82 , ['UN'] = 100 },
		[9] = { ['X'] = 85.52 , ['Y'] = -1959.01 , ['Z'] = 21.12 , ['UN'] = 100 },
		[10] = { ['X'] = 191.83 , ['Y'] = -1883.86 , ['Z'] = 24.85 , ['UN'] = 100 }
	}
}
local donblips = nil
local donTrabalho = false
local donTipo = nil
local donRotaID = 0
local donQuantidade = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) then
            if donTrabalho == true then
				donblips = nil
				donTrabalho = false
				donTipo = nil
				donRotaID = 0
				donQuantidade = 0

			    RemoveBlip(DSMark)
				TriggerEvent("Notify","importante","Cancelado missao.")
				
				ocal ui = GetMinimapAnchor()
	            drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35," ",255,255,255,150)
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
	    --Citizen.Wait(600000)
		Citizen.Wait(1000)
	    if donTrabalho == false then 
            TriggerServerEvent('don_Permissao')	
	    end
	end
end)
RegisterNetEvent('don_Permissao')
AddEventHandler('don_Permissao',function(tipo)
    if tipo == 'maconha' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   local ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>MACONHA</> ",255,255,255,150)
	   
	   -- setar nui
    elseif tipo == 'cocaina' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>COCAINA</> ",255,255,255,150)
	   
	   -- setar nui
	elseif tipo == 'lsd' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>LSD</> ",255,255,255,150)
	   -- setar nui
	elseif tipo == 'metanfetamina' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>METANFETAMINA</> ",255,255,255,150)
	   
	   -- setar nui
	elseif tipo == 'crack' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>CRACK</> ",255,255,255,150)
	   
	   -- setar nui
	end
end)
RegisterNetEvent('don_Iniciar')
AddEventHandler('don_Iniciar',function(tipo)
    TriggerEvent("Notify","importante",""..tipo.."")
    if tipo == 'maconha' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   local ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>MACONHA</> ",255,255,255,150)
       
	   -- setar nui
    elseif tipo == 'cocaina' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>COCAINA</> ",255,255,255,150)
	   
	   -- setar nui
	elseif tipo == 'lsd' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>LSD</> ",255,255,255,150)
	   -- setar nui
	elseif tipo == 'metanfetamina' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>METANFETAMINA</> ",255,255,255,150)
	   
	   -- setar nui
	elseif tipo == 'crack' then
	
	   donTrabalho = true 
	   donTipo = tipo
	   donRotaID = random(1,10)
	   donQuantidade = random(1,5)
	   
	   CriandoBlip(dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z)
	   
	   ocal ui = GetMinimapAnchor()
	   drawTxt(ui.right_x+0.001,ui.bottom_y-0.1,1.0,1.0,0.35,"ENTREGUE "..donQuantidade.." UNIDADES DE <B>CRACK</> ",255,255,255,150)
	   
	   -- setar nui
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local dongetar = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z,true)
		if  dongetar < 10.0  then
            DrawMarker(20, dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
            if  dongetar < 1.0 and donCriado == false then
			    if IsControlJustPressed(0,38)and GetDistanceBetweenCoords(GetEntityCoords(donNPC),dsDrogas[donTipo][donRotaID].X , dsDrogas[donTipo][donRotaID].Y, dsDrogas[donTipo][donRotaID].Z,true) <= 0.5then
				   -- applyanim
				   TriggerServerEvent('don_Entrega', donTipo, donQuantidade, dsDrogas[donTipo][donRotaID].UN)	
				   RemoveBlip(donblips)
				end
				
			end
		end
	end
end)








function CriandoBlip(donx , dony, donz)
	donblips = AddBlipForCoord(donx , dony, donz)
	SetBlipSprite(donblips,1)
	SetBlipColour(donblips,5)
	SetBlipScale(donblips,0.4)
	SetBlipAsShortRange(donblips,false)
	SetBlipRoute(donblips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Farm de drogas - By Don_Speed")
	EndTextCommandSetBlipName(donblips)
end
function drawTxt(x,y,width,height,scale,text,r,g,b,a)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
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