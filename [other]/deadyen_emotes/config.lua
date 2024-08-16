Config = {}

Config.Title = '动作菜单' -- Title that is going to be displayed on the top of the menu
Config.Text = 'NEWDAYRP西部拓荒角色扮演中文社区' -- small text that is going to be displayed under Config.Title
Config.Side = 'right' -- left, right or custom
Config.SideCustom = {x = 0, y = 100} -- only edit if you put 'custom' in Config.Side
Config.CustomMenuBackground = {
    textureDict = "generic_textures",
    texture = "selection_box_bg_1c",
} -- RedM currently seems to not support DUI. If you stream a custom texture or you find one you want to use in the game you can do so here.
-- here's a link to textures you could use. https://github.com/femga/rdr3_discoveries/tree/31d2059894bc16dea87ca30034bffc15e475ee1c/useful_info_from_rpfs/textures/menu_textures

Config.WalkAnims = true -- Do you want Walk animations as an option?
Config.LimitSpeed = true -- Do you want Limiting walk speed as an option?


Config.OpenControl = 0x1F6D95E5 -- F4
Config.OpenCommand = 'emotemenu' -- opens the emotemenu
Config.ShortCommand = 'e' -- plays the emote entered after this command for example: /e sit

Config.SmoothHandsUp = true -- do you want to have a smooth handsup animation? -- might interfere with vorp and its own handsup animation
Config.HandsUpControl = 0x7DA48D2A -- X

Config.SmoothCrossArms = true -- do you want to have a smooth cross arms animation?
Config.CrossArmsControl = 0x5415BE48 -- G
Config.ShouldCancelEmotes = true -- should cancel emotes after you press G twice?
Config.CrossArmsAnim = {
    animDict =  "script_story@fin2@ig@ig10_charles_and_crowd",
    anim = "crowd_loop_sheriff"
}

Config.Ragdoll = true -- do you want to use our ragdoll system that does not feature any twitching?
Config.RagdollKeybind = false -- do you want to use a ragdoll keybind?
Config.RagdollControl = 0xD8F73058 -- U
Config.RagdollCommand = 'rag' -- do you want to use a ragdoll command? leave empty if not.

Config.CustomAnimations = { -- this allows you to add custom animations and also replace any animation by using the same name. You have to include AnimationOptions on every animation.
    --[[ ["example"] = {"animDict", "animation", "Example Name", AnimationOptions =
    { --here are all options you can use explained
        EmoteMoving = true, -- if this is true it allows you to move with the animation (it only plays on the upper body.)
        EmoteDuration = 2500, -- only use this if you don't use EmoteLoop/EmoteStopAtLastFrame and you want to cut the animation you're using short. the time is in ms.
        EmoteStopAtLastFrame = false, -- if this is true the emote will be stuck on the last frame of the animation. Usefull for animations that don't loop correctly. Only use without EmoteLoop.
        EmoteLoop = false, -- loops the animation. only use without EmoteDuration and EmoteStopAtLastFrame.
    }}, ]]
    ["reaching"] = {"mech_busted@unapproved", "reach_weapon", "Reaching", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["me"] = {"script_common@gestures@unapproved", "gesture_me_hard", "Me", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["pray"] = {"amb_misc@world_human_pray_rosary@base", "base", "Pray", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteStopAtLastFrame = true,
    }}, -- some example emotes for you to get started

}


Config.Locales = {
    ["anims"] = "动画仓库",
    ["cancelanim"] = "取消动画",
    ["walk"] = "行走动画",
    ["dances"] = "→跳舞",
    ["emotes"] = "→表情动作",
    ["static"] = "→静止动画",
    ["search"] = "→搜索表情动作",
    ["searchinput"] = "输入表情动作名称",
    ["staticdesc"] = "在表情动作期间是否移动？",
    ["limitspeed"] = "→限制行走速度",
    ["limitdesc"] = "限制行走速度",
    ["speed"] = "→行走速度",
    ["notvalid"] = "不是有效的动画。",
    ["maleonly"] = "此动画仅适用于男性。",
    ["chatsuggestion"] = "打开表情动作菜单。您还可以使用 F4 键。",
    ["chatsuggestion2"] = "播放您输入的表情动作。",

}

Config.Notification = 'chat' -- redemrp, vorp, gum_notify or chat. If you want to you can use your own notification system in the function below.

SendNotification = function(text) -- not really sure about any of these framework notifications so please correct these if they dont work :)
	if Config.Notification == 'redemrp' then
		TriggerEvent('redem_roleplay:Tip', text, 7500)
	elseif Config.Notification == 'vorp' then
		TriggerEvent("vorp:TipRight", text, 7500)
	elseif Config.Notification == 'gum_notify' then
		exports['gum_notify']:DisplayLeftNotification(Config.Title, text, '', 7500)
	elseif Config.Notification == 'chat' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(21,76,121,200); border-radius: 10px; display:inline-block; text-shadow: 2px 2px #000000;"> {0}</div>',
              args = { "^5"..Config.Title .. '^0: ^7' .. text}
          })
	end
end
