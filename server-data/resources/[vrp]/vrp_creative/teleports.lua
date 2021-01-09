local Teleport = {
	--["HOSPITAL"] = {
	--	positionFrom = { ['x'] = 340.37, ['y'] = -592.84, ['z'] = 43.28 },
	--	positionTo = { ['x'] = 338.53, ['y'] = -583.79, ['z'] = 74.16 }
	--},
} 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,j in pairs(Teleport) do
			local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId(),true))
			local unusedBool,coordz = GetGroundZFor_3dCoord(j.positionFrom.x,j.positionFrom.y,j.positionFrom.z,1)
			local unusedBool,coordz2 = GetGroundZFor_3dCoord(j.positionTo.x,j.positionTo.y,j.positionTo.z,1)
			local distance = GetDistanceBetweenCoords(j.positionFrom.x,j.positionFrom.y,coordz,px,py,pz,true)
			local distance2 = GetDistanceBetweenCoords(j.positionTo.x,j.positionTo.y,coordz2,px,py,pz,true)

			if distance <= 30 then
				DrawMarker(1,j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),j.positionTo.x,j.positionTo.y,j.positionTo.z-0.50)
					end
				end
			end

			if distance2 <= 30 then
				DrawMarker(1,j.positionTo.x,j.positionTo.y,j.positionTo.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-0.50)
					end
				end
			end
		end
	end
end)