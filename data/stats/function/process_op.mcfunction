# 1. 暂停/继续
execute if score @s st_op matches 1 run scoreboard players add #state st_sys 1
execute if score @s st_op matches 1 if score #state st_sys matches 2.. run scoreboard players set #state st_sys 0
execute if score @s st_op matches 1 if score #state st_sys matches 1 run title @a actionbar {"text":"⏸️ 榜单轮播已暂停","color":"yellow"}
execute if score @s st_op matches 1 if score #state st_sys matches 0 run title @a actionbar {"text":"▶️ 榜单轮播已继续","color":"green"}

# 2. 显示/隐藏
execute if score @s st_op matches 2 run scoreboard objectives setdisplay sidebar
execute if score @s st_op matches 2 run tellraw @a [{"text":"[系统] ","color":"green"},{"text":"侧边栏已隐藏","color":"red"}]

# 3. 手动切换 (10-17)
execute if score @s st_op matches 10..17 run scoreboard players set #state st_sys 1

execute if score @s st_op matches 10 run scoreboard objectives setdisplay sidebar st_mine
execute if score @s st_op matches 11 run scoreboard objectives setdisplay sidebar st_place
execute if score @s st_op matches 12 run scoreboard objectives setdisplay sidebar st_move
execute if score @s st_op matches 13 run scoreboard objectives setdisplay sidebar st_kill
execute if score @s st_op matches 14 run scoreboard objectives setdisplay sidebar st_pvp
execute if score @s st_op matches 15 run scoreboard objectives setdisplay sidebar st_dmg_in
execute if score @s st_op matches 16 run scoreboard objectives setdisplay sidebar st_dmg_out
execute if score @s st_op matches 17 run scoreboard objectives setdisplay sidebar st_death

execute if score @s st_op matches 10..17 run title @a actionbar {"text":"📊 已切换榜单","color":"aqua"}

# 99. 清空
execute if score @s st_op matches 99 run function stats:admin/reset

scoreboard players set @s st_op 0