-- Create Farm Zone Blips
Citizen.CreateThread(function()
    if not Config.UseFarmingZones then return end

    for farmzone, v in pairs(Config.FarmZone) do
        if v.showblip then
            local FarmZoneBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.blipcoords)
            local blipName = Lang:t('blip.farming_zone')

            if Config.UseSeedBasedZones then
                blipName = v.blipname
            end

            SetBlipSprite(vector3(1893.7760, -1859.8019, 43.1507), 669307703, true)
            SetBlipScale(vector3(1893.7760, -1859.8019, 43.1507), 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, vector3(1893.7760, -1859.8019, 43.1507), blipName)
        end
    end
end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2401.1892, -1108.6288, 46.3841 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_law'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '乔治·华盛顿 国会大厦')


end)


Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2392.4753, -1216.2217, 47.1057 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_law'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '合众国联邦政府大楼')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1113.4749, 85.7951, 86.1990 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_law'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '合众国陆军新汉诺威州驻地')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-798.2072, -1203.9213, 44.1436 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_law'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '合众国陆军新汉诺威州驻地')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-830.5703, -1205.6206, 43.7609 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_herd'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '黑水镇综合格斗拳击馆')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2777.4353, -1314.5063, 46.5623 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_herd'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯赤血地下拳击馆')

    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-395.12, 781.27, 117.75))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_herd'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '金马角斗场')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-388.4591, 688.5271, 117.0120 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_market_stall'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁镇民自由贸易市场')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1436.8907, -1410.5286, 80.0283 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_donate_food'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '罗德镇面包烘培作坊')


end)



Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2716.7744, -1283.8265, 49.5803 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_gunsmith'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯红色左轮武器铺')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-836.4862, -1278.7604, 43.7832 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_gunsmith'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '黑水镇武器铺')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-281.6526, 781.6723, 119.4760 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_gunsmith'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁罗兰小子武器铺')


end)

Citizen.CreateThread(function()
    
        
    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2656.47, -1152.61, 29.98 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_herd'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯艾丁格酒厂办事处')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2690.9846, -859.8197, 42.3196 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_herd'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯艾丁格酒厂生产基地')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-4390.2251, -4040.1628, -26.2646 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_ambient_riverboat'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '墨西哥传奇老黑人摆渡港口')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1348.7213, -6521.5425, 42.2751 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mg_fishing'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓜马岛地中海小胖子钓鱼住所')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(650.6292, -7430.6938, 179.1094 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_camp_tent'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓜马岛隐居部落山中观景台')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1765.1522, -4670.9346, 54.8182 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_camp_tent'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓜马岛惊涛养生地')

    
end)



Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2396.2122, -1515.2130, 45.9846 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_chest'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯史密斯沙龙')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1767.3634, -437.6365, 47.3817 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_chest'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '莱默恩州荒郊酒馆')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-361.6852, -117.1323, 47.6181 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_chest'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '林帕尼小镇复兴酒馆')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2316.9717, -1417.1754, 46.7127 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_cash_arthur'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯康沃尔工厂旧址')

    
end)


Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-784.3756, -1305.2745, 43.7461 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_doctor'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '黑水镇城镇医院')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-232.9357, 797.7167, 124.6774 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mp_pickup'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁德林格温福音大教堂')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2738.5745, -1262.1859, 50.6144 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mp_pickup'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯黑山羊大教堂')

   
end)


Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2383.6777, -1373.4567, 46.4950 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mp_pickup'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯流浪医师湖畔治愈营地')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-157.9757, 626.9532, 113.4857 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_event_railroad_camp'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁铁路公司列车总站')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2725.5476, -1232.2169, 50.3666 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_doctor'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯城市医院')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-284.7393, 805.4153, 119.0859 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_doctor'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁诊所')


end)




Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2666.2976, -1297.3947, 65.0689 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_shop_tackle'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯尖峰时刻观景餐厅')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-790.7095, -1313.5807, 43.6391 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_cash_bag'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '黑水镇烟草公司店铺')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2859.1970, -1392.8925, 52.6324 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mg_poker'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯里贝塔号海上赌舫')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(3140.6387, -1391.4469, 42.6131 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mg_poker'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯红浪漫海上赌舫')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(2532.9897, -1564.7566, 45.9693 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mg_poker'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '圣丹尼斯红浪漫海上赌舫登船点')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-1368.0593, -1113.5277, 75.1326 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_mg_poker'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '黑水镇跳马比赛活动场地')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-1928.7788, -315.2168, 186.1944 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_cash_bag'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '草莓镇鹰眼溪淘金营地')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-235.5643, 618.5901, 113.9793 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_cash_bag'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁镇民小型拍卖市场')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-348.4511, 838.9832, 116.6480 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_campfire_full'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '瓦伦丁老九七巡回乐队演出场地')

    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1368.5341, -1214.9962, 83.4623 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_campfire_full'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '罗德镇老九七巡回乐队演出场地')
    
    
end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-1650.7478, -1375.0364, 83.9631 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_animal'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '爱马士驯马师协会比彻之愿牧场')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(1453.9407, 320.1978, 89.4457 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_animal'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '翡翠牧场')


end)

Citizen.CreateThread(function()


    local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(-2439.7861, -2398.8396, 61.1755 -0.8))
    SetBlipSprite(PrisonBlip, GetHashKey('blip_animal'), true)
    SetBlipScale(PrisonBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, '麦克法兰牧场')


end)








