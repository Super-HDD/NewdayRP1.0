local QBCore = exports['qb-core']:GetCoreObject()

local showPlayerBlips = true
local ignorePlayerNameDistance = false
local playerNamesDist = 15
local displayIDHeight = 1.5 --Height of ID above players head(starts at center body mass)

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())  
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	
	local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
	
    local str = CreateVarString(10, "LITERAL_STRING", tostring(text), Citizen.ResultAsLong())
    if onScreen then
    	SetTextScale(0.0*scale, 0.55*scale)
  		SetTextFontForCurrentCommand(1)
		SetTextColor(255, 255, 255, 255)
    	SetTextCentre(1)
		GetScreenCoordFromWorldCoord(x, y, z, 0)
    	DisplayText(str,_x,_y)
    	local factor = (string.len(text)) / 225
    	
    end
end

Citizen.CreateThread(function(source, PlayerData)
    while true do
        Citizen.Wait(0)
        if IsControlPressed(0,0x05CA7C52) then
			
            for id = 0, 32 do
                if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= PlayerPedId()) then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                QBCore.Functions.GetPlayerData(function(PlayerData)
                    Playercid = PlayerData.citizenid
                    cashAmount = PlayerData.money['cash']
                    bloodmoneyAmount = PlayerData.money['bloodmoney']
                    bankAmount = PlayerData.money['bank']
                end)
                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
                        QBCore.Functions.TriggerCallback('qb-bossmenu:getplayers', function(players)
                            for _, v in pairs(players) do
                                if v and v ~= PlayerId() then
                                    DrawText3D(x2, y2, z2 + displayIDHeight, '对方公民ID : ('..v.citizenid..')')
                                end
                            end
                            
                        end)
                        
						 
							--DrawText3D(x2, y2, z2 + displayIDHeight, Playercid)
                    end
                end  
            end
        end
        elseif not IsControlPressed(1,0x05CA7C52) then --------arrow down to activate
            DrawText3D(0, 0, 0, "")
        end
    end
end)
