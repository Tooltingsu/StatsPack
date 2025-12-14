# 1. 重置
scoreboard players set 全服总计 st_mine 0
scoreboard players set 全服总计 st_place 0
scoreboard players set 全服总计 st_move 0
scoreboard players set 全服总计 st_kill 0
scoreboard players set 全服总计 st_pvp 0
scoreboard players set 全服总计 st_dmg_in 0
scoreboard players set 全服总计 st_dmg_out 0
scoreboard players set 全服总计 st_death 0

# 2. 累加常规数据
execute as @a run scoreboard players operation 全服总计 st_mine += @s st_mine
execute as @a run scoreboard players operation 全服总计 st_place += @s st_place
execute as @a run scoreboard players operation 全服总计 st_kill += @s st_kill
execute as @a run scoreboard players operation 全服总计 st_pvp += @s st_pvp
execute as @a run scoreboard players operation 全服总计 st_dmg_in += @s st_dmg_in
execute as @a run scoreboard players operation 全服总计 st_dmg_out += @s st_dmg_out
execute as @a run scoreboard players operation 全服总计 st_death += @s st_death

# 3. 特殊计算：全服移动总距离 (需要用 cm 累加后再除)
# 使用一个临时变量 #total_cm 来统计
scoreboard players set #total_cm st_sys 0
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_walk
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_fly
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_sprint
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_crouch
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_swim
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_aviate
execute as @a run scoreboard players operation #total_cm st_sys += @s raw_climb

# cm 转 m
scoreboard players set #const st_sys 100
scoreboard players operation #total_cm st_sys /= #const st_sys
# 赋值给全服总计
scoreboard players operation 全服总计 st_move = #total_cm st_sys