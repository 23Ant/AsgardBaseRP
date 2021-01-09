local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPg = {}
Tunnel.bindInterface("vrp_adv_garages",vRPg)
Proxy.addInterface("vrp_adv_garages",vRPg)

local vehicles = {}
local mods = {}
local toggles = {}
local colors = {}
local wheel = 0

function vRPg.toggleNeon(neon)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		if not toggles[neon] then toggles[neon] = false end
		toggles[neon] = not toggles[neon]
		SetVehicleNeonLightEnabled(veh,neon,toggles[neon])
	end
end

function vRPg.setNeonColour(r,g,b)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		SetVehicleNeonLightsColour(veh,r,g,b)
	end
end

function vRPg.setSmokeColour(r,g,b)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		SetVehicleTyreSmokeColor(veh,r,g,b)
	end
end

function vRPg.scrollVehiclePrimaryColour(pmod)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		if not colors[1] then colors[1] = 0 end
		colors[1] = colors[1]+pmod
		if colors[1] > 160 then colors[1] = 0 end
		if colors[1] < 0 then colors[1] = 160 end
		SetVehicleModKit(veh,0)
		ClearVehicleCustomPrimaryColour(veh)
		SetVehicleColours(veh,colors[1],colors[2])
	end
end

function vRPg.scrollVehicleSecondaryColour(smod)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		if not colors[2] then colors[2] = 0 end
		colors[2] = colors[2]+smod
		if colors[2] > 160 then colors[2] = 0 end
		if colors[2] < 0 then colors[2] = 160 end
		SetVehicleModKit(veh,0)
		ClearVehicleCustomSecondaryColour(veh)
		SetVehicleColours(veh,colors[1],colors[2])
	end
end

function vRPg.setCustomPrimaryColour(r,g,b)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		SetVehicleCustomPrimaryColour(veh,r,g,b)
	end
end

function vRPg.setCustomSecondaryColour(r,g,b)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		SetVehicleCustomSecondaryColour(veh,r,g,b)
	end
end

function vRPg.scrollVehiclePearlescentColour(emod)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		if not colors[3] then colors[3] = 0 end
		SetVehicleModKit(veh,0)
		colors[3] = colors[3]+emod
		if colors[3] > 160 then colors[3] = 0 end
		if colors[3] < 0 then colors[3] = 160 end
		SetVehicleExtraColours(veh,colors[3],colors[4])
	end
end

function vRPg.scrollVehicleWheelColour(wmod)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		if not colors[4] then colors[4] = 0 end
		SetVehicleModKit(veh,0)
		colors[4] = colors[4]+wmod
		if colors[4] > 160 then colors[4] = 0 end
		if colors[4] < 0 then colors[4] = 160 end
		SetVehicleExtraColours(veh,colors[3],colors[4])
	end
end
  
function vRPg.scrollVehicleMods(mod,add)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		local num = GetNumVehicleMods(veh,mod)

		if mod == 35 or mod == 26 then 
			num = GetNumberOfVehicleNumberPlates() 
		elseif mod == 46 then
			num = 6 
		end

		SetVehicleModKit(veh,0)
		if not mods[mod] then mods[mod] = 0 end
		mods[mod] = mods[mod] + add
	  
		if mod > 17 and mod < 23 then
			if toggles[mod] == nil then toggles[mod] = false end
			toggles[mod] = not toggles[mod]
			ToggleVehicleMod(veh,mod,toggles[mod])
			if toggles[mod] then
				TriggerEvent("Notify","sucesso","Aplicada com sucesso.")
			else
				TriggerEvent("Notify","negado","Removida com sucesso.")
			end

		elseif (mod == 23 or mod == 24) and add == 0 then
			wheel = wheel+1
			if wheel > 7 then wheel = 0 end
			SetVehicleWheelType(veh,wheel)
			SetVehicleMod(veh,mod,mods[mod])

		elseif mod == 49 then
			if GetVehicleModVariation(veh,23) == 1 then
				SetVehicleMod(veh,23,mods[23],false)
				SetVehicleMod(veh,24,mods[24],false)
			else
				SetVehicleMod(veh,23,mods[23],true)
				SetVehicleMod(veh,24,mods[24],true)
			end

		elseif num == 0 then
			TriggerEvent("Notify","importante","Nenhuma modificação disponível para este veículo.")
		elseif mods[mod] > num then
			mods[mod] = num
			TriggerEvent("Notify","importante","Atingiu o máximo.")
		elseif mods[mod] < 0 then
			mods[mod] = 0
			TriggerEvent("Notify","importante","Atingiu o mínimo.")
		elseif mod == 35 or mod == 26 then
			SetVehicleNumberPlateTextIndex(veh,mods[mod])
		elseif mod == 46 then
			SetVehicleWindowTint(veh,mods[mod])
		else
			SetVehicleMod(veh,mod,mods[mod],false)
			if mod == 16 and mods[mod] > 3 then
				SetVehicleTyresCanBurst(veh,true)
			elseif mod == 16 then
				SetVehicleTyresCanBurst(veh,false)
			end
		end
	end
