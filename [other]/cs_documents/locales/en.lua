Locales['en'] = {
    ['document_deleted'] = "证件 被 ~g~删除了~w~.",
    ['document_delete_failed'] = "证件 删除 ~r~失败~w~.",
    ['copy_from_player'] = "您 ~g~取得了~w~ 其他玩家的证件复制品.",
    ['from_copied_player'] = "把 ~g~证件复制品~w~ 递给其他玩家",
    ['could_not_copy_form_player'] = "您 ~r~不能~w~ 把证件复制品递给其他玩家.",
    ['document_options'] = "证件 选项",
    ['public_documents'] = "🧍‍♂️ | 临时证件签署",
    ['job_documents'] = "⚖️ | 特殊证件签署",
    ['saved_documents'] = "💾 | 保存的证件",
    ['close_bt'] = "❌ | 关闭",
    ['no_player_found'] = "您附近没有其他玩家",
    ['go_back'] = "🔙 | 退回到上一页",
    ['view_bt'] = "👀 | 预览",
    ['show_bt'] = "出示",
    ['give_copy'] = "递交您的证件复制品",
    ['delete_bt'] = "🗑️ | 删除",
    ['yes_delete'] = "确认删除",
}

Config.Documents['en'] = {
      ["public"] = {
        {
          headerTitle = "证件签署",
          headerSubtitle = "签发人签名栏.",
          elements = {
            { label = "此证件具如下合法权益", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
      },
      ["lbzf"] = {
        {
          headerTitle = "莱莫恩州合法居住证",
          headerSubtitle = "本合法居住证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法居住证证件是对上述公民的法律代表和保障的证明。合法居住证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "新汉诺威州合法居住证",
          headerSubtitle = "本合法居住证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法居住证证件是对上述公民的法律代表和保障的证明。合法居住证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "安巴尼诺州合法居住证",
          headerSubtitle = "本合法居住证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法居住证证件是对上述公民的法律代表和保障的证明。合法居住证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "西伊丽莎白州合法居住证",
          headerSubtitle = "本合法居住证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法居住证证件是对上述公民的法律代表和保障的证明。合法居住证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "新奥斯汀州合法居住证",
          headerSubtitle = "本合法居住证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法居住证证件是对上述公民的法律代表和保障的证明。合法居住证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "移民身份证明文书",
          headerSubtitle = "本护照具有法律宣判的合法权益（非美国本土居民需要登记证明才能登记地方居民）.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此移民身份证明文书证件是对上述公民的法律代表和保障的证明。护照有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "合法行医许可证",
          headerSubtitle = "本护照具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此合法行医许可证证件是对上述公民的法律代表和保障的证明。护照有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府产业搜查令",
          headerSubtitle = "本搜查令具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。搜查令有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府产业封禁与搜查令",
          headerSubtitle = "本搜查令具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。搜查令有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "警用逮捕令",
          headerSubtitle = "本警用逮捕令具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。逮捕令有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "死亡证明",
          headerSubtitle = "本死亡证明具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。限制令有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "婚姻证书",
          headerSubtitle = "本婚姻证书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。婚姻证书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },        
        {
          headerTitle = "离婚证书",
          headerSubtitle = "本离婚证书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。离婚证书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "领养证书",
          headerSubtitle = "本领养证书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。领养证书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府执法人员聘用书",
          headerSubtitle = "本联邦政府执法人员聘用书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。持证人具有合法的执法权限。联邦政府执法人员聘用书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府执法人员解雇书",
          headerSubtitle = "本联邦政府执法人员解雇书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。联邦政府执法人员解雇书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "合法产业业主经营许可证",
          headerSubtitle = "本合法产业业主经营许可证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。合法产业业主经营许可证有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府官员聘用书",
          headerSubtitle = "本联邦政府官员聘用书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。持证人具有合法的政府官员身份。联邦政府官员聘用书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府官员聘用书",
          headerSubtitle = "本联邦政府官员聘用书具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。联邦政府官员聘用书有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "联邦政府产业补助通知单",
          headerSubtitle = "本联邦政府产业补助通知单具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。联邦政府产业补助通知单有效期至上述过期日期.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "合法赏金猎人许可证",
          headerSubtitle = "本合法赏金猎人许可证具有法律宣判的合法权益.",
          elements = {
            { label = "公民名字", type = "input", value = "", can_be_emtpy = false },
            { label = "公民姓式", type = "input", value = "", can_be_emtpy = false },
            { label = "有效期至", type = "input", value = "", can_be_empty = false },
            { label = "详细信息", type = "textarea", value = "此证件是对上述公民的法律代表和保障的证明。持证人具有合法的赏金猎人身份。合法赏金猎人许可证有效期至上述过期日期.", can_be_emtpy = false },
          }
        }



  }
}
