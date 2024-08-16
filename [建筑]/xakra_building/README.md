# xakra_building
# Requirements
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [oxmysql](https://github.com/overextended/oxmysql)
- [lockpick](https://github.com/XakraD/lockpick)
- Adaptable to any framework

# Description
- This script is compatible with VORP and REDEM.
- With this script players will be able to use items and build, you can assign any object to an item.
- Constructions synchronized with all players, saved in the database, therefore they will be maintained after restarting the server.
- The building system will allow you to add an object in any position and rotation, you can also move and delete the already created buildings.
- If the health system is active, players will be able to damage the buildings, they will see health when they are near the building, when the building is completely damaged it will be permanently removed.
- Players will be able to share or remove door and chest permissions with other players and jobs.
- [Only VORP] Chest system that will not allow 2 players to open the same chest at the same time.
- The door system is synchronized and will keep the status of open or closed while the server is active, it will be important for players to close the doors.
- Admins (assigned to 'admin' group for vorp or 'superadmin' group for redeem) they will have unrestricted permissions.
- All objects that are built will generate a radius that will eliminate all vegetation.
  
# You can configure:
- The language (Spanish and English by default)
- The framework (vorp or redem)
- Webhook link
- All keys
- The command to enter and exit the delete and move mode
- The commands to share and delete permissions from doors and chests. (Only the owner of the object can do it)
- Building movement speeds
- Zones that cannot be built
- Enable or disable and color of smoke when building, removing and destroying buildings
- Enable or disable vegetation removal and radius
- The list of objects to be used as a door and disable that it can be opened with lockpick, it is recommended touse door objects
- Chest inventory options (Blacklist, max items and disable weapons)
- Enable or disable and required jobs to lock pick and alert police command of chests and doors
- The list of items that will work as chests and the capacity of each chest and disable that it can be opened with lockpick
- Health system options (Enable or disable, radio to see the amount of health and the background color)
- Zones to disable the health system
- Spawn and remove distance from buildings
- Buildings list (Item, object and health)

## Instructions to incorporate script
- Copy the script into a folder (to choose) from the 'resources' folder.
- Add 'ensure xakra_building' in the 'resources.cfg' document.
- Execute the queries in the database of the 'sql/table.sql' file to create the table needed for the script to work (only run the section of your framework), the queries to execute are separated by the framework.
- Change the framework in the fxmanifest file (important if you use REDEM).
- Check the config.lua file and configure to adapt the script, change the language, change the framework, the list of items and objects, enable or disable options, the prompt keys, etc...

Video: https://www.youtube.com/watch?v=bqR2WEYB7cc





# xakra_building
# 要求
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [oxmysql](https://github.com/overextended/oxmysql)
- [lockpick](https://github.com/XakraD/lockpick)
- 适用于任何框架

# 描述
- 此脚本与 VORP 和 REDEM 兼容。
- 使用此脚本，玩家可以使用物品并建造，您可以将任何对象分配给物品。
- 建筑物与所有玩家同步，保存在数据库中，因此它们将在服务器重新启动后保持不变。
- 建筑系统允许您在任何位置和旋转中添加对象，您还可以移动和删除已创建的建筑物。
- 如果启用了健康系统，玩家将能够损坏建筑物，当他们靠近建筑物时，他们将看到健康值，当建筑物完全损坏时，它将被永久删除。
- 玩家将能够与其他玩家和工作岗位分享或删除门和箱子的权限。
- [仅适用于 VORP] 箱子系统将不允许2名玩家同时打开同一个箱子。
- 门系统同步，将在服务器处于活动状态时保持打开或关闭的状态，对于玩家来说关闭门将很重要。
- 管理员（分配给 'admin' 组的 vorp 或 'superadmin' 组的 redeem）将拥有无限制的权限。
- 所有建造的对象都将生成一个消除所有植被的半径。

# 您可以配置：
- 语言（默认为西班牙语和英语）
- 框架（vorp 或 redem）
- Webhook 链接
- 所有按键
- 进入和退出删除和移动模式的命令
- 用于分享和删除门和箱子权限的命令（仅对象所有者可以执行）
- 建筑移动速度
- 不能建造的区域
- 启用或禁用以及建造、删除和摧毁建筑物时的烟雾颜色
- 启用或禁用植被移除和半径
- 用作门的对象列表，并禁用使用撬锁打开的选项，建议使用门对象
- 箱子库存选项（黑名单、最大物品数和禁用武器）
- 启用或禁用以及锁拆和通知警察的命令的所需工作的箱子和门
- 将作为箱子的物品列表以及每个箱子的容量，并禁用使用撬锁打开的选项
- 健康系统选项（启用或禁用、查看健康量的半径和背景颜色）
- 禁用健康系统的区域
- 建筑物的生成和删除距离
- 建筑物列表（物品、对象和健康）

