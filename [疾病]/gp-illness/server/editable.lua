 local RSGCore = exports['rsg-core']:GetCoreObject()

 RSGCore.Functions.CreateUseableItem("item", function(source, item)
     local src = source
     local Player = RSGCore.Functions.GetPlayer(src)
     if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("gp-illness:client:curePlayer", src)
     end
 end)

 RSGCore.Functions.CreateUseableItem("item2", function(source, item)
     local src = source
     local Player = RSGCore.Functions.GetPlayer(src)
     if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("gp-illness:client:curePlayerFromIllness", src, "Flu")
     end
 end)