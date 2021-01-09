
local deleteWeapons = true  --deletar armas


-- site para pegar as teclas (https://docs.fivem.net/game-references/controls/),
--[[forbiddenKeys = {
	121,
	213,
	214
}]]

--- CONFIGURATION ---

local resources = 0
local commands = 0
local playercoords = GetEntityCoords(GetPlayerPed(-1))
local died = false
local lastTimerChack = 0
local health = 0

AntiCheat = true
PedStatus = 0

CarsBL = {
"vigilante",
"hydra",
"buzzard",
"deluxo",
"avenger",
"akula",
"apc",
"barrage",
"caracara",
"cargobob",
"chernobog",
"hunter",
"insurgent",
"starling",
"bus",
"lazer",
"bombushka",
"savage",
"rhino",
"khanjali",
"jet",
"rhino",
"yacht"
} 

WeaponBL={
"WEAPON_RAILGUN",
"WEAPON_GARBAGEBAG",
"WEAPON_RPG",
"WEAPON_ADVANCEDRIFLE",
"WEAPON_MINIGUN",
"WEAPON_STINGER",
"WEAPON_PROXMINE"
}

ObjectsBL={
----bloqueados area ------------------ armas e explosao
"w_lr_firework_rocket",
"w_lr_grenadelauncher",
"w_lr_homing",
"w_lr_homing_rocket",
"w_lr_rpg",
"w_lr_rpg_rocket",
"w_lr_firework",
"w_mg_mg_mag1",
"w_mg_mg_mag2",
"w_lr_rpg",
"prop_const_fence02b",
"prop_const_fence02b",
"prop_beach_fire",

------------------------------------------------------
"prop_const_fence01b_cr",
"prop_const_fence02a",
"prop_const_fence02b",
"prop_const_fence03a_cr",
"prop_const_fence03b_cr",
"prop_fncconstruc_01d",
"prop_fncconstruc_ld",
"prop_fnclink_01a",
"prop_fnclink_01b",
"prop_fnclink_01c",
"prop_fnclink_01d",
"prop_fnclink_01e",
"prop_fnclink_01h",
"prop_fnclink_02a",
"prop_fnclink_02a_sdt",
"stt_prop_stunt_jump30",
"stt_prop_stunt_jump45",
"stt_prop_stunt_track_bumps",
"stt_prop_stunt_track_dwlink",
"stt_prop_stunt_track_dwlink_02",
"stt_prop_stunt_track_dwsh15",
"stt_prop_stunt_track_dwshort",
"stt_prop_stunt_track_dwslope15",
"prop_beach_fire",
"hei_heist_str_avunitl_03",
"hei_prop_heist_weed_pallet",
"prop_weed_pallet",
"prop_aircon_l_03",
"prop_aircon_l_03_dam",
"prop_aircon_l_03",
"prop_aircon_l_03",
"prop_aircon_l_01",
"stt_prop_stunt_jump15",
"p_spinning_anus_s",
"prop_crashed_heli",
"prop_med_jet_01",
"p_cs_mp_jet_01_s"

}
--deletar arma dropada
[[]local deleteWeapons = true

Citizen.CreateThread(function()
	while true do
        Wait(500)
      if (AntiCheat == true)then
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
		v = GetVehiclePedIsIn(playerPed, false)
		end
		playerPed = GetPlayerPed(-1)
		if playerPed and v then
		if GetPedInVehicleSeat(v, -1) == playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))
            end
        end
	   end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		if isCarBlacklisted(carModel) then
            _DeleteEntity(car)
			TriggerServerEvent("HG_AntiCheat:Cars", blacklistedCar )
        end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(CarsBL) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(500)
	for _,theWeapon in ipairs(WeaponBL) do
        Wait(1)
        if (AntiCheat == true)then
		    if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
                RemoveAllPedWeapons(PlayerPedId(),false)
            end
        end
	end
	end
end)

function DeleteObjects(object, detach)
    if DoesEntityExist(object) then
	NetworkRequestControlOfEntity(object)
	while not NetworkHasControlOfEntity(object) do
		Citizen.Wait(1)
	end
	if detach then
        DetachEntity(object, 0, false)
	end
	
	SetEntityCollision(object, false, false)
	SetEntityAlpha(object, 0.0, true)
	SetEntityAsMissionEntity(object, true, true)
	SetEntityAsNoLongerNeeded(object)
    DeleteEntity(object)

	end
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(500)
	local ped = PlayerPedId()
	local handle, object = FindFirstObject()
	local finished = false
	repeat
        Wait(1)
        if (AntiCheat == true)then
        if IsEntityAttached(object) and DoesEntityExist(object) then

        if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
            DeleteObjects(object, true)
		end
		end
		for i=1,#ObjectsBL do
		if GetEntityModel(object) == GetHashKey(ObjectsBL[i]) then
            DeleteObjects(object, false)
            
		end
        end
    end
        finished, object = FindNextObject(handle)
	until not finished
	EndFindObject(handle)
	end
end)


function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString(anticheatm)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
while true do
	Citizen.Wait(1)
    if anticheatm then
		scaleform = Initialize("mp_big_message_freemode")
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (AntiCheat == true) then
			SetEntityProofs(GetPlayerPed(-1), false, true, true, false, false, false, false, false)
		else
			SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
		end
	end
end)



local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
      
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
      
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
      
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
  

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(3000)
		if (AntiCheat == true)then
			thePeds = EnumeratePeds()
			PedStatus = 0
			for ped in thePeds do
                PedStatus = PedStatus + 1
                if not (IsPedAPlayer(ped))then
                   DeleteEntity(ped)
                    RemoveAllPedWeapons(ped, true)
                end
            end
		end			
	end
end)

Citizen.CreateThread(function()
	while true do
		local playercoords = GetEntityCoords(GetPlayerPed(-1))
		if(checkDamageMultiplier) then
			SetPlayerWeaponDamageModifier(PlayerId(), forceDamageMultiplier)
			SetPlayerMeleeWeaponDamageModifier(PlayerId(), forceDamageMultiplier)
		end

		if(deleteWeapons) then
			RemoveAllPedWeapons(GetPlayerPed(-1), 1)
		end
		Wait(2000)
	end
end)

RegisterNetEvent("hereyourDATAcheat")
AddEventHandler("hereyourDATAcheat", function(res, com)
	resources = res
	commands = com
end)

RegisterNetEvent("gameTimerChack")
AddEventHandler("gameTimerChack", function()
	if(lastTimerChack == 0) then
		lastTimerChack = GetGameTimer()
	else
		if(lastTimerChack - GetGameTimer > 1000 or lastTimerChack - GetGameTimer < 500) then
			TriggerServerEvent("anticheatkick", "gametimer")
		end
		lastTimerChack = GetGameTimer()
	end
end)



