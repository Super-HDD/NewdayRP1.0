Citizen.CreateThread(function()
	Wait(1000)
	TriggerServerEvent("okokReports:FetchFeedbackTable")
end)
local QBCore = exports['qb-core']:GetCoreObject()
-------------------------- VARS

local oneSync = false
local staff = false
local FeedbackTable = {}
local canFeedback = true
local timeLeft = Config.FeedbackCooldown

-------------------------- COMMANDS

RegisterCommand(Config.FeedbackClientCommand, function(source, args, rawCommand)
	if canFeedback then
		FeedbackMenu(false)
	else
		--exports['okokNotify']:Alert("REPORT", "You can't report so quickly!", 10000, 'warning')
		--exports['Ultra-Notify']:Alert("报告", "你不能这么快报告!", 10000, 'warning')
		QBCore.Functions.Notify("你不能这么快报告!", 'info')
	end
end, false)

RegisterCommand(Config.FeedbackAdminCommand, function(source, args, rawCommand)
	if staff then
		FeedbackMenu(true)
	end
end, false)

RegisterNetEvent('report:NewFeedback')
AddEventHandler('report:NewFeedback', function(source, args, rawCommand)
	if canFeedback then
		FeedbackMenu(false)
	else
		--exports['okokNotify']:Alert("REPORT", "You can't report so quickly!", 10000, 'warning')
		--exports['Ultra-Notify']:Alert("报告", "你不能这么快报告!", 10000, 'warning')
		QBCore.Functions.Notify("你不能这么快报告!", 'info')
	end
end)

-------------------------- MENU

function FeedbackMenu(showAdminMenu)
	SetNuiFocus(true, true)
	if showAdminMenu then
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
		SendNUIMessage({
			action = "OpenAdminFeedback",
		})
	else
		SendNUIMessage({
			action = "ClientFeedback",
		})
	end
end

-------------------------- EVENTS

RegisterNetEvent('okokReports:NewFeedback')
AddEventHandler('okokReports:NewFeedback', function(newFeedback)
	if staff then
		FeedbackTable[#FeedbackTable+1] = newFeedback
--exports['okokNotify']:Alert("REPORT", "New Report Some one needs help!", 20000, 'success')
--exports['Ultra-Notify']:Alert("报告", "新报告 有人需要帮助!", 10000, 'warning')
QBCore.Functions.Notify("新报告 有人需要帮助!", 'info')
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	end
end)

RegisterNetEvent('okokReports:FetchFeedbackTable')
AddEventHandler('okokReports:FetchFeedbackTable', function(feedback, admin, oneS)
	FeedbackTable = feedback
	staff = admin
	oneSync = oneS
end)

RegisterNetEvent('okokReports:FeedbackConclude')
AddEventHandler('okokReports:FeedbackConclude', function(feedbackID, info)
	local feedbackid = FeedbackTable[feedbackID]
	feedbackid.concluded = info

	SendNUIMessage({
		action = "updateFeedback",
		FeedbackTable = FeedbackTable
	})
end)

-------------------------- ACTIONS

RegisterNUICallback("action", function(data)
	if data.action ~= "concludeFeedback" then
		SetNuiFocus(false, false)
	end

	if data.action == "newFeedback" then
		--exports['okokNotify']:Alert("REPORT", "Report successfully sent to the STAFF!", 20000, 'success')
		--exports['Ultra-Notify']:Alert("报告", "报告已成功发送给工作人员!", 10000, 'success')
		QBCore.Functions.Notify("报告已成功发送给工作人员!", 'success')
		
		local feedbackInfo = {subject = data.subject, information = data.information, category = data.category}
		TriggerServerEvent("okokReports:NewFeedback", feedbackInfo)

		local time = Config.FeedbackCooldown * 60
		local pastTime = 0
		canFeedback = false

		while (time > pastTime) do
			Citizen.Wait(1000)
			pastTime = pastTime + 1
			timeLeft = time - pastTime
		end
		canFeedback = true
	elseif data.action == "assistFeedback" then
		if FeedbackTable[data.feedbackid] then
			if oneSync then
				TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
			else
				local playerFeedbackID = FeedbackTable[data.feedbackid].playerid
				local playerID = GetPlayerFromServerId(playerFeedbackID)
				local playerOnline = NetworkIsPlayerActive(playerID)
				if playerOnline then
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerFeedbackID))))
					TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
				else
					--exports['okokNotify']:Alert("REPORT", "That player is no longer in the server!", 20000, 'error')
					--exports['Ultra-Notify']:Alert("报告", "该玩家已不在服务器中!", 20000, 'error')
					QBCore.Functions.Notify("该玩家已不在服务器中", 'error')
				end
			end
		end
	elseif data.action == "concludeFeedback" then
		local feedbackID = data.feedbackid
		local canConclude = data.canConclude
		local feedbackInfo = FeedbackTable[feedbackID]
		if feedbackInfo then
			if feedbackInfo.concluded ~= true or canConclude then
				TriggerServerEvent("okokReports:FeedbackConclude", feedbackID, canConclude)
				--exports['okokNotify']:Alert("反馈", "反馈 #"..feedbackID.." 总结!", 20000, 'success')
				--exports['Ultra-Notify']:Alert("报告", "反馈 #"..feedbackID.." 总结!", 20000, 'success')
				QBCore.Functions.Notify("反馈 #"..feedbackID.." 总结!", 'success')
			end
		end
	end
end)