Config = {}

--[[ Command ]]--
Config.Command = "mdt"

Config.Jobs = {"ranger","marshal","sheriff","police"}

--[[ Offices ]]--
Config.UseOffice = true
Config.Open = { 
	['key'] = 0xCEFD9220, -- E
	['text'] = "~e~[E] ~q~来打开公民信息登记簿",
	} 
Config.Office = {
    [1] = {
        prompt='valmdt',
        coords=vector3(-276.82, 801.34, 119.38), -- Valentine
    },
    -- [2] = {
    --     prompt='blamdt',
    --     coords={-762.25, -1266.68, 44.15}, -- Blackwater
    -- },
    -- [3] = {
    --     prompt='strmdt',
    --     coords={-1807.25, -348.27, 164.71}, -- Strawberry Jail Desk
    -- },
    -- [4] = {
    --     prompt='rhomdt',
    --     coords={1362.43, -1300.95, 77.81}, -- Rhodes by Bed
    -- },
    -- [5] = {
    --     prompt='sdmdt',
    --     coords={2510.12, -1308.78, 49.05}, -- Saint Denis Middle Desk
    -- },
    -- [6] = {
    --     prompt='annmdt',
    --     coords={2907.39, 1313.98, 45.04}, -- Annesburg
    -- },
    -- [7] = {
    --     prompt='armmdt',
    --     coords={-3624.39, -2601.61, -13.24}, -- Armadillo
    -- },
    -- [8] = {
    --     prompt='tummdt',
    --     coords={-5530.79, -2930.5, -1.31}, -- Tumbleweed
    -- },
}

--[[ 通知 ]]--
Config.Notify = {
    ['1'] = "违法者信息已保存。",
    ['2'] = "报告信息已保存。",
    ['3'] = "报告已成功删除。",
    ['4'] = "成功提交新报告。",
    ['5'] = "创建了新的搜查令。",
    ['6'] = "搜查令已成功删除。",
    ['7'] = "找不到此报告。",
    ['8'] = "已保存电报。",
    ['9'] = "已删除电报。",
    }


    