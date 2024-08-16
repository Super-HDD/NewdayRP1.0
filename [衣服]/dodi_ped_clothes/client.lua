function clothes()
        local playerPed = PlayerPedId()
        RequestAnimDict("mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@unarmed@base")
        while not HasAnimDictLoaded("mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@unarmed@base") do
                Wait(100)
        end
        TaskPlayAnim(playerPed, "mech_inventory@item@_templates@cylinder@d12_h6-7_inspecty@unarmed@base", "holster", 8.0,
                -0.5, -1, 0, 0, true, 0, false, 0, false)

        Wait(1000)
        ClearPedTasks(playerPed)
end

RegisterNetEvent("dodi:use:pedclothe") --- PED clothes item 1
AddEventHandler("dodi:use:pedclothe", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("combovest_mr1_004")      -- Replace with correct draw
                local alb = GetHashKey("combovest_mr1_004_c1_999_ab") -- Replace with correct alb
                local norm = 0x4C36AA5E                           -- Replace with correct norm
                local mati = 0xD5F871DB                           -- Replace with correct mati
        
                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0x4101ED87, 150, 254, 40)  --- you can change the color RGB 150, 254, 40
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)


RegisterNetEvent("dodi:use:pedclothe2") --- PED clothes item 2 (CS_SDPRIEST)
AddEventHandler("dodi:use:pedclothe2", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()

                local draw3 = 0xCD093323 -- Replace with correct draw
                local alb3 = 0x7BBA9AC8 -- Replace with correct alb
                local norm3 = 0xE300323E -- Replace with correct norm
                local mati3 = 0x742F2E44 -- Replace with correct mati

                local draw2 = 0x15C62666 -- Replace with correct draw
                local alb2 = 0xA6A1DF38 -- Replace with correct alb
                local norm2 = 0x2AF122B8 -- Replace with correct norm
                local mati2 = 0x51300872 -- Replace with correct mati

                local draw = 0xC3A22669 -- Replace with correct draw
                local alb = 0x6ED6B230 -- Replace with correct alb
                local norm = 0xDFC0B047 -- Replace with correct norm
                local mati = 0xB4E2D0D5 -- Replace with correct mati


        
                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0, 0, 0)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw2, alb2, norm2, mati2, 0, 0, 0)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw3, alb3, norm3, mati3, 0, 0, 0)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe3") --- PED clothes item 3  (prison beltchain)
AddEventHandler("dodi:use:pedclothe3", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("cs_dutch_ms1_beltchain_000") -- Replace with correct draw
                local alb = 0x12C171CA                            -- Replace with correct alb
                local norm = 0xEBCA4A31                           -- Replace with correct norm
                local mati = 0x47D1907C                           -- Replace with correct mati
        
                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 255, 255, 255)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe4")         --- PED clothes item 4 (fem CS_ValProstitute_02 dress)
AddEventHandler("dodi:use:pedclothe4", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                
                local draw1 = 0x27A2E7F3                                  -- Replace with correct draw
                local alb1 = 0xE2927C55                                   -- Replace with correct alb
                local norm1 = 0xCB55530F                                  -- Replace with correct norm
                local mati1 = 0x7A837DDF                                  -- Replace with correct mati  --- torso


		local draw2 = 0x55B00206                                  -- Replace with correct draw
                local alb2 = 0x917C4BB8                                   -- Replace with correct alb
                local norm2 = 0x508CDC6A                                  -- Replace with correct norm
                local mati2 = 0x1BEBE9F5                                  -- Replace with correct mati  --- dress up


		local draw3 = 0xB75FF915                                  -- Replace with correct draw
                local alb3 = 0xDA292358                                   -- Replace with correct alb
                local norm3 = 0xDDCD1C04                                  -- Replace with correct norm
                local mati3 = 0xF0DC6419                                  -- Replace with correct mati  --- dress low



		local draw4 = 0xE9F7B2AF                                  -- Replace with correct draw
                local alb4 = 0x7F24B29F                                   -- Replace with correct alb
                local norm4 = 0xFF1F3A65                                  -- Replace with correct norm
                local mati4 = 0xF7CB53C3                                  -- Replace with correct mati  --- colar

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw1, alb1, norm1, mati1, 255, 255, 255)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw2, alb2, norm2, mati2, 0, 0, 0)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw3, alb3, norm3, mati3, 0, 0, 0)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw4, alb4, norm4, mati4, 0, 0, 0)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe5")             --- PED clothes item 5   (fem dress low)
AddEventHandler("dodi:use:pedclothe5", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("lowr_fr1_027")             -- Replace with correct draw
                local alb = GetHashKey("lowr_fr1_027_elderlytattered_c3_999_ab")                                       -- Replace with correct alb
                local norm = 0x3FD6DD0A                                      -- Replace with correct norm
                local mati = 0xD3FB7B6B                                     -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0xB9E7F722, 62, 57, 59)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe6")                 --- PED clothes item 6 (mask - G_M_M_UniDuster_03)
