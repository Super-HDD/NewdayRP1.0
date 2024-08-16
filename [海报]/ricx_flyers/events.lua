local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local notifSettings = {}
-----------------------------------------------------------------------------------------------------
local notifSettings = {
	[1] = {
		TEXTS.Flyer, TEXTS.NoRemover, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[2] = {
		TEXTS.Flyer, TEXTS.NothingtoAdd, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[3] = {
		TEXTS.Flyer, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	--[[
	[] = {
		TEXTS.TEXT, TEXTS.Saved, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
]]
}

-----------------------------------------------------------------------------------------------------
function CallFlyerNotif(id, extra)
	local _id = tonumber(id)
	local title = notifSettings[_id][1]
	local text = notifSettings[_id][2]
	local dict = notifSettings[_id][3]
	local texture = notifSettings[_id][4]
	local timer = notifSettings[_id][5]

------------------EXTRA CODE START------------------
	if extra ~= nil then 						 --|
		if extra.title ~= nil then 				 --|
			title = extra.title					 --|
		end									 	 --|
		if extra.text ~= nil then 				 --|
			text = extra.text					 --|
		end										 --|
		if extra.dict ~= nil then 				 --|
			dict = extra.dict					 --|
		end										 --|
		if extra.texture ~= nil then 			 --|
			texture = extra.texture				 --|
		end										 --|
		if extra.timer ~= nil then 				 --|
			timer = extra.timer					 --|
		end										 --|
	end											 --|
------------------EXTRA CODE END------------------
	TriggerEvent("Notification:ricx_flyers", title, text, dict, texture, timer)--change this to a different notification logic if you want
end
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_flyers:call_notif", function(id, extra)
	local _id = tonumber(id)
	CallFlyerNotif(_id, extra)
end)