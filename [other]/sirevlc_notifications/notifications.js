
exports('ShowAdvancedNotification', (title, subTitle, dict, icon, duration) => {
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true);
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);
    const string1 = CreateVarString(10, "LITERAL_STRING", title);
    const string2 = CreateVarString(10, "LITERAL_STRING", subTitle);
    const struct2 = new DataView(new ArrayBuffer(56));
    struct2.setBigInt64(8, BigInt(string1), true);
    struct2.setBigInt64(16, BigInt(string2), true);
    struct2.setBigInt64(32, BigInt(GetHashKey(dict)), true);
    struct2.setBigInt64(40, BigInt(GetHashKey(icon)), true);
    struct2.setBigInt64(48, BigInt(GetHashKey("COLOR_WHITE")), true);
    Citizen.invokeNative("0x26E87218390E6729", struct1, struct2, 1, 1);
});


exports('ShowLocationNotification', (text, location, duration) => {
    const string = CreateVarString(10, "LITERAL_STRING", location);
    const string2 = CreateVarString(10, "LITERAL_STRING", text);

    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true);
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);

    const struct2 = new DataView(new ArrayBuffer(24));
    struct2.setBigInt64(8, BigInt(string), true);
    struct2.setBigInt64(16, BigInt(string2), true);
    Citizen.invokeNative("0xD05590C1AB38F068", struct1, struct2, 1, 1);
});


exports('ShowTooltip', (text, duration) => {
    const str = CreateVarString(10, "LITERAL_STRING", text);
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setUint32(0, duration, true);
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(16));
    struct2.setBigUint64(8, BigInt(str), true);
    Citizen.invokeNative("0x049D5C615BD38BAD", struct1, struct2, 1);
});


exports('ShowSimpleRightText', (text, duration) => {
    const string = CreateVarString(10, "LITERAL_STRING", text);
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true); // duration
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(16));
    struct2.setBigInt64(8, BigInt(string), true);
    Citizen.invokeNative("0xB2920B9760F0F36B", struct1, struct2, 1);
});


exports('ShowObjective', (text, duration) => {
    Citizen.invokeNative("0xDD1232B332CBB9E7", 3, 1, 0); // UI_FEED_CLEAR_CHANNEL
    const string = CreateVarString(10, "LITERAL_STRING", text);
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true); // duration 
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(16));
    struct2.setBigInt64(8, BigInt(string), true);
    Citizen.invokeNative("0xCEDBF17EFCC0E4A4", struct1, struct2, 1);
});

 

exports('ShowTopNotification', (title, subtext, duration) => {
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true); // duration
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
    // struct1.setBigInt64(16, BigInt(sound), true);
    const string = CreateVarString(10, "LITERAL_STRING", title);
    const string2 = CreateVarString(10, "LITERAL_STRING", subtext);
    const struct2 = new DataView(new ArrayBuffer(48));
    struct2.setBigInt64(8, BigInt(string), true);
    struct2.setBigInt64(16, BigInt(string2), true);
    Citizen.invokeNative("0xA6F4216AB10EB08E", struct1, struct2, 1, 1);
});


exports('ShowAdvancedRightNotification', (text, dict, icon, text_color, duration) => {
    const _text = CreateVarString(10, "LITERAL_STRING", text);
    const _dict = CreateVarString(10, "LITERAL_STRING", dict);
    const sdict = CreateVarString(10, "LITERAL_STRING", "Transaction_Feed_Sounds");
    const sound = CreateVarString(10, "LITERAL_STRING", "Transaction_Positive");
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true);
    struct1.setBigInt64(8, BigInt(sdict), true);
    struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(76));
    struct2.setBigInt64(8, BigInt(_text), true);
    struct2.setBigInt64(16, BigInt(_dict), true);
    struct2.setBigInt64(24, BigInt(GetHashKey(icon)), true);
    struct2.setBigInt64(40, BigInt(GetHashKey(text_color)), true);
    struct2.setInt32(48, 0, true);  
    Citizen.invokeNative("0xB249EBCB30DD88E0", struct1, struct2, 1);
});


exports('ShowBasicTopNotification', (text, duration) => {
    const string = CreateVarString(10, "LITERAL_STRING", text);
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true); // 设置持续时间
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // 设置通知声音（可选）
    // struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(48));
    struct2.setBigInt64(8, BigInt(string), true);
    Citizen.invokeNative("0x860DDFE97CC94DF0", struct1, struct2, 1);
});


exports('ShowSimpleCenterText', (text, duration) => {
    const string = CreateVarString(10, "LITERAL_STRING", text);
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true); // 持续时间
    // struct1.setBigInt64(8, BigInt(sound_dict), true); // 通知声音（可选）
    // struct1.setBigInt64(16, BigInt(sound), true);
    const struct2 = new DataView(new ArrayBuffer(24));
    struct2.setBigInt64(8, BigInt(string), true);
    struct2.setBigInt64(16, BigInt(GetHashKey("COLOR_PURE_WHITE")), true);
    Citizen.invokeNative("0x893128CDB4B81FBB", struct1, struct2, 1);
});











//这使得第三方框架可以发送通知