local QBCore = exports['qb-core']:GetCoreObject()

local function GetJobCount(cid)
    local result = MySQL.query.await('SELECT COUNT(*) as jobCount FROM save_jobs WHERE cid = ?', {cid})
    local jobCount = result[1].jobCount
    return jobCount
end

lib.callback.register('multijob:server:myJobs', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local storeJobs = {}
    local result = MySQL.query.await('SELECT * FROM save_jobs WHERE cid = ?', {Player.PlayerData.citizenid})
    for k, v in pairs(result) do
        local job = QBCore.Shared.Jobs[v.job]
        if job then
            local grade = job.grades[tostring(v.grade)]
            storeJobs[#storeJobs + 1] = {
                job = v.job,
                salary = grade.payment,
                jobLabel = job.label,
                gradeLabel = grade.name,
                grade = v.grade,
            }
        end
    end
    return storeJobs
end)

RegisterNetEvent('multijob:server:changeJob', function(job, grade)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == job then QBCore.Functions.Notify(src, '您当前的工作已经设置为这个.', 'error') return end

    local jobInfo = QBCore.Shared.Jobs[job]
    if not jobInfo then QBCore.Functions.Notify(src, '无效工作.', 'error') return end

    Player.Functions.SetJob(job, grade)
    Player.Functions.SetJobDuty(false)
    TriggerClientEvent('QBCore:Client:SetDuty', src, false)
    QBCore.Functions.Notify(src, '你的工作现在是: ' .. jobInfo.label)
end)

RegisterNetEvent('multijob:server:newJob', function(newJob)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasJob = false
    local cid = Player.PlayerData.citizenid
    if newJob.name == 'unemployed' then return end
    local result = MySQL.query.await('SELECT * FROM save_jobs WHERE cid = ? AND job = ?', {cid, newJob.name}) 
    if result[1] then
        MySQL.query.await('UPDATE save_jobs SET grade = ? WHERE job = ? and cid = ?', {newJob.grade.level, newJob.name, cid})
        hasJob = true
        return
    end
    if not hasJob and GetJobCount(cid) < Config.MaxJobs then 
	MySQL.insert.await('INSERT INTO save_jobs (cid, job, grade) VALUE (?, ?, ?)', {cid, newJob.name, newJob.grade.level})
    else
        return QBCore.Functions.Notify(src, '您拥有的职位数量已达到上限.', 'error')
    end
end)

RegisterNetEvent('multijob:server:deleteJob', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.query.await('DELETE FROM `save_jobs` WHERE `cid` = ? and `job` = ?', {Player.PlayerData.citizenid, job})
    QBCore.Functions.Notify(src, '你已把 '..QBCore.Shared.Jobs[job].label..' 工作 从菜单中删除.')
    Player.Functions.SetJob('unemployed', 0)
end)

RegisterNetEvent('qb-bossmenu:server:FireEmployee', function(target) -- Removes job when fired from qb-bossmenu.
    local Employee = QBCore.Functions.GetPlayerByCitizenId(target)
    if Employee then
	local oldJob = Employee.PlayerData.job.name
        MySQL.query.await('DELETE FROM save_jobs WHERE cid = ? AND job = ?', {Employee.PlayerData.citizenid, oldJob})
    end
end)
