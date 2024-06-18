Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)      
		if IsEntityDead(PlayerPedId()) then
			StartScreenEffect("DeathFailOut", 120000, false) --starts b&w effect (name, duration in ms, looped)
			
			local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
			
			Citizen.Wait(0)
			while IsEntityDead(PlayerPedId()) do
				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Citizen.Wait(0)
			end
		end
		StopScreenEffect("DeathFailOut") --stops b&w effect
	end
end)
