tellraw @s ["\n",{"text":"===== 👮 管理员操作代码 =====","color":"gold","bold":true}]
tellraw @s {"text":"由于环境限制，请使用指令 /trigger st_op set [代码] 进行操作","color":"gray"}

tellraw @s [{"text":"[代码 1] ","color":"yellow","bold":true},{"text":"暂停 / 继续","color":"white"}]
tellraw @s [{"text":"[代码 2] ","color":"aqua","bold":true},{"text":"显示 / 隐藏","color":"white"}]

tellraw @s {"text":"--- 切换榜单 (会自动暂停) ---","color":"gray"}
tellraw @s [{"text":"10: 挖掘  ","color":"gold"},{"text":"11: 放置  ","color":"green"},{"text":"12: 飞行","color":"aqua"}]
tellraw @s [{"text":"13: 行走  ","color":"yellow"},{"text":"14: 击杀  ","color":"red"},{"text":"15: PVP","color":"dark_red"}]
tellraw @s [{"text":"16: 承伤  ","color":"light_purple"},{"text":"17: 输出  ","color":"dark_purple"},{"text":"18: 死亡","color":"gray"}]

tellraw @s {"text":"---------------------------","color":"gray"}
tellraw @s [{"text":"[代码 99] ","color":"red","bold":true},{"text":"清空全服数据 (慎用)","color":"red"}]