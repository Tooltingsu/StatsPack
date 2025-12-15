tellraw @s ["\n",{"text":"========== 📘 统计系统使用说明 ==========","color":"aqua","bold":true}]

# 权限说明
tellraw @s [{"text":"🔒 权限要求: ","color":"gray"},{"text":"需要拥有 tag=st_admin 标签","color":"red"}]
tellraw @s [{"text":"⌨️ 快捷指令: ","color":"gray"},{"text":"/trigger st_op set [代码]","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger st_op set "},"hoverEvent":{"action":"show_text","contents":"点击预输入指令"}}]

# 功能列表
tellraw @s "\n[ ⚙️ 基础功能 ]"
tellraw @s [{"text":"  1 ","color":"yellow","bold":true},{"text":"- ⏯ 暂停/继续轮播","color":"white"}]
tellraw @s [{"text":"  2 ","color":"yellow","bold":true},{"text":"- 👁 显示/隐藏侧边栏","color":"white"}]

tellraw @s "\n[ 📊 榜单代码表 ]"
tellraw @s [{"text":"  10-12: ","color":"gold"},{"text":"挖掘、放置、移动","color":"white"}]
tellraw @s [{"text":"  13-15: ","color":"red"},{"text":"击杀、PVP、承伤","color":"white"}]
tellraw @s [{"text":"  16-17: ","color":"light_purple"},{"text":"输出、死亡","color":"white"}]

tellraw @s "\n[ ⚠️ 数据管理 ]"
tellraw @s [{"text":"  99 ","color":"red","bold":true},{"text":"- ♻️ 清空所有数据 (慎用)","color":"red"}]

tellraw @s ["\n",{"text":"💡 小技巧: ","color":"gold"},{"text":"输入 /function stats:menu 可打开交互式控制台","color":"gray","clickEvent":{"action":"run_command","value":"/function stats:menu"},"hoverEvent":{"action":"show_text","contents":"点击打开控制台"}}]
tellraw @s {"text":"=======================================","color":"aqua","bold":true}