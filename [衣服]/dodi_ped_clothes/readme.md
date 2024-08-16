Tattoo Script for Redem:RP
Description:
The dodi_tattoo is a script that offers over 30 exclusive types of tattoos to customize your character in RedM. It allows you to uniquely combine tattooPart1 and tattooPart2 for a wider variety of customization. The script also features skin types to match the skin color created in the character creator. Once applied, these tattoos are saved directly to the database, allowing you to keep them across multiple gaming sessions. This is a virtually unique and valuable feature in the world of RedM.

Installation:
Download the script file.
Extract the content to the resources folder of your RedM server.
Add the following line to your server.cfg file:

ensure dodi_tattoo

Usage:
Interact with redemrp_menu_base in your game to open the tattoo menu.
Browse through the available tattoo options.
Select the desired tattoo and preview it on your character.
Combine tattooPart1 and tattooPart2 as you like.
Adjust the skin type to match your character's skin color.
To apply the tattoo, press the corresponding key.
The selected tattoos will automatically be saved in the database and will persist across game sessions.

Implementation in Load Skin
To make the script work correctly, you need to add the following code to the skin file of your framework:


-- Here we fetch the texture configurations and overlay of the player in the database
local sql = [[
    SELECT texture_type, overlay_name, overlay_index
    FROM player_overlays
    WHERE identifier = @identifier AND charid = @charid
]]
MySQL.Async.fetchAll(sql, {
    ['@identifier'] = identifier,
    ['@charid'] = charid,
}, function(results)
    -- Iterate through each result
    for i=1, #results do
        local result = results[i]
        -- Here we apply the texture configurations and overlay on the client
        TriggerClientEvent('applyPlayerOverlay', _source, result.texture_type, result.overlay_name, result.overlay_index, true)
    end
end)
If for some reason the tattoos do not load correctly after being applied, use the command /applyTattoo to force the update of the tattoos saved in the database.

Conversion to Other Frameworks
The dodi_tattoo can be converted to other frameworks if you have basic programming knowledge. While the exact conversion may vary depending on the framework, it will generally involve changing the specific function calls of redemrp_menu_base to the corresponding ones in the framework you wish to use.

Support
https://discord.gg/xbjAS2HGdy

Disclaimer
This script is intended for personal use and may not be sold or distributed without permission.
Due to a peculiarity of Redm, some tattoos may exhibit a slight reddish tone on characters with lighter skin. This unexpected feature, which can be considered a flaw, adds a dose of authenticity and uniqueness to the character's appearance. It's important to highlight that this is a limitation of Redm, something that can be seen as a quirk that makes each tattoo distinct and special.


《Redem:RP》纹身脚本

描述：
dodi_tattoo 是一个脚本，为 RedM 中的角色提供了30多种独特的纹身选项，以自定义你的角色外观。它允许你独特地组合纹身的第一部分 (tattooPart1) 和第二部分 (tattooPart2)，以实现更广泛的自定义。此脚本还包括肤色类型，以匹配角色创建器中创建的肤色。一旦应用，这些纹身将直接保存到数据库中，允许你在多个游戏会话中保留它们。在 RedM 的世界中，这是一项几乎独一无二且有价值的功能。

安装：
1. 下载脚本文件。
2. 将内容解压缩到 RedM 服务器的资源文件夹中。
3. 在你的 server.cfg 文件中添加以下行：

   ensure dodi_tattoo

使用方法：
1. 在游戏中与 redemrp_menu_base 进行交互，以打开纹身菜单。
2. 浏览可用的纹身选项。
3. 选择所需的纹身并在你的角色上进行预览。
4. 根据你的喜好组合 tattooPart1 和 tattooPart2。
5. 调整肤色类型以匹配你的角色肤色。
6. 要应用纹身，请按相应的按键。
7. 选定的纹身将自动保存在数据库中，并将在游戏会话之间持久存在。

在“Load Skin”中的实现：
为了使脚本能够正确工作，你需要在你的框架的 skin 文件中添加以下代码：

-- 在这里，我们从数据库中获取玩家的纹理配置和覆盖
local sql = [[
    SELECT texture_type, overlay_name, overlay_index
    FROM player_overlays
    WHERE identifier = @identifier AND charid = @charid
]]
MySQL.Async.fetchAll(sql, {
    ['@identifier'] = identifier,
    ['@charid'] = charid,
}, function(results)
    -- 遍历每个结果
    for i=1, #results do
        local result = results[i]
        -- 在客户端上应用纹理配置和覆盖
        TriggerClientEvent('applyPlayerOverlay', _source, result.texture_type, result.overlay_name, result.overlay_index, true)
    end
end)

如果由于某种原因，应用纹身后它们未能正确加载，请使用命令 /applyTattoo 强制更新保存在数据库中的纹身。

转换到其他框架：
dodi_tattoo 可以根据你的基本编程知识转换到其他框架。虽然具体的转换可能因框架而异，但通常涉及将 redemrp_menu_base 中的特定函数调用更改为你希望使用的框架中相应的函数调用。

支持：
https://discord.gg/xbjAS2HGdy

免责声明：
此脚本仅供个人使用，未经许可不得出售或分发。
由于 Redm 的特殊性，某些纹身可能会在肤色较浅的角色身上呈现出轻微的红色调。这种意外特性，可以被视为一个缺陷，为角色的外观增添了独特性和特殊性。重要的是要强调，这是 Redm 的一个限制，它使每个纹身都具有独特和特殊的特点。