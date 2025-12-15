# 1. 切换索引 (0-7)
execute if score #index st_sys matches 7.. run scoreboard players set #index st_sys -1
scoreboard players add #index st_sys 1

# 2. 直接显示
execute if score #index st_sys matches 0 run scoreboard objectives setdisplay sidebar st_mine
execute if score #index st_sys matches 1 run scoreboard objectives setdisplay sidebar st_place
execute if score #index st_sys matches 2 run scoreboard objectives setdisplay sidebar st_move
execute if score #index st_sys matches 3 run scoreboard objectives setdisplay sidebar st_kill
execute if score #index st_sys matches 4 run scoreboard objectives setdisplay sidebar st_pvp
execute if score #index st_sys matches 5 run scoreboard objectives setdisplay sidebar st_dmg_in
execute if score #index st_sys matches 6 run scoreboard objectives setdisplay sidebar st_dmg_out
execute if score #index st_sys matches 7 run scoreboard objectives setdisplay sidebar st_death