AddEventHandler("dodi:use:pedclothe6", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("mask_mr1_001_over")                 -- Replace with correct draw
                local alb = 0xF8C79851                                         -- Replace with correct alb
                local norm = 0x27869826                                          -- Replace with correct norm
                local mati = 0x0A77EA2E                                          -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0x4101ED87, 49, 17, 46)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)


RegisterNetEvent("dodi:use:pedclothe7")                 --- PED clothes item 7  (RCES_EVELYNMILLER_MALES_01 - poncho)
AddEventHandler("dodi:use:pedclothe7", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = 0x804895AA                -- Replace with correct draw
                local alb = 0xBAD0EA88                                           -- Replace with correct alb
                local norm = 0x2EEEA3F9                                          -- Replace with correct norm
                local mati = 0xEBB66D6C                                          -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0xF93DB0C8, 155, 155, 41)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe8")                 --- PED clothes item 8  (RE_DEADJOHN_MALES_01 - nightsuit)
AddEventHandler("dodi:use:pedclothe8", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("unionsuitbuttoned_mr1_000")                     -- Replace with correct draw
                local alb = 0xE3513DCE                                               -- Replace with correct alb
                local norm = 0xCE4FD721                                              -- Replace with correct norm
                local mati = 0x5DCD6700                                              -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0xAA65D8A3, 57, 17, 16)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe9")                         --- PED clothes item 9  ( S_M_M_DispatchPolice_01 )
AddEventHandler("dodi:use:pedclothe9", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("hat_mr1_039")                         -- Replace with correct draw
                local alb = 0xD7A35406                                                   -- Replace with correct alb
                local norm = 0xC553A997                                                  -- Replace with correct norm
                local mati = 0xCB058B61                                                  -- Replace with correct mati

                local draw2 = GetHashKey("policecombo_mr1_001")                         -- Replace with correct draw
                local alb2 = 0x797682A0                                                   -- Replace with correct alb
                local norm2 = 0xEE47ED35                                                  -- Replace with correct norm
                local mati2 = 0x208D4B1C                                                  -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0xFB71527B, 9, 9, 9)
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw2, alb2, norm2, mati2, 0xAA65D8A3, 0, 72, 73)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)

RegisterNetEvent("dodi:use:pedclothe10")                             --- PED clothes item 10 (Dutch coat)
AddEventHandler("dodi:use:pedclothe10", function()
        Citizen.CreateThread(function()
                clothes()
                local playerPed = PlayerPedId()
                local draw = GetHashKey("cs_dutch_ms1_coat_001")                             -- Replace with correct draw
                local alb = 0x52002711                                                       -- Replace with correct alb
                local norm = 0x34A82931                                                      -- Replace with correct norm
                local mati = 0x25591FB9                                                      -- Replace with correct mati

                -- Invoke the native functions
                Citizen.InvokeNative(0xBC6DF00D7A4A6819, playerPed, draw, alb, norm, mati, 0, 0, 0)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end)
end)
