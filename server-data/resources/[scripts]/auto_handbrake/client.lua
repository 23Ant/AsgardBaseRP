local tyreBurst = false
local hadSet = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local me = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(me, false)
        if IsPedInAnyVehicle(me, false) and GetPedInVehicleSeat(veh, -1) == me then
            if IsVehicleTyreBurst(veh, 0, false) or IsVehicleTyreBurst(veh, 1, false) or IsVehicleTyreBurst(veh, 4, false) or IsVehicleTyreBurst(veh, 5, false) then
                tyreBurst = true
                hadSet = true
            else
                tyreBurst = false
            end
        else
            tyreBurst = false
        end
        if tyreBurst then
            SetVehicleHandbrake(veh, true)
        else
            if hadSet and IsPedInAnyVehicle(me, false) and GetPedInVehicleSeat(veh, -1) == me and GetVehicleHandbrake(veh) then
                hadSet = false
                SetVehicleHandbrake(veh, false)
            end
        end
    end
end)