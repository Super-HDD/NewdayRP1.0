QBShared = QBShared or {}

QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved

QBShared.Jobs = {
    ['unemployed'] = {
        label = '镇民',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '无业游民',
                payment = 0
            },
        },
    },
    ['horsetrainer'] = {
        label = '驯马师',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒级驯马师',
                payment = 0
            },
            ['1'] = {
                name = '大师级驯马师',
                isboss = true,
                payment = 0
            },
        },
    },
    ['farmer'] = {
        label = '农夫',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '农场打杂工',
                payment = 0
            },
            ['1'] = {
                name = '农场主',
                isboss = true,
                payment = 0
            },
        },
    },
    ['valweaponsmith'] = { --valentine
        label = '瓦伦丁武器铺',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒级枪匠',
                payment = 0
            },
            ['1'] = {
                name = '大师级枪匠',
                isboss = true,
                payment = 0
            },
        },
    },
    ['rhoweaponsmith'] = { -- rhodes
        label = '罗德镇武器铺',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒级枪匠',
                payment = 0
            },
            ['1'] = {
                name = '大师级枪匠',
                isboss = true,
                payment = 0
            },
        },
    },
    ['blaweaponsmith'] = {
        label = '黑水镇武器铺',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒级枪匠',
                payment = 0
            },
            ['1'] = {
                name = '大师级枪匠',
                isboss = true,
                payment = 0
            },
        },
    },
    ['stdenisweaponsmith'] = { -- stdenis
        label = '圣丹尼斯武器铺',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒级枪匠',
                payment = 0
            },
            ['1'] = {
                name = '大师级枪匠',
                isboss = true,
                payment = 0
            },
        },
    },
    ['valsaloontender'] = { --valentine
        label = '瓦伦丁酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['blasaloontender'] = { --blackwater
        label = '黑水镇酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['rhosaloontender'] = { --rhodes
        label = '罗德镇酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['stdenissaloontender1'] = { --saint denis 1
        label = '圣丹尼斯酒馆 1',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['stdenissaloontender2'] = { --saint denis 2
        label = '圣丹尼斯酒馆 2',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['vansaloontender'] = { --van horn
        label = '范霍恩港酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['armsaloontender'] = { --armadillo
        label = '犰狳镇酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['tumsaloontender'] = { --tumbleweed
        label = '风滚草镇酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['moonsaloontender1'] = { --lemoyne speakeasy
        label = '莱莫恩地下酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒馆',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['moonsaloontender2'] = { --new austin speakeasy
        label = '新奥斯汀地下酒吧',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['moonsaloontender3'] = { --cattail pond speakeasy
        label = '香蒲池地下酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒馆',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['moonsaloontender4'] = { --hanover speakeasy
        label = '汉诺威地下酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['moonsaloontender5'] = { --manzanita post speakeasy
        label = '曼萨尼塔邮政地下酒馆',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '酒保',
                payment = 0
            },
            ['2'] = {
                name = '经理',
                isboss = true,
                payment = 0
            },
        },
    },
    ['wholesale1'] = {
        label = '梨刀村杂货商人营地',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '员工',
                payment = 0
            },
            ['2'] = {
                name = '会长',
                isboss = true,
                payment = 0
            },
        },
    },
    ['wholesale2'] = {
        label = '歧路酒吧杂货商人营地',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '员工',
                payment = 0
            },
            ['2'] = {
                name = '会长',
                isboss = true,
                payment = 0
            },
        },
    },
    ['wholesale3'] = {
        label = '范霍恩港杂货商人营地',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '学徒',
                payment = 0
            },
            ['1'] = {
                name = '员工',
                payment = 0
            },
            ['2'] = {
                name = '会长',
                isboss = true,
                payment = 0
            },
        },
    },
    ['railroad'] = {
        label = '瓦伦丁铁路城运有限公司',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '售票员',
                payment = 0
            },
            ['1'] = {
                name = '铁路司机',
                payment = 0
            },
            ['2'] = {
                name = '站长',
                isboss = true,
                payment = 0
            },
        },
    },

    ['reporter'] = {
        label = '报社',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '小记者',
                payment = 0
            },
            ['1'] = {
                name = '新闻编辑',
                payment = 0
            },
            ['2'] = {
                name = '社长',
                isboss = true,
                payment = 0
            },
        },
    },

    ['sj'] = {
        label = '赏金猎人协会',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '雇佣枪手',
                payment = 0
            },
            ['1'] = {
                name = '赏金猎人协会会长',
                isboss = true,
                payment = 0
            },
        },
    },

    ['police'] = {
        label = '法警/治安官',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '警务学员',
                payment = 0
            },
            ['1'] = {
                name = '黑水镇警察局-警员',
                payment = 0
            },
            ['2'] = {
                name = '黑水镇警察局-警长',
                payment = 0
            },
            ['3'] = {
                name = '圣丹尼斯警察局-警员',
                payment = 0
            },
            ['4'] = {
                name = '圣丹尼斯警察局-警长',
                payment = 0
            },
            ['5'] = {
                name = '罗德镇治安官办公室-警员',
                payment = 0
            },
            ['6'] = {
                name = '罗德镇治安官办公室-警长',
                payment = 0
            },
            ['7'] = {
                name = '瓦伦丁治安官办公室-警员',
                payment = 0
            },
            ['8'] = {
                name = '瓦伦丁治安官办公室-警长',
                payment = 0
            },
            ['9'] = {
                name = '莱莫恩州法警',
                payment = 0
            },
            ['10'] = {
                name = '新汉诺威州法警',
                payment = 0
            },
            ['11'] = {
                name = '安巴尼诺州法警',
                payment = 0
            },
            ['12'] = {
                name = '西伊丽莎白州法警',
                payment = 0
            },
            ['13'] = {
                name = '新奥斯汀州法警',
                payment = 0
            },
            ['13'] = {
                name = '边境和美洲原住民事务部直属警队',
                payment = 0
            },
            ['14'] = {
                name = '联邦政府总警长',
                isboss = true,
                payment = 0
            },
        },
    },
    ['medic'] = {
        label = '医疗和卫生部门',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '罗德镇医馆-医师',
                payment = 0
            },
            ['1'] = {
                name = '罗德镇医馆-老板',
                payment = 0
            },
            ['2'] = {
                name = '草莓镇医馆-医师',
                payment = 0
            },
            ['3'] = {
                name = '草莓镇医馆-老板',
                payment = 0
            },
            ['4'] = {
                name = '瓦伦丁医馆-医师',
                payment = 0
            },
            ['5'] = {
                name = '瓦伦丁医馆-老板',
                payment = 0
            },
            ['6'] = {
                name = '黑水镇城镇医院-医师',
                payment = 0
            },
            ['7'] = {
                name = '黑水镇城镇医院-老板',
                payment = 0
            },
            ['8'] = {
                name = '圣丹尼斯城市医院-医师',
                payment = 0
            },
            ['9'] = {
                name = '圣丹尼斯城市医院-老板',
                payment = 0
            },
            ['10'] = {
                name = '医师协会会长',
                isboss = true,
                payment = 0
            },
        },
    },

    ['realestate'] = {
        label = '房地产公司',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '见习销售员',
                payment = 0
            },
            ['1'] = {
                name = '房产销售员',
                payment = 0
            },
            ['2'] = {
                name = '商贸销售员',
                payment = 0
            },
            ['3'] = {
                name = '商务经纪人',
                payment = 0
            },
            ['4'] = {
                name = '房地产主管',
                isboss = true,
                payment = 0
            },
        },
    },
    
    ['aidingge'] = {
        label = '圣丹尼斯艾丁格酒厂',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '艾丁格酒厂员工',
                payment = 0
            },
            ['1'] = {
                name = '艾丁格酒厂主管',
                payment = 0
            },
            ['2'] = {
                name = '艾丁格酒厂经理',
                payment = 0
            },
            ['3'] = {
                name = '艾丁格酒厂老板',
                isboss = true,
                payment = 0
            },
        },
    },

    ['hsyancao'] = {
        label = '黑水镇烟草公司',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '黑水镇烟草公司员工',
                payment = 0
            },
            ['1'] = {
                name = '黑水镇烟草公司主管',
                payment = 0
            },
            ['2'] = {
                name = '黑水镇烟草公司经理',
                payment = 0
            },
            ['3'] = {
                name = '黑水镇烟草公司老板',
                isboss = true,
                payment = 0
            },
        },
    },



    ['lbzf'] = {
        label = '合众国联邦政府',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '政务邮递专员-邮递员',
                payment = 0
            },
            ['1'] = {
                name = '地方城镇代表-镇长',
                payment = 0
            },
            ['2'] = {
                name = '地方政府代表-州长',
                payment = 0
            },
            ['3'] = {
                name = '教育和劳改部门-教育部长',
                payment = 0
            },
            ['4'] = {
                name = '征税和经济部门-税务部长',
                payment = 0
            },
            ['5'] = {
                name = '法官和法庭部门-律法部长',
                payment = 0
            },  
            ['6'] = {
                name = '矿产和矿物部门-矿业部长',
                payment = 0
            },
            ['7'] = {
                name = '畜牧和农场部门-农业部长',
                payment = 0
            },
            ['8'] = {
                name = '医疗和卫生部门-卫生部长',
                payment = 0
            },
            ['9'] = {
                name = '执法和安全部门-警务部长',
                payment = 0
            },
            ['10'] = {
                name = '边境和美洲原住民事务部门-政府特殊关系事务代理',
                payment = 0
            },
            ['11'] = {
                name = '合众国联邦政府首脑',
                isboss = true,
                payment = 0
            },
        },
    },

    ['cinema'] = {
        label = '海妮耶斯电影院/面团歌剧院',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '电影放映员/歌剧厅职员',
                payment = 0
            },
            ['1'] = {
                name = '电影院负责人/歌剧厅老板',
                isboss = true,
                payment = 0
            },
        },
    },

    ['miner'] = {
        label = '矿工',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = '工人',
                payment = 0
            },
            ['1'] = {
                name = '老板',
                isboss = true,
                payment = 0
            },
        },
    },
}
