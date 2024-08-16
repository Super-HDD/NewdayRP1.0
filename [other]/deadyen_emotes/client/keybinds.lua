CreateThread(function()
    while true do
        Wait(0)
		if IsControlJustReleased(0, Config.HandsUpControl) then
            if Config.SmoothHandsUp then
                ExecuteCommand('handsup')
            end
        end

        if IsControlJustReleased(0, Config.RagdollControl) and Config.RagdollKeybind then
            if Config.Ragdoll then
                TriggerEvent('yen_emotes:rag_toggle')
            end
        end

        if IsControlJustReleased(0, Config.CrossArmsControl) then
            if Config.SmoothCrossArms then
                ExecuteCommand('crossarms')
            end
        end

        if IsDisabledControlJustReleased(0, Config.OpenControl) then
            ExecuteCommand(Config.OpenCommand)
		end
    end
end)

-- Future-proofed for the eventual implementation of keybinds in RedM.