
-- THREAD TO BLOCK ACTIONS WHEN PLAYER HAS CLOSEST TABLE
local tempChairClosest = nil

Citizen.CreateThread(function()
		
    while true do 

        if closestBlackjackPosition then

			-- DisablePlayerFiring(PlayerPedId(), true)

			DisableControlAction(0, `INPUT_WHISTLE`, true)
			DisableControlAction(0, `INPUT_WHISTLE_HORSEBACK`, true)
			
			DisableControlAction(0, `INPUT_MELEE_GRAPPLE`, true)
			DisableControlAction(0, `INPUT_MELEE_GRAPPLE_REVERSAL`, true)
			DisableControlAction(0, `INPUT_ARREST`, true)

			if blockedToGiveUp then
				DisableControlAction(0, `INPUT_FRONTEND_CANCEL`, true)
			end

			if tempChairClosest ~= closestChair then
				if closestChair and closestChair >= 1 then
					DisplayRadar(false)
				elseif closestChair == 0 then
					DisplayRadar(true)
				end
				tempChairClosest = closestChair
			end

			Wait(0)
		else
			Wait(2000)
        end

    end
end)
