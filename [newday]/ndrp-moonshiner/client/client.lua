local QBCore = exports['qb-core']:GetCoreObject()
local isBusy = false
local moonshinekit = 0
local fx_group = "scr_adv_sok"
local fx_name = "scr_adv_sok_torchsmoke"
local smoke

local isLoggedIn = false
PlayerJob = {}

--#region 注册事件
RegisterNetEvent('qb-moonshiner:client:moonshinekit') -- 放置私酒酿造台
RegisterNetEvent('qb-moonshiner:client:startsmoke') --开始生成烟雾
RegisterNetEvent("qb-moonshiner:client:moonshine") --开始酿造私酒
RegisterNetEvent('QBCore:Client:OnPlayerLoaded') --玩家加载, 
--#endregion

--#region 函数
function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(15)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text)
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

function StartSmoke(smokecoords)
    UseParticleFxAsset(fx_group)
    smoke = StartParticleFxLoopedAtCoord(fx_name, smokecoords, -2,0.0,0.0, 2.0, false, false, false, true)
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, smoke, 10.0)
    SetParticleFxLoopedAlpha(smoke, 1.0)
    SetParticleFxLoopedColour(smoke, 1.0,1.0,1.0, false)
end
--#endregion

--#region events handlers
AddEventHandler('qb-moonshiner:client:moonshinekit', function() 

    local playerPed = PlayerPedId()
    --TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    -- Wait(10000)
    -- ClearPedTasks(playerPed)
    SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
    local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55)
    local modelHash = GetHashKey(Config.Prop)
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(1)
        end
    end
    local prop = CreateObject(modelHash, pos, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    TriggerServerEvent('qb-moonshiner:server:startsmoke', pos)
    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
end, false)

AddEventHandler('qb-moonshiner:client:startsmoke', function(smokecoords)
    StartSmoke(smokecoords)
end)

--#endregion

--#region 线程
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
        local moonshineObject = GetClosestObjectOfType(pos, 5.0, GetHashKey(Config.Prop), false, false, false)
        if moonshineObject ~= 0 and PlayerJob.name ~= Config.LawJobName then
            local objectPos = GetEntityCoords(moonshineObject)
            if #(pos - objectPos) < 3.0 then
                awayFromObject = false
                DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, Lang:t('menu.brew'))
                if IsControlJustReleased(0, QBCore.Shared.Keybinds['J']) then
                    TriggerEvent('ndrp-crafting:client:start-crafting',
                    {
                        Name={{name='moonshine',amount=1}},
                        CraftTime=Config.RecipeList['moonshine'].crafttime,
                        CraftItems=Config.RecipeList['moonshine'].craftitems,
                        Label='月光酒'
                    })
                end
            end
        else
            local objectPos = GetEntityCoords(moonshineObject)
            if #(pos - objectPos) < 3.0 then
                awayFromObject = false
                DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, Lang:t('menu.destroy'))
                if IsControlJustReleased(0, QBCore.Shared.Keybinds['J']) then
                    local player = PlayerPedId()
                    TaskStartScenarioInPlace(player, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
                    Wait(5000)
                    ClearPedTasks(player)
                    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
                    DeleteObject(moonshineObject)
                    Citizen.InvokeNative(0x22970F3A088B133B, smoke, true)
                    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
                    QBCore.Functions.Notify(Lang:t('primary.moonshine_destroyed'), 'primary')
                end
            end
        end
        if awayFromObject then
            Wait(1000)
        end
    end
end)
--#endregion