end

function vRPg.getVehicleMods()
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(veh) then
		local placa,vname,vnet = vRP.ModelName(7)
		if vname then
			local custom = {}
			if DoesEntityExist(veh) then
				local colours = table.pack(GetVehicleColours(veh))
				local extra_colors = table.pack(GetVehicleExtraColours(veh))

				custom.plate = {}
				custom.plate.text = GetVehicleNumberPlateText(veh)
				custom.plate.index = GetVehicleNumberPlateTextIndex(veh)

				custom.colour = {}
				custom.colour.primary = colours[1]
				custom.colour.secondary = colours[2]
				custom.colour.pearlescent = extra_colors[1]
				custom.colour.wheel = extra_colors[2]

				colors[1] = custom.colour.primary
				colors[2] = custom.colour.secondary
				colors[3] = custom.colour.pearlescent
				colors[4] = custom.colour.wheel

				custom.colour.neon = table.pack(GetVehicleNeonLightsColour(veh))
				custom.colour.smoke = table.pack(GetVehicleTyreSmokeColor(veh))

				custom.colour.custom = {}
				custom.colour.custom.primary = table.pack(GetVehicleCustomPrimaryColour(veh))
				custom.colour.custom.secondary = table.pack(GetVehicleCustomSecondaryColour(veh))

				custom.mods = {}
				for i=0,49 do
					custom.mods[i] = GetVehicleMod(veh, i)
				end

				custom.mods[46] = GetVehicleWindowTint(veh)
				custom.mods[18] = IsToggleModOn(veh,18)
				custom.mods[20] = IsToggleModOn(veh,20)
				custom.mods[22] = IsToggleModOn(veh,22)
				custom.turbo = IsToggleModOn(veh,18)
				custom.janela = GetVehicleWindowTint(veh)
				custom.fumaca = IsToggleModOn(veh,20)
				custom.farol = IsToggleModOn(veh,22)
				custom.tyres = GetVehicleMod(veh,23)
				custom.tyresvariation = GetVehicleModVariation(veh,23)

				mods = custom.mods
				toggles[18] = custom.mods[18]
				toggles[20] = custom.mods[20]
				toggles[22] = custom.mods[22]

				custom.neon = {}
				custom.neon.left = IsVehicleNeonLightEnabled(veh,0)
				custom.neon.right = IsVehicleNeonLightEnabled(veh,1)
				custom.neon.front = IsVehicleNeonLightEnabled(veh,2)
				custom.neon.back = IsVehicleNeonLightEnabled(veh,3)

				custom.bulletproof = GetVehicleTyresCanBurst(veh)
				custom.wheel = GetVehicleWheelType(veh)
				wheel = custom.wheel
				return vname,custom
			end
		end
	end
	return false,false
end

