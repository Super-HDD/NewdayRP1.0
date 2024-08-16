local QBCore = exports['qb-core']:GetCoreObject()


--#region 事件声明
RegisterNetEvent('ndrp-crafting:client:start-crafting')
--#endregion


--#region 局域函数
function ProcessCrafting(Recipe,icheck)
    QBCore.Functions.Progressbar('craft-parts', Lang:t('progressbar.crafting_a')..Recipe.Label, Recipe.CraftTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('ndrp-crafting:server:finish-crafting', Recipe,icheck)
    end)
end
--#endregion

--#region 开始制作
-- Recipe ={Name Label Items Time Prob}
AddEventHandler('ndrp-crafting:client:start-crafting', function(Recipe)
    if Config.Debug then 
        print('start crafting')
        print(QBCore.Debug(Recipe.CraftItems))
    end
    QBCore.Functions.TriggerCallback('ndrp-crafting:server:check-items', function(hasRequired,icheck)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        ProcessCrafting(Recipe,icheck)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end,Recipe.CraftItems)
end)
--


