Citizen.CreateThread(function()
    Citizen.Wait(5000)

    local resource_name = GetCurrentResourceName()
    local current_version = GetResourceMetadata(resource_name, 'version', 0)

    PerformHttpRequest('https://raw.githubusercontent.com/nxt-studio/versionsScripts/main/'..resource_name..'.txt',function(error, result, headers)

        if not result then print('^1Version check disabled because github is down.^0') return end

        local result = json.decode(result:sub(1, -2))

        local new_version = result.version:gsub('%.', '')

        local nCurrent_version = current_version:gsub('%.', '')

        if new_version > nCurrent_version then

            local symbols = '^'..math.random(1,9)
            for cd = 1, 26+#resource_name do
                symbols = symbols..'='
            end
            symbols = symbols..'^0'
            print(symbols)
            print('^2['..resource_name..'] - New update available now!^0\nCurrent Version: ^5'..current_version..'^0.\nNew Version: ^5'..result.version..'^0.\nNotes: ^5'..result.notes..'^0.\n\n^5Download it now on your keymaster.fivem.net^0.')
            print(symbols)

        end
        
    end,'GET')
end)