function vRPg.setVehicleMods(custom,veh)
	if not veh then
		veh = GetVehiclePedIsUsing(PlayerPedId())
	end
	if custom and veh then
		SetVehicleModKit(veh,0)
		if custom.colour then
			SetVehicleColours(veh,tonumber(custom.colour.primary),tonumber(custom.colour.secondary))
			SetVehicleExtraColours(veh,tonumber(custom.colour.pearlescent),tonumber(custom.colour.wheel))
			if custom.colour.neon then
				SetVehicleNeonLightsColour(veh,tonumber(custom.colour.neon[1]),tonumber(custom.colour.neon[2]),tonumber(custom.colour.neon[3]))
			end
			if custom.colour.smoke then
				SetVehicleTyreSmokeColor(veh,tonumber(custom.colour.smoke[1]),tonumber(custom.colour.smoke[2]),tonumber(custom.colour.smoke[3]))
			end
			if custom.colour.custom then
				if custom.colour.custom.primary then
					SetVehicleCustomPrimaryColour(veh,tonumber(custom.colour.custom.primary[1]),tonumber(custom.colour.custom.primary[2]),tonumber(custom.colour.custom.primary[3]))
				end
				if custom.colour.custom.secondary then
					SetVehicleCustomSecondaryColour(veh,tonumber(custom.colour.custom.secondary[1]),tonumber(custom.colour.custom.secondary[2]),tonumber(custom.colour.custom.secondary[3]))
				end
			end
		end

		if custom.plate then
			SetVehicleNumberPlateTextIndex(veh,tonumber(custom.plate.index))
		end

		SetVehicleWindowTint(veh,tonumber(custom.janela))
		SetVehicleTyresCanBurst(veh,tonumber(custom.bulletproof))
		SetVehicleWheelType(veh,tonumber(custom.wheel))

		ToggleVehicleMod(veh,18,tonumber(custom.turbo))
		ToggleVehicleMod(veh,20,tonumber(custom.fumaca))
		ToggleVehicleMod(veh,22,tonumber(custom.farol))

		if custom.neon then
			SetVehicleNeonLightEnabled(veh,0,tonumber(custom.neon.left))
			SetVehicleNeonLightEnabled(veh,1,tonumber(custom.neon.right))
			SetVehicleNeonLightEnabled(veh,2,tonumber(custom.neon.front))
			SetVehicleNeonLightEnabled(veh,3,tonumber(custom.neon.back))
		end

		for i,mod in pairs(custom.mods) do
			if i ~= 18 and i ~= 20 and i ~= 22 and i ~= 46 then
				SetVehicleMod(veh,tonumber(i),tonumber(mod))
			end
		end
		SetVehicleMod(veh,23,tonumber(custom.tyres),custom.tyresvariation)
		SetVehicleMod(veh,24,tonumber(custom.tyres),custom.tyresvariation)
	end
