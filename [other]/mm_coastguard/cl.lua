local WaterTypes = {
   [-247856387] = "Sea of Coronado",
    [-1504425495] = "San Luis River",
    [-1369817450] = "Lake Don Julio",
    [-1356490953] = "Flat Iron Lake",
    [-1781130443] = "Upper Montana River",
    [-1300497193] = "Owanjila",
    [-1276586360] = "Hawks Eye Creek",
    [-1410384421] = "Little Creek River",
    [370072007] = "Dakota River",
    [650214731] = "Beartooth Beck",
    [592454541] = "Lake Isabella",
    [-804804953] = "Cattail Pond",
    [1245451421] = "Deadboot Creek",
    [-218679770] = "Spider Gorge",
    [-1817904483] = "O'Creagh's Run",
    [-811730579] = "Moonstone Pond",
    [-1229593481] = "Kamassa River",
    [-105598602] = "Elysian Pool",
    [1755369577] = "Heartland Overflow",
    [-557290573] = "Bayou NWA",
    [-2040708515] = "Lannahechee River",
    [231313522] = "Calmut Ravine",
    [2005774838] = "Ringneck Creek",
    [-1287619521] = "Stillwater Creek",
    [-1308233316] = "Lower Montana River",
    [-196675805] = "Aurora Basin",
    [-49694339] = "Arroyo De La Vibora",
    [-261541730] = "Whinyard Strait",
    [1175365009] = "Hot Springs",
    [795414694] = "Barrow Lagoon",
    [469159176] = "Dewberry Creek",
    [-1073312073] = "Cairn Lake",
    [301094150] = "Mattlock Pond",
    [-823661292] = "Southfield Flats"
}

local TeleportVectors = {}

function AddTeleportVector(vector)
    table.insert(TeleportVectors, vector)
end

function IsPlayerInWater()
    return IsEntityInWater(PlayerPedId())
end

function IsPlayerDead()
    return IsEntityDead(PlayerPedId())
end

function FadeScreen(milliseconds, fadeOut)
    local fadeType = 0
    if fadeOut then
        fadeType = 255
    end
    DoScreenFadeOut(milliseconds)
    Citizen.Wait(milliseconds)
    DoScreenFadeIn(milliseconds)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local waterHash = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x + 3, coords.y + 3, coords.z)

        if IsPlayerInWater() and IsPlayerDead() and waterHash then
            local nearestCoord = GetNearestCoordinate(coords)
            FadeScreen(2000, true) -- Fade screen to black
            SetEntityCoords(playerPed, nearestCoord)
            FadeScreen(10000, false) -- Fade screen back in
        end
    end
end)

function GetNearestCoordinate(sourceCoord)
    local nearestCoord = nil
    local shortestDistance = math.huge

    for _, coord in ipairs(TeleportVectors) do
        local distance = #(sourceCoord - coord)

        if distance < shortestDistance then
            shortestDistance = distance
            nearestCoord = coord
        end
    end

    return nearestCoord
end

