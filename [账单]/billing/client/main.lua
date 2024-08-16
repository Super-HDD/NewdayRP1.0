local jj = {}

if Config.Core == "rsg" then
    Core = exports["qb-core"]:GetCoreObject()
elseif Config.Core == "esx" then
    Core = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    PlayerJob = Core.Functions.GetPlayerData().job
    PlayerData = Core.Functions.GetPlayerData()
end)


RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    Core.PlayerData = xPlayer
    Core.PlayerLoaded = true
    PlayerData = xPlayer
    PlayerJob = xPlayer.job.name
    Core.PlayerLoaded = true
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(JobInfo)
    PlayerData = Core.Functions.GetPlayerData()
    PlayerJob = JobInfo
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob',  function (JobInfo)
    PlayerData = Core.PlayerData
    PlayerJob = JobInfo.name
end)

AddEventHandler("onResourceStart", function(JobInfo)
    if Config.Core == "rsg" then
        PlayerData = Core.Functions.GetPlayerData()
        PlayerJob = Core.Functions.GetPlayerData().job
    else
        PlayerData = Core.PlayerData
        PlayerJob = Core.PlayerData.job.name
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000)
        TriggerServerEvent("src-billing:getjson")
    end
end)

RegisterNetEvent("src-farm:receivejson", function(data)
    jj = data
end)

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    TriggerServerEvent("src-billing:getjson")
end)

RegisterNetEvent("src-billing:send", function()
    local src = source
    local name

    if Config.Core == "rsg" then
        name = PlayerData.charinfo.lastname .. " " .. PlayerData.charinfo.lastname
    else
        name = PlayerData.firstName .. " " .. PlayerData.lastName
    end

    lib.callback("src-billing:getPlayers", src, function(info)
        local options = {}

        for k, v in pairs(info) do
            if v.dist < Config.Distance and v.job ~= PlayerJob then
                local isMatchingId 

                if Config.Core == "rsg" then
                    isMatchingId = PlayerData.citizenid == v.citizenid
                else
                    isMatchingId = PlayerData.identifier == v.citizenid
                end

                if not isMatchingId then
                    table.insert(options, {
                        icon = "user",
                        title = "[ " .. v.id .. " ]  -  " .. v.name,
                        arrow = true,
                        event = "src-billing:input",
                        description = string.upper(v.job),
                        args = {
                            data = v,
                            job = Config.Core == "rsg" and PlayerJob.name or PlayerJob,
                            author = name,
                            pid = v.sourceplayer,
                            status = "unpaid"
                        }
                    })
                end
            end
        end

        lib.registerContext({
            id = "cu",
            title = "账单菜单",
            options = options
        })

        lib.showContext("cu")
    end)
end)

RegisterNetEvent("src-billing:input", function(data)
    local input = lib.inputDialog("开账单", {
        { type = "number", label = "金额", description = "选择金额", min = 1, required = true, icon = "dollar-sign" },
        { type = "input", label = "理由", description = "选择一个原因", required = true, icon = "arrow-right" }
    })

    if input ~= nil then
        local Amount = input[1]
        local Reason = input[2]
        TriggerServerEvent("addBill", Amount, Reason, data.data, data.job, data.author, data.pid, data.status)
    end
end)

RegisterNetEvent("src-billing:society", function()
    local src = source
    local options = {}

    if Config.Core == "rsg" then
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerJob.name == v.job then
                    table.insert(options, {
                        icon = "user",
                        title = v.name,
                        arrow = true,
                        event = "src-billing:deleteBill",
                        description = "日期 : " .. v.date .. "\n 金额 :  $ " .. v.amount .. " \n原因 : " .. v.reason .. " \n 开单人 : " .. v.author .. " \n 状态 : " .. string.upper(v.status),
                        args = {data = v, job = PlayerJob.name}
                    })
                end
            end
        end
    else
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerJob == v.job then
                    table.insert(options, {
                        icon = "user",
                        title = v.name,
                        arrow = true,
                        event = "src-billing:deleteBill",
                        description = "Date : " .. v.date .. "\n Amount :  $ " .. v.amount .. " \nReason : " .. v.reason .. " \n Sender : " .. v.author .. " \n Status : " .. string.upper(v.status),
                        args = {data = v, job = PlayerJob}
                    })
                end
            end
        end
    end

    lib.registerContext({
        id = "cu",
        title = "单位账单",
        options = options
    })

    lib.showContext("cu")
end)

RegisterNetEvent("src-billing:mybills:menu", function()
    lib.registerContext({
        id = "mybills5",
        title = "账单",
        options = {
            { title = "未支付账单", description = "查看你的 账单", icon = "file-invoice-dollar", event = "src-billing:mybills:paid" },
            { title = "已支付账单", description = "擦看您的单位账单", icon = "file-invoice-dollar", event = "src-billing:mybills:unpaid" }
        }
    })

    lib.showContext("mybills5")
end)