end
local spawnLocs = {
	[1] = {
		[1] = { ['x'] = 50.66, ['y'] = -873.02, ['z'] = 30.45, ['h'] = 159.65 }
	},
	[2] = {
		[1] = { ['x'] = 334.52, ['y'] = 2623.09, ['z'] = 44.49, ['h'] = 20.0 }
	},
	[3] = {
		[1] = { ['x'] = -772.82, ['y'] = 5578.48, ['z'] = 33.48, ['h'] = 89.01 }
	},
	[4] = {
		[1] = { ['x'] = 285.05, ['y'] = -339.29, ['z'] = 44.91, ['h'] = 249.0 }
	},
	[5] = {
		[1] = { ['x'] = 608.21, ['y'] = 104.11, ['z'] = 92.81, ['h'] = 70.0 }
	},
	[6] = {
		[1] = { ['x'] = -328.80, ['y'] = 277.92, ['z'] = 86.34, ['h'] = 95.0 }
	},
	[7] = {
		[1] = { ['x'] = -2011.66, ['y'] = -478.09, ['z'] = 12.21, ['h'] = 140.0 }
	},
	[8] = {
		[1] = { ['x'] = -1186.70, ['y'] = -1490.54, ['z'] = 4.37, ['h'] = 125.0 }
	},
	[9] = {
		[1] = { ['x'] = -84.96, ['y'] = -2004.22, ['z'] = 18.01, ['h'] = 352.0 }
	},
	[14] = {
		[1] = { ['x'] = 445.88, ['y'] = -1025.84, ['z'] = 28.65, ['h'] = 7.7 },
		[2] = { ['x'] = 442.20, ['y'] = -1026.32, ['z'] = 28.72, ['h'] = 7.7 },
		[3] = { ['x'] = 438.42, ['y'] = -1026.84, ['z'] = 28.79, ['h'] = 7.7 }
	},
	[15] = {
		[1] = { ['x'] = 1873.68, ['y'] = 3686.05, ['z'] = 33.58, ['h'] = 210.0 }
	},
	[16] = {
		[1] = { ['x'] = -463.50, ['y'] = 6009.80, ['z'] = 31.34, ['h'] = 90.0 }
	},
	[17] = {
		[1] = { ['x'] = 295.70, ['y'] = -604.35, ['z'] = 43.31, ['h'] = 70.0 }
	},
	[18] = {
		[1] = { ['x'] = 1805.27, ['y'] = 3680.97, ['z'] = 34.22, ['h'] = 120.0 }
	},
	[19] = {
		[1] = { ['x'] = -259.22, ['y'] = 6344.43, ['z'] = 32.42, ['h'] = 90.0 }
	},
	[20] = {
		[1] = { ['x'] = -232.96, ['y'] = -1391.51, ['z'] = 31.25, ['h'] = 180.0 }
	},
	[21] = {
		[1] = { ['x'] = 899.16, ['y'] = -180.51, ['z'] = 73.82, ['h'] = 238.56 }
	},
	[22] = {
		[1] = { ['x'] = 72.89, ['y'] = 121.01, ['z'] = 79.18, ['h'] = 160.0 }
	},
	[23] = {
		[1] = { ['x'] = -342.17, ['y'] = -1560.10, ['z'] = 25.23, ['h'] = 100.0 }
	},
	[24] = {
		[1] = { ['x'] = 462.22, ['y'] = -605.06, ['z'] = 28.49, ['h'] = 220.0 }
	},
	[25] = {
		[1] = { ['x'] = -1189.17, ['y'] = -1571.31, ['z'] = 4.32, ['h'] = 125.0 }
	},
	[26] = {
		[1] = { ['x'] = -897.22, ['y'] = -778.68, ['z'] = 15.91, ['h'] = 80.0 }
	},
	[27] = {
		[1] = { ['x'] = -247.68, ['y'] = -1527.71, ['z'] = 31.59, ['h'] = 230.0 }
	},
	[28] = {
		[1] = { ['x'] = -1619.61, ['y'] = -1175.78, ['z'] = -0.08, ['h'] = 130.0 }
	},
	[29] = {
		[1] = { ['x'] = -1526.63, ['y'] = 1499.64, ['z'] = 109.08, ['h'] = 350.0 }
	},
	[30] = {
		[1] = { ['x'] = 1343.24, ['y'] = 4269.59, ['z'] = 30.11, ['h'] = 190.0 }
	},
	[31] = {
		[1] = { ['x'] = -195.95, ['y'] = 788.35, ['z'] = 195.93, ['h'] = 230.0 }
	},
	[32] = {
		[1] = { ['x'] = -795.85, ['y'] = 303.96, ['z'] = 85.70, ['h'] = 179.0 }
	},
	[33] = {
		[1] = { ['x'] = 216.20, ['y'] = -1381.22, ['z'] = 30.56, ['h'] = 179.0 }
	},
	[66] = {
		[1] = { ['x'] = 1185.20, ['y'] = -3251.40, ['z'] = 6.02, ['h'] = 91.07 }
	},
	[67] = {
		[1] = { ['x'] = 449.34, ['y'] = -981.14, ['z'] = 43.69, ['h'] = 91.28 }
	},
	[68] = {
		[1] = { ['x'] = 351.66, ['y'] = -588.13, ['z'] = 74.16, ['h'] = 247.48 }
	},
	[69] = {
		[1] = { ['x'] = 477.87, ['y'] = -1021.89, ['z'] = 28.02, ['h'] = 272.65 }
	},
	[70] = {
		[1] = { ['x'] = -1040.47, ['y'] = -2718.60, ['z'] = 13.69, ['h'] = 13.67 }
	},
	[71] = {
		[1] = { ['x'] = 1402.43, ['y'] = 1118.80, ['z'] = 114.83, ['h'] = 13.67 }
	},
	[72] = {
		[1] = { ['x'] = -31.920, ['y'] = -1090.73, ['z'] = 26.422, ['h'] = 13.67 }
	},
	[73] = {
		[1] = { ['x'] = -970.91, ['y'] = -1493.02, ['z'] = 4.985, ['h'] = 305.67 }
	},
	[74] = {
		[1] = { ['x'] = 979.032, ['y'] = -115.69, ['z'] = 74.20, ['h'] = 265.67 }
	},
    [75] = {
		[1] = { ['x'] = 488.02, ['y'] = -1331.57, ['z'] = 29.38, ['h'] = 295.44 }
	},
}
function vRPg.spawnGarageVehicle(name,custom,enginehealth,bodyhealth,fuellevel,loc)
	local vehicle = vehicles[name]
	if vehicle == nil then
		local mhash = GetHashKey(name)
		while not HasModelLoaded(mhash) do
			RequestModel(mhash)
			Citizen.Wait(10)
		end

		if HasModelLoaded(mhash) then
			rand = 1
			while true do
				checkPos = GetClosestVehicle(spawnLocs[loc][rand].x,spawnLocs[loc][rand].y,spawnLocs[loc][rand].z,3.001,0,71)
				if DoesEntityExist(checkPos) and checkPos ~= nil then
					rand = rand + 1
					if rand > #spawnLocs[loc] then
						rand = -1
						TriggerEvent("Notify","importante","Todas as vagas estão ocupadas no momento.")
						break
					end
				else
					break
				end
				Citizen.Wait(1)
			end

			if rand ~= -1 then
				nveh = CreateVehicle(mhash,spawnLocs[loc][rand].x,spawnLocs[loc][rand].y,spawnLocs[loc][rand].z+0.5,spawnLocs[loc][rand].h,true,false)
				netveh = VehToNet(nveh)

				NetworkRegisterEntityAsNetworked(nveh)
				while not NetworkGetEntityIsNetworked(nveh) do
					NetworkRegisterEntityAsNetworked(nveh)
					Citizen.Wait(1)
				end

				if NetworkDoesNetworkIdExist(netveh) then
					SetEntitySomething(nveh,true)
					if NetworkGetEntityIsNetworked(nveh) then
						SetNetworkIdExistsOnAllMachines(netveh,true)
					end
				end

				NetworkFadeInEntity(NetToEnt(netveh),true)
				SetVehicleIsStolen(NetToVeh(netveh),false)
				SetVehicleNeedsToBeHotwired(NetToVeh(netveh),false)
				SetEntityInvincible(NetToVeh(netveh),false)
				SetVehicleNumberPlateText(NetToVeh(netveh),vRP.getRegistrationNumber())
				SetEntityAsMissionEntity(NetToVeh(netveh),true,true)
				SetVehicleHasBeenOwnedByPlayer(NetToVeh(netveh),true)

				SetVehRadioStation(NetToVeh(netveh),"OFF")

				if custom then
					vRPg.setVehicleMods(custom,NetToVeh(netveh))
				end

				SetVehicleEngineHealth(NetToVeh(netveh),enginehealth+0.0)
				SetVehicleBodyHealth(NetToVeh(netveh),bodyhealth+0.0)
				SetVehicleFuelLevel(NetToVeh(netveh),fuellevel+0.0)

				SetModelAsNoLongerNeeded(mhash)

				vehicles[name] = { name,nveh }
			end

			return true,VehToNet(nveh),name
		end
	end
	return false,0,nil
