# 1. 切换状态 (0->1, 1->0)
scoreboard players add #display st_sys 1
execute if score #display st_sys matches 2.. run scoreboard players set #display st_sys 0

# 2. 执行动作：隐藏
execute if score #display st_sys matches 1 run scoreboard objectives setdisplay sidebar
execute if score #display st_sys matches 1 run tellraw @s [{"text":"[系统] 侧边栏已隐藏","color":"red"}]

# 3. 执行动作：显示 (立即刷新一次)
execute if score #display st_sys matches 0 run function stats:rotate
execute if score #display st_sys matches 0 run tellraw @s [{"text":"[系统] 侧边栏已显示","color":"green"}]