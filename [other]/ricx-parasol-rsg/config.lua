Config = {}

--payung
Config.Prompts = {
    Title = "Parasol",
    StopPrompt = 0x5966D52A,
    StopName = "收回遮阳伞",
}

Config.Parasol = {
    model = GetHashKey("p_parasol02x"),
    anim = {"amb_rest_sit@prop_human_seat_bench@parasol@female_a@wip_base", "wip_base"},
    male = {
        Attach = {0.07, -0.01, -0.03, -90.0, 0.0, 0.0},
        BoneIndex = 337,
    },
    female = {
        Attach = {0.07, -0.03, -0.03, -90.0, 0.0, 0.0},
        BoneIndex = 396,
    },
}


Config.Messages = {
    Title = "Parasol",
    NoParasol = "您现在可以撑伞了!",
}