RegisterNetEvent("src-billing:mybills:paid", function()
    local options = {}

    if Config.Core == "rsg" then
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerData.citizenid == v.citizenid and v.status == "paid" then
                    table.insert(options, {
                        icon = "user",
                        title = string.upper(v.job),
                        arrow = true,
                        onSelect = function()
                            lib.alertDialog({
                                header = "**账单信息**",
                                content = "金额: **$" .. v.amount .. "** \n \n 理由: **" .. v.reason .. "** \n \n开单人:  **" .. v.author .. "** \n \n状态: **" .. string.upper(v.status) .. "" .. "** \n \n 日期: **" .. string.upper(v.date) .. "**",
                                centered = true,
                                cancel = false,
                                size = "xl"
                            })
                        end,
                        description = "日期: " .. v.date .. "\n金额: $" .. v.amount .. "\n理由: " .. v.reason .. " \n 开单人 : " .. v.author,
                        args = v
                    })
                end
            end
        end
    else
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerData.identifier == v.citizenid and v.status == "paid" then
                    table.insert(options, {
                        icon = "user",
                        title = string.upper(v.job),
                        arrow = true,
                        onSelect = function()
                            lib.alertDialog({
                                header = "**BILL INFO**",
                                content = "Price: **$" .. v.amount .. "** \n \n Reason: **" .. v.reason .. "** \n \nSender:  **" .. v.author .. "** \n \nStatus: **" .. string.upper(v.status) .. "" .. "** \n \nDate: **" .. string.upper(v.date) .. "**",
                                centered = true,
                                cancel = false,
                                size = "xl"
                            })
                        end,
                        description = "Date: " .. v.date .. "\nAmount: $" .. v.amount .. "\nReason: " .. v.reason .. " \n Sender : " .. v.author,
                        args = v
                    })
                end
            end
        end
    end

    lib.registerContext({
        id = "cu",
        title = "账单",
        options = options
    })

    lib.showContext("cu")
end)


RegisterNetEvent("src-billing:mybills:unpaid", function()
    local src = source
    local options = {}

    if Config.Core == "rsg" then
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerData.citizenid == v.citizenid and v.status == "unpaid" then
                    table.insert(options, {
                        icon = "user",
                        title = string.upper(v.job),
                        arrow = true,
                        event = "src-billing:getCurrentBill",
                        description = "日期: " .. v.date .. "\n金额: $" .. v.amount .. "\n理由: " .. v.reason .. " \n 开单人 : " .. v.author,
                        args = v
                    })
                end
            end
        end
    else
        if jj ~= nil then
            for k, v in pairs(jj) do
                if PlayerData.identifier == v.citizenid and v.status == "unpaid" then
                    table.insert(options, {
                        icon = "user",
                        title = string.upper(v.job),
                        arrow = true,
                        event = "src-billing:getCurrentBill",
                        description = "Date: " .. v.date .. "\nAmount: $" .. v.amount .. "\nReason: " .. v.reason .. " \n Sender : " .. v.author,
                        args = v
                    })
                end
            end
        end
    end

    lib.registerContext({
        id = "cu",
        title = "账单",
        options = options
    })

    lib.showContext("cu")
end)

RegisterNetEvent("src-billing:getCurrentBill", function(data)
    lib.registerContext({
        id = "other_menu",
        title = "Other context menu",
        menu = "cu",
        options = {
            {
                icon = "check",
                title = "支付",
                serverEvent = "src-billing:paybill",
                args = data
            },
            {
                icon = "xmark",
                title = "取消",
                onSelect = function()
                    lib.showContext("cu")
                end
            }
        }
    })

    lib.showContext("other_menu")
end)

RegisterNetEvent("src-billing:deleteBill", function(data)
    lib.registerContext({
        id = "other_menu",
        title = "Other context menu",
        menu = "cu",
        options = {
            {
                icon = "xmark",
                serverEvent = "src-billing:deleteBill",
                args = data,
                title = "Cancel Bill"
            }
        }
    })

    lib.showContext("other_menu")
end)


RegisterNetEvent("src-billing:openmenu", function()

    local foundJob = false

    for i, job in ipairs(Config.Jobs) do
        if job == PlayerData.job.name then
            lib.registerContext({
                id = "mybills5",
                title = "账单",
                options = {
                    { title = "个人帐单", description = "查看个人账单", icon = "file-invoice-dollar", event = "src-billing:mybills:menu" },
                    { title = "单位账单", description = "查看单位账单", icon = "file-invoice-dollar", event = "src-billing:society" },
                    { title = "开账单", description = "将账单发送给其他 公民", icon = "file-invoice-dollar", event = "src-billing:send" }
                }
            })

            lib.showContext("mybills5")
            foundJob = true
            break
        end
    end

    if not foundJob then
        lib.registerContext({
            id = "mybills2",
            title = "账单",
            options = {
                { title = "个人帐单", description = "查看个人账单", icon = "file-invoice-dollar", event = "src-billing:mybills:menu" }
            }
        })

        lib.showContext("mybills2")
    end
end)
