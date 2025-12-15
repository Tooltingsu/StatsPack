# 📊 StatsPack - 全能服务器统计数据包 (Minecraft 1.21+)

**StatsPack** 是一个轻量级、高性能的 Minecraft 原版数据包，旨在为生存服务器提供实时、精准的玩家数据统计排行榜。

它采用了 **原版直显模式 (Direct Display)**，在保证 0 延迟刷新的同时，完美实现了离线玩家数据保留、假人自动过滤以及全服数据总览。

![Version](https://img.shields.io/badge/Minecraft-1.21%2B-brightgreen)
![Type](https://img.shields.io/badge/Type-Datapack-blue)
![Performance](https://img.shields.io/badge/Performance-High-orange)

## ✨ 主要功能

*   **9 大统计榜单**：挖掘、放置、移动距离(米)、击杀、PVP、承伤、输出、死亡、全服总览。
*   **实时刷新**：采用 1-tick (0.05秒) 级刷新率，数据跳动丝滑流畅。
*   **离线保留**：基于原版计分板机制，玩家离线后名字和数据依然保留在榜单上（Top 15）。
*   **智能轮播**：每 10 秒自动切换榜单，支持管理员手动暂停/切换。
*   **全服总计**：采用增量累加算法，统计服务器历史所有玩家（含离线）的数据总和。
*   **假人过滤**：完美配合 Carpet Mod，自动屏蔽假人（Bot）数据，防止污染榜单。
*   **可视化菜单**：提供交互式聊天栏菜单，管理员操作无需记忆指令。

## 📥 安装方法

1.  下载本数据包的 `.zip` 文件或解压后的文件夹。
2.  将其放入你的存档或服务器的 `world/datapacks/` 文件夹中。
3.  进入游戏，输入 `/reload`。
4.  如果你看到 **"[统计系统] 加载完成"** 的绿色提示，即表示安装成功。

## 👮 管理员设置

为了防止普通玩家误触，所有管理指令需要 **st_admin** 标签。

### 1. 获取权限
在控制台或以 OP 身份输入：
```mcfunction
/tag <你的名字> add st_admin
