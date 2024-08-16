local QBCore = exports['qb-core']:GetCoreObject()
local jobcheck = false

-- billing menu
RegisterNetEvent('qb-billing:client:billingMenu', function()
    local PlayerId = GetPlayerServerId(PlayerId())
    local BillsOptions = {
        {
            header = '计费菜单',
            isMenuHeader = true,
            icon = 'fas fa-file-invoice-dollar',
        },
        {
            header = '发送账单',
            icon = 'fas fa-dollar-sign',
            txt    = '',
            params = { event = 'qb-billing:client:billplayer' }
        },
        {
            header = '查看您的账单',
            icon = 'fas fa-dollar-sign',
            txt    = '',
            params = { event = 'qb-billing:client:checkbills' }
        },
        {
            header = '取消已发送的账单',
            icon = 'fas fa-dollar-sign',
            txt    = '',
            params = { event = 'qb-billing:client:deletebills' }
        },
        {
            header = '关闭',
            icon   = 'fa-solid fa-circle-xmark',
            txt    = '',
            params = { event = 'qb-menu:closeMenu', }
        },
    }
    exports['qb-menu']:openMenu(BillsOptions)
end)

-- send bill to player (client:billplayer)
RegisterNetEvent('qb-billing:client:billplayer', function()
    local dialog = exports['qb-input']:ShowInput({
    header = "创建账单",
    submitText = "发送账单",
        inputs = {
            {
                text = "玩家ID",
                name = "playerid",
                type = "number",
                isRequired = false,
            },
            {
                text = "账单价格 ($)",
                name = "billprice",
                type = "number",
                isRequired = false,
            },
            {
                text = "票据类型",
                name = "billtype",
                type = "radio",
                options = {
                    { value = "player", text = "个人帐单" },
                    { value = "society", text = "单位账单" },
                },
            },
        }
    })
    if dialog == nil then return end
    if dialog == "" then return QBCore.Functions.Notify("你什么都没写", 'error') end
    if dialog.playerid == "" then return QBCore.Functions.Notify("你没有写玩家id", 'error') end
    if dialog.billprice == "" then return QBCore.Functions.Notify("你没有写帐单价格", 'error') end
    if dialog.billtype == 'society' then
        local playerjob = QBCore.Functions.GetPlayerData().job.name
        jobcheck = false
        for _, name in pairs(Config.VerifySociety) do
            if name == playerjob then
                jobcheck = true
            end
        end
        if jobcheck == true then
            TriggerServerEvent('qb-billing:server:sendSocietyBill', dialog.playerid, dialog.billprice, playerjob)    
        else
            QBCore.Functions.Notify('你不是社会的一部分!', 'error')
        end
    end
    if dialog.billtype == 'player' then
        TriggerServerEvent('qb-billing:server:sendPlayerBill', dialog.playerid, dialog.billprice)
    end
end, false)

-- check bills with callback (client:checkbills)
RegisterNetEvent('qb-billing:client:checkbills', function()
    local PlayerId = GetPlayerServerId(PlayerId())
    QBCore.Functions.TriggerCallback('qb-billing:server:checkbills', function(bills, cid)
        local BillsShow = {
            {
                header = '未付账单 | ID: ' .. PlayerId,
                isMenuHeader = true,
                icon = 'fas fa-file-invoice-dollar',
            },
            {
                header = '公民 ID: ' .. cid,
                isMenuHeader = true,
                icon = 'fas fa-id-card-clip',
            },
        }
        
        for _, v in ipairs(bills) do
            BillsShow[#BillsShow + 1] = {
                header = '金额: ' .. v.amount .. '$',
                icon = 'fas fa-dollar-sign',
                txt = 'ID : ' ..v.id ..' | 来自 : ' .. v.sender .. ' | ' .. v.society,
                params = { event = 'qb-billing:server:paybills', 
                    isServer = true,
                    args = {
                        sender = v.sender, 
                        amount = v.amount, 
                        billid = v.id, 
                        society = v.society,
                        citizenid = v.citizenid,
                        sendercitizenid = v.sendercitizenid
                    } 
                }
            }
        end

        BillsShow[#BillsShow + 1] = {
            header = '关闭',
            icon   = 'fa-solid fa-circle-xmark',
            txt    = '',
            params = { event = 'qb-menu:closeMenu', }
        }

        exports['qb-menu']:openMenu(BillsShow)
    end, PlayerId)
end)

-- cancel bills with callback -> cancel bill confirm
RegisterNetEvent('qb-billing:client:deletebills', function()

    QBCore.Functions.TriggerCallback('qb-billing:server:checkSentBills', function(sentbills, citizenid)

        local SentBillsShow = {
            {
                header = '已发送账单',
                isMenuHeader = true,
                icon = 'fas fa-file-invoice-dollar',
            },
            {
                header = '公民 ID: ' .. citizenid,
                isMenuHeader = true,
                icon = 'fas fa-id-card-clip',
            },
        }
        
        for _, v in ipairs(sentbills) do
            SentBillsShow[#SentBillsShow + 1] = {
                header = '金额: ' .. v.amount .. '$',
                icon = 'fas fa-dollar-sign',
                txt = 'ID : ' .. v.id .. ' | 给 : ' .. v.citizenid,
                params = { event = 'qb-billing:client:cancelbill', 
                    isServer = false,
                    args = {
                        billid = v.id,
                    } 
                }
            }
        end

        SentBillsShow[#SentBillsShow + 1] = {
            header = '关闭',
            icon   = 'fa-solid fa-circle-xmark',
            txt    = '',
            params = { event = 'qb-menu:closeMenu', }
        }

        exports['qb-menu']:openMenu(SentBillsShow)
    end)
	
end)

-- cancel bill confirm
RegisterNetEvent('qb-billing:client:cancelbill', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = "取消账单",
        submitText = "Submit",
        inputs = {
            {
                text = "账单 ID : "..data.billid,
                name = "cancelbill",
                type = "radio",
                options = {
                    { value = "yes", text = "是的" },
                    { value = "no", text = "不" },
                },
            },
        },
    })

    if dialog ~= nil then
        if Config.Debug == true then
            print(dialog.cancelbill)
            print(data.billid)
        end
        if dialog.cancelbill == 'yes' then
            TriggerServerEvent('qb-billing:server:cancelbill', tonumber(data.billid))
            QBCore.Functions.Notify('账单取消!', 'primary')
        else
            QBCore.Functions.Notify('账单未取消!', 'primary')
            return
        end
    end
end, false)