end

function vRPg.despawnGarageVehicle(name)
	local vehicle = vehicles[name]
	if vehicle then
		vehicles[name] = nil
	end
end

function vRPg.toggleLock()
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		local locked = GetVehicleDoorLockStatus(vehicle) >= 2
		if locked then
			TriggerServerEvent("tryLock",VehToNet(vehicle))
			TriggerEvent("Notify","importante","Veículo <b>destrancado</b> com sucesso.")
		else
			TriggerServerEvent("tryLock",VehToNet(vehicle))
			TriggerEvent("Notify","importante","Veículo foi <b>trancado</b> com sucesso.")
		end
		if not IsPedInAnyVehicle(PlayerPedId()) then
			vRP._playAnim(true,{{"anim@mp_player_intmenu@key_fob@","fob_click"}},false)
		end
	end
end

function vRPg.toggleTrunk()
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trytrunk",VehToNet(vehicle))
	end
end

local ancorado = false
function vRPg.toggleAnchor()
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) == 14 then
		if ancorado then
			FreezeEntityPosition(vehicle,false)
			ancorado = false
		else
			FreezeEntityPosition(vehicle,true)
			ancorado = true
		end
	end
end

local cooldown = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,182) and cooldown < 1 then
			cooldown = 1
			TriggerServerEvent("buttonLock")
		end
		if IsControlJustPressed(0,10) and cooldown < 1 then
			cooldown = 1
			TriggerServerEvent("buttonTrunk")
		end
	end
end)

RegisterNetEvent("syncLock")
AddEventHandler("syncLock",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				local locked = GetVehicleDoorLockStatus(v)
				if locked == 1 then
					SetVehicleDoorsLocked(v,2)
				else
					SetVehicleDoorsLocked(v,1)
				end
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
				Wait(200)
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
			end
		end
	end
end)