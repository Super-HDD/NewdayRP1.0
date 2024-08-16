local QBCore = exports['qb-core']:GetCoreObject()
local MenuData={}
local CurrentName
local CurrentZone
local CurrentVolume={}

TriggerEvent("qb-menubase:getData", function(call)
    MenuData = call
  end)

-- 初始化
-- 创建交互提示
Citizen.CreateThread(function() 
    for _,v in pairs(Config.MusicBoxLocations) do
      exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], Lang:t('menu.open_musicbox'), {
        type = 'client',
        event = 'musicbox:client:mainmenu',
        args = { v.location, v.coords },
      }) 
    end
end)

--菜单

local function playMusicByName(filename)
    print(QBCore.Debug(filename))
    local MusicPath = './sounds/'..filename
    TriggerServerEvent('qb-saloontendeer:server:playMusic', MusicPath , CurrentName, CurrentZone)
end

local function openMusicList()
    local MusicList={}
    QBCore.Functions.TriggerCallback('qb-saloontendeer:server:load-music-list', function(musics)
        print(QBCore.Debug(musics))
        if musics[1] then
            for i=1,#musics do
                table.insert(MusicList,{label = musics[i],value = musics[i],   desc = ""})
            end  
        end
        print(QBCore.Debug(MusicList))
        MenuData.CloseAll()
        MenuData.Open(
            'default', 
            GetCurrentResourceName(), 
            'musicbox_musiclist',
            {
                title = Lang:t("menu.musiclist_title"), 
                subtext = '选项', 
                align = '左上角', 
                elements = MusicList
            }, 
            function(data, menu)
                playMusicByName(data.current.value)
            end, 
            function(data, menu)
                MainMenu()
            end
        )
        
    end)
end

local function stopMusic()
    TriggerServerEvent('qb-saloontendeer:server:stopMusic', CurrentName, CurrentZone)
end

local MainMenuActions={
    ["playMusic"]=function()
        openMusicList()
    end,
    ["stopMusic"]=function()
        stopMusic()
    end,
}

function MainMenu()
    MenuData.CloseAll()
    local elements={
        {label = Lang:t('播放音乐'),value = 'playMusic',   desc = ""},
        {label = Lang:t('调整音量'),value = CurrentVolume[CurrentName] or 1,   desc = "",type="slider",min=1,max=100},
        {label = Lang:t('停止播放'),value = 'stopMusic',   desc = ""},
    }
    MenuData.Open(
        'default', 
        GetCurrentResourceName(), 
        'musicbox_mainmenu',
        {
            title = Lang:t("menu.musicbox_title"), 
            subtext = '选项', 
            align = '左上角', 
            elements = elements
        }, 
        function(data, menu)
            if type(data.current.value)=="string" then
                MainMenuActions[data.current.value]()
            end
        end, 
        function(data, menu)
            MenuData.CloseAll()
        end, 
        function(data, menu)
            -- if CreatorCache[data.current.category] ~= data.current.value then
            --     CreatorCache[data.current.category] = data.current.value
            --     BodyFunctions[data.current.category](PlayerPedId(), CreatorCache)
            -- end
            if type(data.current.value)=="number" and CurrentVolume[CurrentName]~=data.current.value then
                CurrentVolume[CurrentName]=data.current.value
                TriggerServerEvent('qb-saloontendeer:server:changeVolume',data.current.value/100, CurrentName,CurrentZone)
            end
            
        end
    )
end

RegisterNetEvent('musicbox:client:mainmenu',function(name,zone)
    CurrentName=name
    CurrentZone=zone
    MainMenu()
end)
  

