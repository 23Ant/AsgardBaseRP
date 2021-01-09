local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	["MAFIA"] = {
		positionFrom = { ['x'] = 1395.45, ['y'] = 1141.90, ['z'] = 114.64 },
		positionTo = { ['x'] = 1397.02, ['y'] = 1141.87, ['z'] = 114.33 }
	},
	["HOSPITAL"] = {
		positionFrom = { ['x'] = 339.77, ['y'] = -595.02, ['z'] = 28.79 },
		positionTo = { ['x'] = 338.62, ['y'] = -583.68, ['z'] = 74.16 }
	}
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(Teleport) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.positionFrom.x,v.positionFrom.y,v.positionFrom.z)
			local distance = GetDistanceBetweenCoords(v.positionFrom.x,v.positionFrom.y,cdz,x,y,z,true)
			local bowz,cdz2 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance2 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz2,x,y,z,true)

			if distance <= 10 then
				DrawMarker(1,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),v.positionTo.x,v.positionTo.y,v.positionTo.z-0.50)
					end
				end
			end

			if distance2 <= 10 then
				DrawMarker(1,v.positionTo.x,v.positionTo.y,v.positionTo.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38)  then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS  
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1, ['x'] = 2224.06, ['y'] = 5576.97, ['z'] = 53.84, ['text'] = "ADUBO", ['perm'] = "maconha.permissao" },
	{ ['id'] = 2, ['x'] = 1664.67, ['y'] = -49.47, ['z'] = 168.31, ['text'] = "FERTILIZANTE", ['perm'] = "maconha.permissao" }, 
	{ ['id'] = 3, ['x'] = 1660.48, ['y'] = -49.54, ['z'] = 168.31, ['text'] = "MACONHA", ['perm'] = "maconha.permissao" },

	{ ['id'] = 14, ['x'] = 79.68, ['y'] = 3705.68, ['z'] = 41.07, ['text'] = "ANFETAMINA", ['perm'] = "meta.permissao" },
	{ ['id'] = 15, ['x'] = 1415.98, ['y'] = -697.7, ['z'] = 69.99, ['text'] = "metanfetamina", ['perm'] = "meta.permissao" },

	{ ['id'] = 10, ['x'] = 1998.01, ['y'] = 4839.34, ['z'] = 43.62, ['text'] = "COCA MOÍDA", ['perm'] = "cocaina.permissao" },
	{ ['id'] = 11, ['x'] = 719.82, ['y'] = -269.27, ['z'] = 62.69, ['text'] = "COCAÍNA", ['perm'] = "cocaina.permissao" }, 
	
	{ ['id'] = 17, ['x'] = 749.47, ['y'] = -1061.07, ['z'] = 21.85, ['text'] = "BICARBONATO", ['perm'] = "crack.permissao" }, -- roxos
	{ ['id'] = 18, ['x'] = 729.54, ['y'] = -1056.96, ['z'] = 22.04, ['text'] = "CLORIDRATO", ['perm'] = "crack.permissao" }, -- roxos
	{ ['id'] = 19, ['x'] = 722.94, ['y'] = -1069.52, ['z'] = 23.06, ['text'] = "CRACK", ['perm'] = "crack.permissao" },
	
	{ ['id'] = 20, ['x'] = 1397.20, ['y'] = 3611.68, ['z'] = 34.98, ['text'] = "ACIDO", ['perm'] = "lsd.permissao" }, -- roxos
	{ ['id'] = 21, ['x'] = 1389.94, ['y'] = 3608.77, ['z'] = 38.94, ['text'] = "LSD", ['perm'] = "lsd.permissao" }, -- roxos
	
	{ ['id'] = 30, ['x'] = 711.47, ['y'] = -969.38, ['z'] = 30.39, ['text'] = "TECIDO BALISTICO", ['perm'] = "vanilla.permissao" }, -- vanilla
	{ ['id'] = 31, ['x'] = 716.58, ['y'] = -962.30, ['z'] = 30.39, ['text'] = "COLETE BALISTICO", ['perm'] = "vanilla.permissao" }, -- vanilla
	
	{ ['id'] = 32, ['x'] = -334.77, ['y'] = 6081.91, ['z'] = 31.45, ['text'] = "POLVORA", ['perm'] = "mafia.permissao" },
	
	{ ['id'] = 34, ['x'] = -580.02, ['y'] = 5354.68, ['z'] = 70.21, ['text'] = "RECEPIENTE MAÇARICO", ['perm'] = "vanilla.permissao" }, -- vanilla
	{ ['id'] = 35, ['x'] = -773.36, ['y'] = 5400.97, ['z'] = 38.82, ['text'] = "MAÇARICO", ['perm'] = "vanilla.permissao" }, -- vanilla
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 6.0 and not processo then
				DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				DrawText3D(v.x,v.y,v.z, "PRESSIONE  ~b~E~w~  PARA PRODUZIR "..v.text.."")
				if distance <= 1.2 and not processo then
					if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
						if func.checkPayment(v.id) then
							processo = true
							TriggerEvent('cancelando',true)
							TriggerEvent("progress",10000,"produzindo")
							SetTimeout(10000,function()
								processo = false
								TriggerEvent('cancelando',false)
							end)
						end
					end
				end
		end	end
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
function DrawText3D(x,y,z, text)
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
end