VORPcore = {}
RedEM = {}
local QBCore = exports['qb-core']:GetCoreObject()
if framework == "vorp" then
	TriggerEvent("getCore", function(core)
		VORPcore = core
	end)
elseif framework == "redem-2" then
    RedEM = exports["redem_roleplay"]:RedEM()
end


--- SNIPET FROM TAKE CARD, JUST CHANGE IT IF YOU NKOW WHAT YOU DO ---
--- SNIPET FROM TAKE CARD, JUST CHANGE IT IF YOU NKOW WHAT YOU DO ---
--- SNIPET FROM TAKE CARD, JUST CHANGE IT IF YOU NKOW WHAT YOU DO ---

-- IT IS EXAMPLE OF THE DECK CARDS OF THE DEALER
-- 	"2_s01x", "2_h01x", "2_d01x", "2_c01x",
-- 	"3_s01x", "3_h01x",	"3_d01x", "3_c01x",
-- 	"4_s01x", "4_h01x",	"4_d01x", "4_c01x",
-- 	"5_s01x", "5_h01x",	"5_d01x", "5_c01x",
-- 	"6_s01x", "6_h01x",	"6_d01x", "6_c01x",
-- 	"7_s01x", "7_h01x",	"7_d01x", "7_c01x",
-- 	"8_s01x", "8_h01x",	"8_d01x", "8_c01x",
-- 	"9_s01x", "9_h01x",	"9_d01x", "9_c01x",
-- 	"10_s01x", "10_h01x", "10_d01x", "10_c01x",
-- 	"j_s01x", "j_h01x", "j_d01x", "j_c01x",
-- 	"q_s01x", "q_h01x", "q_d01x", "q_c01x",
-- 	"k_s01x", "k_h01x", "k_d01x", "k_c01x",
-- 	"a_s01x", "a_h01x", "a_d01x", "a_c01x"

function takeCard(tDeck)
	--[[ 
		This role is responsible for dealing cards to players and dealer. 
		It's totally random, you can work on top of this function if you want to change the players' luck

		It will also influence the luck of the card to the dealer
	]]

	math.randomseed(GetGameTimer() + math.random(111111, 999999))

	return table.remove(tDeck, math.random(1,#tDeck))
end

function GetPlayerFromId(playerId)
    if framework == "redem" then
        return exports.redemrp_roleplay:getPlayerFromId(playerId)
	elseif framework == "redem-2" then
        return RedEM.GetPlayer(playerId)
    elseif framework == "vorp" then
        return VORPcore.getUser(playerId).getUsedCharacter
    elseif framework == "custom" then
		return nil
	elseif framework == "rsg" then
		
        return QBCore.Functions.GetPlayer(playerId)
    end
end

function GiveMoney(player, money)
	if giveChipsCallback ~= nil then
		giveChipsCallback(player, tonumber(money))
	end

	local src = source
    local Player = QBCore.Functions.GetPlayer(player)

	if framework == "redem" then
		Player.addMoney(money)
    elseif framework == "redem-2" then
        Player.AddMoney(money)
	elseif framework == "vorp" then
		Player.addCurrency(0, money + 0.001)
	elseif framework == "rsg" then
		-- local inventoryItemId = glow:GetPersonaInventory(Player)
		-- exports.nxt_inventory:AddItem(inventoryItemId, 'money', money + 0.001)
		Player.Functions.AddMoney('cash', tonumber(money))		
	end

	TriggerClientEvent('texas:notify:native', player, string.format(Locale['you_win_amount'], tostring(money)), 6000)

	DebugPrint("MONEY: GIVE "..GetPlayerName(player):upper().." "..money)
end


function TakeMoney(player, money)
	if takeChipsCallback ~= nil then
		takeChipsCallback(player, tonumber(money))
	end
	local src = source
    local Player = QBCore.Functions.GetPlayer(player)

	if framework == "redem" then
		Player.removeMoney(money)
    elseif framework == "redem-2" then
        Player.RemoveMoney(money)
	elseif framework == "vorp" then
		Player.removeCurrency(0, money)
	elseif framework == "rsg" then
		-- local inventoryItemId = glow:GetPersonaInventory(Player)
		-- exports.nxt_inventory:RemoveItem(inventoryItemId, 'money', money + 0.001)
		Player.Functions.RemoveMoney("cash", tonumber(money))
	end

    TriggerClientEvent('texas:notify:native', player, string.format(Locale['you_place_bet'], tostring(money)), 6000)
	DebugPrint("MONEY: TAKE "..GetPlayerName(player):upper().." "..money)
end


function CheckPlayerBet(i, bet)
	local src = source
	
	local ItemList = {
		["money"] = 1,
	}
	
	DebugPrint("TABLE "..i..": CHECKING "..GetPlayerName(source):upper().."'s CHIPS")

	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local money = 0

	if framework == "redem" then
		money = Player.getMoney()
    elseif framework == "redem-2" then
        money = Player.money
	elseif framework == "vorp" then
		money = Player.money
	elseif framework == "rsg" then
		money = Player.Functions.GetMoney('cash')
		-- local inventoryItemId = glow:GetPersonaInventory(Player)
		-- money = exports.nxt_inventory:GetItem(inventoryItemId, 'money', nil, true)
	end

	local canBet = false

	DebugPrint('cash', money)

	if money >= bet then
		canBet = true
	end

	TriggerClientEvent("BLACKJACK:BetReceived", src, canBet)
end