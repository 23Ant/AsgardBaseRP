Citizen.CreateThread(function()
	AddTextEntry("FE_THDR_GTAO","Nova São Paulo")
	while true do
		Citizen.Wait(0)
		N_0xf4f2c0d4ee209e20()
		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(20)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)
		HideHudComponentThisFrame(23)
		HideHudComponentThisFrame(24)
		HideHudComponentThisFrame(25)
		HideHudComponentThisFrame(26)
		HideHudComponentThisFrame(27)
		HideHudComponentThisFrame(28)
		HideHudComponentThisFrame(29)
		HideHudComponentThisFrame(30)
		HideHudComponentThisFrame(31)
		HideHudComponentThisFrame(32)
		HideHudComponentThisFrame(33)
		HideHudComponentThisFrame(34)
		HideHudComponentThisFrame(35)
		HideHudComponentThisFrame(36)
		HideHudComponentThisFrame(37)
		HideHudComponentThisFrame(38)
		HideHudComponentThisFrame(39)
		HideHudComponentThisFrame(40)
		HideHudComponentThisFrame(41)
		HideHudComponentThisFrame(42)
		HideHudComponentThisFrame(43)
		HideHudComponentThisFrame(44)
		HideHudComponentThisFrame(45)
		HideHudComponentThisFrame(46)
		HideHudComponentThisFrame(47)
		HideHudComponentThisFrame(48)
		HideHudComponentThisFrame(49)
		HideHudComponentThisFrame(50)
		HideHudComponentThisFrame(51)
		RemoveAllPickupsOfType(0x6C5B941A)
		RemoveAllPickupsOfType(0xF33C83B0)
		RemoveAllPickupsOfType(0xDF711959)
		RemoveAllPickupsOfType(0xB2B5325E)
		RemoveAllPickupsOfType(0x85CAA9B1)
		RemoveAllPickupsOfType(0xB2930A14)
		RemoveAllPickupsOfType(0xFE2A352C)
		RemoveAllPickupsOfType(0x693583AD)
		RemoveAllPickupsOfType(0x1D9588D3)
		RemoveAllPickupsOfType(0x3A4C2AD2)
		RemoveAllPickupsOfType(0x4D36C349)
		RemoveAllPickupsOfType(0x2F36B434)
		RemoveAllPickupsOfType(0xA9355DCD)
		RemoveAllPickupsOfType(0x96B412A3)
		RemoveAllPickupsOfType(0x9299C95B)
		RemoveAllPickupsOfType(0xF9AFB48F)
		RemoveAllPickupsOfType(0x8967B4F3)
		RemoveAllPickupsOfType(0x3B662889)
		RemoveAllPickupsOfType(0xFD16169E)
		RemoveAllPickupsOfType(0xCB13D282)
		RemoveAllPickupsOfType(0xC69DE3FF)
		RemoveAllPickupsOfType(0x278D8734)
		RemoveAllPickupsOfType(0x5EA16D74)
		RemoveAllPickupsOfType(0x295691A9)
		RemoveAllPickupsOfType(0x81EE601E)
		RemoveAllPickupsOfType(0x88EAACA7)
		RemoveAllPickupsOfType(0x872DC888)
		RemoveAllPickupsOfType(0xC5B72713)
		RemoveAllPickupsOfType(0x9CF13918)
		RemoveAllPickupsOfType(0x0968339D)
		RemoveAllPickupsOfType(0xBFEE6C3B)
		RemoveAllPickupsOfType(0xBED46EC5)
		RemoveAllPickupsOfType(0x079284A9)
		RemoveAllPickupsOfType(0x8ADDEC75)
		DisablePlayerVehicleRewards(PlayerId())
		SetPedInfiniteAmmo(PlayerPedId(),true,GetHashKey("WEAPON_FIREEXTINGUISHER"))

		x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		RemoveVehiclesFromGeneratorsInArea(GetEntityCoords(PlayerPedId())-999.0,GetEntityCoords(PlayerPedId())+999.0)
		SetVehicleDensityMultiplierThisFrame(0.05)
		--SetRandomVehicleDensityMultiplierThisFrame(1.0)
		--SetScenarioPedDensityMultiplierThisFrame(1.0,1.0)
		--SetPedDensityMultiplierThisFrame(1.0)
		--SetParkedVehicleDensityMultiplierThisFrame(0.0)
		--SetSomeVehicleDensityMultiplierThisFrame(0.0)
		SetCreateRandomCops(false)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
	end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                local roll = GetEntityRoll(vehicle)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
                      if IsVehicleTyreBurst(vehicle, wheel_rm1, 0) == false then
                      SetVehiclePetrolTankHealth(vehicle, -4000, 1)
                       SetVehicleEngineTemperature(vehicle, 5000, 1)
                      SetVehicleEngineHealth(vehicle, -4000, 1)
                    SetVehicleTyreBurst(vehicle, 0, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 1, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 2, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 3, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 4, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 5, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 45, 1)
                    Citizen.Wait(100)
                    SetVehicleTyreBurst(vehicle, 47, 1)
                    end
                end
            end
        end
    end
end)