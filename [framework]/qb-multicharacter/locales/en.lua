Translations = Translations or {
    notifications = {
        ["char_deleted"] = "角色已删除！",
         ["deleted_other_char"] = "您已成功删除公民 ID 为 %{citizenid} 的角色。",
         ["forgot_citizenid"] = "您忘记输入公民 ID！",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "删除另一个玩家角色",
         ["citizenid"] = "公民 ID",
         ["citizenid_help"] = "您要删除的角色的公民 ID",

          --  /登出
         ["logout_description"] = "注销角色（仅限管理员）",

         -- /closeNUI
         ["closeNUI_description"] = "关闭多 NUI"
    },

    misc = {
        ["droppedplayer"] = "您已与NEWDAYRP断开连接"
    },

    ui = {
        -- Main
        character_header = "请选择您要扮演的角色",
         emptyslot = "空槽",
         play_button = "扮演该角色",
         create_button = "创建角色",
         delete_button = "删除角色",

        -- Character Information
            -- 角色信息
    charinfo_header = "角色信息",
    charinfo_description = "选择一个角色槽位查看角色信息。",
    name = "姓名",
    male = "男性",
    female = "女性",
    firstname = "名字",
    lastname = "姓氏",
    nationality = "国籍",
    gender = "性别",
    birthdate = "出生日期",
    job = "职业",
    jobgrade = "职业等级",
    cash = "现金",
    bank = "银行",
    phonenumber = "电话号码",
    accountnumber = "账号编号",


        

            -- 删除角色
    deletechar_header = "删除角色",
    deletechar_description = "你确定要删除你的角色吗？",

    -- 按钮
    cancel = "取消",
    confirm = "确认",

    -- 加载文本
    retrieving_playerdata = "正在获取玩家数据",
    validating_playerdata = "正在验证玩家数据",
    retrieving_characters = "正在获取角色数据",
    validating_characters = "正在验证角色数据",

    -- 通知
    ran_into_issue = "出现问题",
    profanity = "你似乎在姓名或国籍中尝试使用了一些不当词语或脏话！",
    forgotten_field = "你似乎忘记输入一个或多个字段！"

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
