
------
-- 由Scott制作的交互声音
-- 版本：v0.0.1
-- 路径：server/main.lua
--
-- 允许在单个客户端、所有客户端或距离已创建声音的实体一定范围内的所有客户端播放声音。仅触发客户端事件。用于从客户端或服务器触发其他客户端的声音，而无需直接传递给另一个客户端。
------

------
-- 注册服务器事件 InteractSound_SV:PlayOnOne
-- 触发 -> 客户端事件 InteractSound_CL:PlayOnOne
--
-- @param clientNetId - 应该在其上播放声音的客户端的网络 ID。
-- @param soundFile - 客户端/html/sounds/文件夹中的声音文件的名称。
-- - 也可以指定文件夹/声音文件。
-- @param soundVolume - 应该以其播放声音文件的音量。默认为 standardVolumeOutput。如果不提供，则为 nil。
-- - 音量应在 0.1 到 1.0 之间。
-- - 也可以指定文件夹/声音文件。
--
-- 在单个客户端上本地开始播放声音。
------
RegisterNetEvent('InteractSound_SV:PlayOnOne')
AddEventHandler('InteractSound_SV:PlayOnOne', function(clientNetId, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', clientNetId, soundFile, soundVolume)
end)

------
-- RegisterServerEvent InteractSound_SV:PlayOnSource
-- 触发器 -> ClientEvent InteractSound_CL:PlayOnSource
--
-- @param soundFile    - 在客户端/html/sounds/文件夹中的声音文件的名称。
--                     - 也可以指定文件夹/声音文件。
-- @param soundVolume  - 声音文件应该以的音量。默认为standardVolumeOutput，如果未提供或设置为nil。应在0.1到1.0之间。
--                     - 也可以指定文件夹/声音文件。
--
-- 在事件的源客户端上本地播放声音，该客户端是事件的来源。
------
RegisterNetEvent('InteractSound_SV:PlayOnSource')
AddEventHandler('InteractSound_SV:PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, soundFile, soundVolume)
end)

------
-- RegisterServerEvent InteractSound_SV:PlayOnAll
-- Triggers -> ClientEvent InteractSound_CL:PlayOnAll
--
-- @param soundFile     - 在 client/html/sounds/ 文件夹中的音频文件的名称。
--                      - 也可以指定一个文件夹/音频文件。
-- @param soundVolume   - 播放 soundFile 时的音量。如果不提供或为 nil，则使用标准音量输出的默认值。
--                      - 应该介于 0.1 到 1.0 之间。
--
-- 在服务器上所有在线的客户端上开始播放声音。
RegisterNetEvent('InteractSound_SV:PlayOnAll')
AddEventHandler('InteractSound_SV:PlayOnAll', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnAll', -1, soundFile, soundVolume)
end)

------
-- 注册服务器事件 InteractSound_SV:PlayWithinDistance
-- 触发 -> 客户端事件 InteractSound_CL:PlayWithinDistance
--
-- @param playOnEntity    - 要绘制最大距离的实体网络 ID（将在客户端从网络 ID 转换为实体）
-- @param maxDistance     - 允许玩家听到播放的 soundFile 的最大浮点距离（客户端使用 Vdist）。
-- @param soundFile       - 在 client/html/sounds/ 文件夹中的声音文件的名称。
--                        - 也可以指定一个文件夹/声音文件。
-- @param soundVolume     - 应该播放 soundFile 的音量。如果不提供或为 nil，则使用标准音量输出的默认值。
--                        - 应在 0.1 到 1.0 之间。
--
-- 如果客户端与 playOnEntity 之间的距离小于指定的 maxDistance，则开始在客户端上播放声音。
-- @TODO 基于玩家与 playOnEntity 之间的距离更改声音音量。
------
RegisterNetEvent('InteractSound_SV:PlayWithinDistance')
AddEventHandler('InteractSound_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
  if GetConvar("onesync_enableInfinity", "false") == "true" then
    TriggerClientEvent('InteractSound_CL:PlayWithinDistanceOS', -1, GetEntityCoords(GetPlayerPed(source)), maxDistance, soundFile, soundVolume)
  else
    TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
  end
end)

RegisterNetEvent('InteractSound_SV:PlayWithinDistance')
AddEventHandler('InteractSound_SV:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    local src = source
    local DistanceLimit = 300
    if maxDistance < DistanceLimit then
	TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, GetEntityCoords(GetPlayerPed(src)), maxDistance, soundFile, soundVolume)
    else
        print(('[interact-sound] [^3WARNING^7] %s attempted to trigger InteractSound_SV:PlayWithinDistance over the distance limit ' .. DistanceLimit):format(GetPlayerName(src)))
    end
end)
