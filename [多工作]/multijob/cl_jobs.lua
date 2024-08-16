local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('jobs', function(source, args)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local dutyStatus = PlayerData.job.onduty and '上班' or '下班'
    local dutyIcon = PlayerData.job.onduty and 'fa-solid fa-toggle-on' or 'fa-solid fa-toggle-off'
    local jobMenu = {
        id = 'job_menu',
        title = '我的工作',
        options = {
            {
                title = '上下班',
                description = '当前状态: ' .. dutyStatus,
                icon = dutyIcon,
                event = 'multijob:client:toggleDuty',
                args = {},
            },
        },
    }
    lib.callback('multijob:server:myJobs', false, function(myJobs)
        if myJobs then
            for _, job in ipairs(myJobs) do
                local isDisabled = PlayerData.job.name == job.job
                jobMenu.options[#jobMenu.options + 1] = {
                    title = job.jobLabel,
                    description = '职位: ' .. job.gradeLabel .. ' [' .. tonumber(job.grade) .. ']\n工资: $' .. job.salary,
                    icon = Config.JobIcons[job.job] or 'fa-solid fa-briefcase',
                    arrow = true,
                    disabled = isDisabled,
                    event = 'multijob:client:choiceMenu',
                    args = {jobLabel = job.jobLabel, job = job.job, grade = job.grade},
                }
            end
            lib.registerContext(jobMenu)
            lib.showContext('job_menu')
        end
    end)
end)

RegisterKeyMapping('jobs', 'Multi Job', 'keyboard', 'F10')

AddEventHandler('multijob:client:choiceMenu', function(args)
    local displayChoices = {
        id = 'choice_menu',
        title = '个人工作管理',
        menu = 'job_menu',
        options = {
            {
                title = '切换工作',
                description = '将你的工作切换到: '..args.jobLabel,
                icon = 'fa-solid fa-circle-check',
                event = 'multijob:client:changeJob',
                args = {job = args.job, grade = args.grade}
            },
            {
                title = '删除工作',
                description = '删除选定的工作: '..args.jobLabel,
                icon = 'fa-solid fa-trash-can',
                event = 'multijob:client:deleteJob',
                args = {job = args.job}
            },
        }
    }
    lib.registerContext(displayChoices)
    lib.showContext('choice_menu')
end)

AddEventHandler('multijob:client:changeJob', function(args)
    TriggerServerEvent('multijob:server:changeJob', args.job, args.grade)
    Wait(100)
    ExecuteCommand('jobs')
end)

AddEventHandler('multijob:client:deleteJob', function(args)
    TriggerServerEvent('multijob:server:deleteJob', args.job)
    Wait(100)
    ExecuteCommand('jobs')
end)

AddEventHandler('multijob:client:toggleDuty', function()
    TriggerServerEvent('QBCore:ToggleDuty')
    Wait(500)
    ExecuteCommand('jobs')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    TriggerServerEvent('multijob:server:newJob', JobInfo)
end)