-- Add your own teleport vectors here using AddTeleportVector(vector3(x, y, z))
AddTeleportVector(vector3(44.72, -682.79, 42.36))
AddTeleportVector(vector3(589.56, -622.48, 42.53))
AddTeleportVector(vector3(657.78, -872.17, 42.49))
AddTeleportVector(vector3(739.44, -1265.76, 42.29))
AddTeleportVector(vector3(911.36, -1747.97, 41.38))
AddTeleportVector(vector3(1123.16, -2241.15, 43.31))
AddTeleportVector(vector3(1536.29, -2136.7, 42.4))
AddTeleportVector(vector3(1986.64, -1903.76, 41.74))
AddTeleportVector(vector3(2065.45, -1576.9, 41.95))
AddTeleportVector(vector3(2099.33, -1220.1, 42.38))
AddTeleportVector(vector3(2402.39, -1518.33, 45.97))
AddTeleportVector(vector3(2821.61, -1435.29, 42.8))
AddTeleportVector(vector3(2807.55, -865.19, 41.78))
AddTeleportVector(vector3(2215.79, -673.03, 41.96))
AddTeleportVector(vector3(2174.1, -1123.2, 41.68))
AddTeleportVector(vector3(2310.69, -1263.52, 44.38))
AddTeleportVector(vector3(2100.74, -1428.79, 41.73))
AddTeleportVector(vector3(2586.67, -954.06, 41.5))
AddTeleportVector(vector3(2840.85, -41.18, 44.08))
AddTeleportVector(vector3(3014.26, 420.45, 41.69))
AddTeleportVector(vector3(3016.44, 577.31, 42.83))
AddTeleportVector(vector3(3063.34, 778.72, 42.85))
AddTeleportVector(vector3(2902.46, 870.13, 43.24))
AddTeleportVector(vector3(2888.75, 1190.4, 42.41))
AddTeleportVector(vector3(2984.42, 1290.19, 42.02))
AddTeleportVector(vector3(3137.17, 1458.86, 42.38))
AddTeleportVector(vector3(3398.88, 1422.47, 49.34))
AddTeleportVector(vector3(3655.96, 1426.54, 45.68))
AddTeleportVector(vector3(3838.17, 1498.35, 72.79))
AddTeleportVector(vector3(2854.03, 2210.72, 157.29))
AddTeleportVector(vector3(2914.02, 2295.63, 157.63))
AddTeleportVector(vector3(2823.77, 2313.94, 157.17))
AddTeleportVector(vector3(2737.7, 2117.49, 166.39))
AddTeleportVector(vector3(2692.35, 2031.26, 159.43))
AddTeleportVector(vector3(2669.64, 1950.88, 102.88))
AddTeleportVector(vector3(2621.21, 1956.23, 86.78))
AddTeleportVector(vector3(2586.83, 1840.44, 86.77))
AddTeleportVector(vector3(2467.24, 1836.67, 98.83))
AddTeleportVector(vector3(2463.36, 1735.98, 86.36))
AddTeleportVector(vector3(2495.26, 1526.99, 85.58))
AddTeleportVector(vector3(2395.31, 1548.81, 86.63))
AddTeleportVector(vector3(2234.09, 1618.94, 85.47))
AddTeleportVector(vector3(2200.11, 1457.39, 85.71))
AddTeleportVector(vector3(2270.84, 1284.56, 94.37))
AddTeleportVector(vector3(2373.6, 1142.58, 93.98))
AddTeleportVector(vector3(2373.66, 1005.3, 88.16))
AddTeleportVector(vector3(2303.06, 914.26, 73.94))
AddTeleportVector(vector3(2481.43, 837.31, 74.02))
AddTeleportVector(vector3(2394.89, 707.49, 68.01))
AddTeleportVector(vector3(2427.67, 580.73, 68.23))
AddTeleportVector(vector3(2516.18, 509.09, 65.05))
AddTeleportVector(vector3(2409.0, 378.89, 58.3))
AddTeleportVector(vector3(2291.07, 269.88, 44.69))
AddTeleportVector(vector3(2425.58, 157.94, 43.22))
AddTeleportVector(vector3(2455.1, 21.53, 43.84))
AddTeleportVector(vector3(2335.01, -34.63, 42.73))
AddTeleportVector(vector3(2305.41, -261.16, 42.22))
AddTeleportVector(vector3(2098.83, -254.35, 41.77))
AddTeleportVector(vector3(1940.18, -324.58, 43.73))
AddTeleportVector(vector3(2035.64, -645.8, 42.51))
AddTeleportVector(vector3(1877.92, -772.52, 42.46))
AddTeleportVector(vector3(1708.49, -699.7, 42.04))
AddTeleportVector(vector3(1546.94, -737.2, 44.59))
AddTeleportVector(vector3(1619.19, -1014.78, 41.61))
AddTeleportVector(vector3(1623.31, -1206.05, 43.75))
AddTeleportVector(vector3(1906.82, -1126.42, 42.38))
AddTeleportVector(vector3(2060.47, -1415.46, 42.1))
AddTeleportVector(vector3(2063.74, -1620.28, 41.95))
AddTeleportVector(vector3(2098.48, -1814.94, 42.91))
AddTeleportVector(vector3(1398.03, 549.54, 87.73))
AddTeleportVector(vector3(1151.43, 588.89, 89.65))
AddTeleportVector(vector3(1594.59, 1447.06, 146.06))
AddTeleportVector(vector3(1282.9, 1211.09, 149.54))
AddTeleportVector(vector3(1092.52, -1065.11, 68.55))
AddTeleportVector(vector3(1197.68, -1039.38, 66.3))
AddTeleportVector(vector3(1238.75, -917.54, 63.07))
AddTeleportVector(vector3(328.0, -635.16, 42.07))
AddTeleportVector(vector3(-489.01, -630.11, 42.05))
AddTeleportVector(vector3(-759.45, -383.46, 41.97))
AddTeleportVector(vector3(-445.08, -136.71, 42.29))
AddTeleportVector(vector3(-511.09, 221.59, 42.06))
AddTeleportVector(vector3(-847.34, 37.23, 41.8))
AddTeleportVector(vector3(-1233.57, 182.89, 43.86))
AddTeleportVector(vector3(-1131.0, 358.23, 42.68))
AddTeleportVector(vector3(-1058.21, 436.49, 57.68))
AddTeleportVector(vector3(-788.39, 588.52, 56.8))
AddTeleportVector(vector3(-658.07, 850.45, 67.34))
AddTeleportVector(vector3(-514.55, 911.23, 83.4))
AddTeleportVector(vector3(-465.23, 1031.32, 88.39))
AddTeleportVector(vector3(-383.0, 1124.19, 88.45))
AddTeleportVector(vector3(-315.2, 1167.45, 92.06))
AddTeleportVector(vector3(-230.43, 1164.98, 93.2))
AddTeleportVector(vector3(-257.45, 1250.68, 96.19))
AddTeleportVector(vector3(-234.62, 1423.1, 104.44))
AddTeleportVector(vector3(-81.92, 1472.41, 109.84))
AddTeleportVector(vector3(49.62, 1538.57, 113.48))
AddTeleportVector(vector3(208.25, 1533.72, 115.94))
AddTeleportVector(vector3(367.28, 1629.34, 128.43))
AddTeleportVector(vector3(448.27, 1719.15, 129.55))
AddTeleportVector(vector3(505.57, 1802.11, 129.96))
AddTeleportVector(vector3(566.04, 1958.34, 193.56))
AddTeleportVector(vector3(577.36, 2062.56, 212.55))
AddTeleportVector(vector3(641.3, 2151.8, 223.87))
AddTeleportVector(vector3(254.24, 1949.73, 205.21))
AddTeleportVector(vector3(246.14, 1900.46, 205.81))
AddTeleportVector(vector3(152.83, 1835.2, 201.42))
AddTeleportVector(vector3(-1904.11, 1801.55, 235.31))
AddTeleportVector(vector3(-1734.66, 1618.14, 235.3))
AddTeleportVector(vector3(-1452.38, 287.52, 93.67))
AddTeleportVector(vector3(-1706.41, 420.6, 108.24))
AddTeleportVector(vector3(-2159.31, 536.04, 117.1))
AddTeleportVector(vector3(-2398.06, 700.94, 128.89))
AddTeleportVector(vector3(-2605.35, 1046.47, 192.15))
AddTeleportVector(vector3(-2707.01, -326.85, 148.1))
AddTeleportVector(vector3(-2356.88, -480.04, 142.51))
AddTeleportVector(vector3(-2456.32, -307.05, 153.53))
AddTeleportVector(vector3(-2274.27, -473.78, 139.44))
AddTeleportVector(vector3(-2194.41, -580.55, 131.26))
AddTeleportVector(vector3(-2080.25, -743.2, 84.64))
AddTeleportVector(vector3(-1965.94, -1112.98, 75.43))
AddTeleportVector(vector3(-1788.85, -1150.79, 74.65))
AddTeleportVector(vector3(-1826.39, -1213.93, 74.13))
AddTeleportVector(vector3(-1565.15, -1050.86, 66.18))
AddTeleportVector(vector3(-1318.39, -931.04, 58.29))
AddTeleportVector(vector3(-1009.89, -831.17, 43.08))
AddTeleportVector(vector3(-864.42, -996.23, 42.0))
AddTeleportVector(vector3(-667.88, -1044.56, 41.97))
AddTeleportVector(vector3(-660.5, -771.85, 42.25))
AddTeleportVector(vector3(-1836.45, -364.32, 168.65))
AddTeleportVector(vector3(-1635.87, -554.19, 140.46))
AddTeleportVector(vector3(-1498.93, -664.47, 117.47))
AddTeleportVector(vector3(-1207.32, -771.74, 64.06))
AddTeleportVector(vector3(-741.59, -1184.51, 44.28))
AddTeleportVector(vector3(-695.81, -1405.1, 44.98))
AddTeleportVector(vector3(-730.61, -1721.76, 42.23))
AddTeleportVector(vector3(-756.17, -1965.67, 47.2))
AddTeleportVector(vector3(-942.56, -1977.41, 47.26))
AddTeleportVector(vector3(-1253.83, -1999.49, 43.27))
AddTeleportVector(vector3(-1522.35, -2011.04, 41.99))
AddTeleportVector(vector3(-1324.14, -2152.7, 41.96))
AddTeleportVector(vector3(-1495.66, -2190.42, 52.48))
AddTeleportVector(vector3(-1700.24, -2198.72, 46.96))
AddTeleportVector(vector3(-1891.46, -2222.45, 43.74))
AddTeleportVector(vector3(-2085.17, -2174.12, 44.78))
AddTeleportVector(vector3(-2227.65, -2068.31, 59.56))
AddTeleportVector(vector3(-1675.42, -2416.45, 43.76))
AddTeleportVector(vector3(-1825.79, -2415.71, 42.57))
AddTeleportVector(vector3(-1373.58, -2364.35, 43.08))
AddTeleportVector(vector3(-3351.16, -3156.71, -8.63))
AddTeleportVector(vector3(-1430.74, -2678.77, 41.05))
AddTeleportVector(vector3(-2019.54, -3044.78, -11.21))
AddTeleportVector(vector3(-2786.38, -3248.8, -14.94))
AddTeleportVector(vector3(-3043.98, -3569.57, -20.24))
AddTeleportVector(vector3(-3160.48, -3661.66, -21.96))
AddTeleportVector(vector3(-5591.97, -3884.59, -30.63))
AddTeleportVector(vector3(-6349.44, -3755.58, -32.93))
AddTeleportVector(vector3(-6264.44, -3587.58, -30.5))







	

-- Add more vectors as needed
