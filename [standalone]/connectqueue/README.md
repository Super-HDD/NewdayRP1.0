# ConnectQueue
---
ConnectQueue 是一个易于使用的 FiveM 服务器队列系统，具有以下特点：
- 简单的 API
- 优先级系统
- 配置
    - 仅限白名单
    - 要求 Steam
    - 语言选项

**请将任何错误报告到发布主题[此处](https://forum.fivem.net/t/alpha-connectqueue-a-server-queue-system-fxs/22228)或通过[GitHub](https://github.com/Nick78111/ConnectQueue/issues)提交。**

## 安装方法
---
- 将文件夹放入资源文件夹中。
- 在 server.cfg 文件中添加 `start connectqueue`。- *最好将其放在顶部*
- 根据您的喜好设置 convars。
- 打开 `connectqueue/server/sv_queue_config.lua` 并进行适当的编辑。
- 重命名资源可能会导致问题。

## ConVars
---
	set sv_debugqueue true # 将调试消息打印到控制台
	set sv_displayqueue true # 在服务器名称中显示队列计数 '[count] server name'

## 如何使用 / 示例
---
要使用 API，请在要使用的 `__resource.lua` 文件的顶部添加 `server_script "@connectqueue/connectqueue.lua"`。
我还建议在其中添加 `dependency "connectqueue"`。
现在，您可以在该资源的任何位置使用下面的任何一个函数。

### OnReady
当队列函数准备就绪时调用该函数。
```Lua
    Queue.OnReady(function() 
        print("HI")
    end)
```
下面的所有函数都必须在队列准备就绪后调用。

### OnJoin
当玩家尝试加入服务器时调用该函数。
调用 `allow` ，如果没有参数，则会允许他们通过。
调用 `allow` ，如果有字符串，则会以给定的消息阻止他们加入。
必须调用 `allow`，否则玩家将连接时卡住...
```Lua
Queue.OnJoin(function(source, allow)
    allow("No, you can't join")
end)
```

## AddPriority
调用此函数将标识符添加到优先级列表中。
整数表示他们在优先级较低的用户之上的权力。
此函数可以接受 id 的 table 或单独的 id。
```Lua
-- individual
Queue.AddPriority("STEAM_0:1:33459672", 100)
Queue.AddPriority("steam:110000103fd1bb1", 10)
Queue.AddPriority("ip:127.0.0.1", 25)

-- table
local prioritize = {
    ["STEAM_0:1:33459672"] = 100,
    ["steam:110000103fd1bb1"] = 10,
    ["ip:127.0.0.1"] = 25,
}
Queue.AddPriority(prioritize)
```

## RemovePriority
从用户中移除优先级。
```Lua
Queue.RemovePriority("STEAM_0:1:33459672")
```

## IsReady
将返回队列的出口是否可以调用。
```Lua
print(Queue.IsReady())
```
## 其他队列函数
您可以在 sh_queue.lua 中调用每个队列函数。
```Lua
local ids = Queue.Exports:GetIds(src)

-- 将玩家设置为排队的第一位
Queue.Exports:SetPos(ids, 1)
-- 返回玩家是否具有任何优先级
Queue.Exports:IsPriority(ids)
-- 返回队列的大小
Queue.Exports:GetSize()
-- 等等...
```