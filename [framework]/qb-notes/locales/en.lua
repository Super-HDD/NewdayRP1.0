local Translations = {
    error = {
        error_var = 'Example Text',
    },
    success = {
        success_var = 'Example Text',
    },
    primary = {
        primary_var = 'Example Text',
    },
    menu = {
        make_a_note = '写便条',
        message = '内容：',
        written_by = '作者：',
        tear_up_note = '撕掉便条',
    },
    text = {
        enter_message = '在此输入您的留言'
    },
    targetinfo = {
        read_note = '阅读注释',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
