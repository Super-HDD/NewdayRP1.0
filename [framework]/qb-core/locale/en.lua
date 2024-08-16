local Translations = {
    error = {
        not_online = '玩家不在线',
         error_format = '格式不正确',
         missing_args = '并非所有参数都已输入 (x, y, z)',
         missing_args2 = '所有参数都必须填写！',
         no_access = '无权访问此命令',
         company_too_poor = '你的雇主破产了',
         item_not_exist = '项目不存在',
         Too_heavy = '库存太满',
         location_not_exist = '位置不存在',
         licate_license = '发现重复的 Rockstar 许可证',
         no_valid_license = '未找到有效的 Rockstar 许可证',
         not_whitelisted = '您没有被列入该服务器的白名单',
         server_already_open = '服务器已经打开',
         server_already_close = '服务器已经关闭',
         no_permission = '您没有此权限..',
         no_waypoint = '未设置航点。',
         tp_error = '传送时出错。',
    },
    success = {
        server_opened = '服务器已打开',
        server_close = '服务器已关闭',
        teleported_waypoint = '传送到航点。',
    },
    info = {
        received_paycheck = '您收到了 $%{value} 的薪水',
         job_info = '工作：%{value} | 成绩：%{value2} | 职责：%{value3}',
         gang_info = '帮派：%{value} | 成绩：%{value2}',
         on_duty = '你现在值班了！',
         off_duty = '你现在下班了！',
         check_ban = '你好%s。 我们正在检查您是否被禁止。',
         join_server = '欢迎 %s 来到 {服务器名称}。',
         check_whitelisted = '你好%s。 我们正在检查您的津贴。',
         exploit_banned = '您因作弊而被禁止。 查看我们的 Discord 了解更多信息：%{discord}',
         explore_dropped = '你因剥削而被踢',
    },
    command = {
        tp = {
            help = 'TP To Player or Coords (Admin Only)',
            params = {
                x = { name = 'id/x', help = 'ID of player or X position'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'TP To Marker (Admin Only)' },
        noclip = { help = 'No Clip (Admin Only)' },
        addpermission = {
            help = 'Give Player Permissions (God Only)',
            params = {
                id = { name = 'id', help = 'ID of player' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        removepermission = {
            help = 'Remove Player Permissions (God Only)',
            params = {
                id = { name = 'id', help = 'ID of player' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        openserver = { help = 'Open the server for everyone (Admin Only)' },
        closeserver = {
            help = 'Close the server for people without permissions (Admin Only)',
            params = {
                reason = { name = 'reason', help = 'Reason for closing (optional)' },
            },
        },
        car = {
            help = 'Spawn Vehicle (Admin Only)',
            params = {
                model = { name = 'model', help = 'Model name of the vehicle' },
            },
        },
        dv = { help = 'Delete Vehicle (Admin Only)' },
        spawnwagon = { help = 'Spawn a Wagon (Admin Only)' },
        spawnhorse = { help = 'Spawn a Horse (Admin Only)' },
        givemoney = {
            help = 'Give A Player Money (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, bloodmoney)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        setmoney = {
            help = 'Set Players Money Amount (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, bloodmoney)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        job = { help = 'Check Your Job' },
        setjob = {
            help = 'Set A Players Job (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                job = { name = 'job', help = 'Job name' },
                grade = { name = 'grade', help = 'Job grade' },
            },
        },
        gang = { help = 'Check Your Gang' },
        setgang = {
            help = 'Set A Players Gang (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                gang = { name = 'gang', help = 'Gang name' },
                grade = { name = 'grade', help = 'Gang grade' },
            },
        },
        ooc = { help = 'OOC Chat Message' },
        me = {
            help = 'Show local message',
            params = {
                message = { name = 'message', help = 'Message to send' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
