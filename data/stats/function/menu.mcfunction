tellraw @s ["\n",{"text":"===== 👮 管理员操作代码 =====","color":"gold","bold":true}]
tellraw @s {"text":"提示：榜单已更新，移动榜单位为(米)","color":"gray"}

tellraw @s [{"text":"[代码 1] ","color":"yellow"},{"text":"暂停/继续","color":"white"},{"text":" | "},{"text":"[代码 2] ","color":"aqua"},{"text":"显示/隐藏","color":"white"}]

tellraw @s {"text":"--- 切换榜单 ---","color":"gray"}
tellraw @s [{"text":"10: 挖掘  ","color":"gold"},{"text":"11: 放置  ","color":"green"},{"text":"12: 移动","color":"aqua"}]
tellraw @s [{"text":"13: 击杀  ","color":"red"},{"text":"14: PVP  ","color":"dark_red"},{"text":"15: 承伤","color":"light_purple"}]
tellraw @s [{"text":"16: 输出  ","color":"dark_purple"},{"text":"17: 死亡","color":"gray"}]

tellraw @s [{"text":"\n[代码 99] ","color":"red","bold":true},{"text":"清空所有数据","color":"red"}]