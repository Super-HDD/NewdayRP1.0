local boatsInvincible = false -- 将所有船只设为无敌状态
local noSinkZone = true -- 当超过沉没区域边界时阻止船只下沉
local infSwim = false -- 允许无限游泳，类似于GTA 5中的游泳
local StaminaLevel = - 10 -- 在游泳时保持的体力水平，推荐值为- 10，否则玩家可以通过游泳获得最大体力核心值。

function CheckPlayerWaterStatus()
    if IsPedSwimming(PlayerPedId()) and infSwim then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        if stam < StaminaLevel then
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, StaminaLevel)
        end
    end
end

function StopBoatFromSinking()
    local ped = PlayerPedId()
    if IsPedInAnyBoat(ped) then
        local veh = GetVehiclePedIsIn(ped, false)
        SetEntityInvincible(veh, boatsInvincible)
    end
end

function ApplySinkZone()
    if noSinkZone then
        Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, 1) -- 阻止船只在超过沉没区域时下沉
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
        ApplySinkZone()
        StopBoatFromSinking()
    end
end)
