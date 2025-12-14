# ==========================================
# 计算全服总计 (已过滤假人 tag=!bot)
# ==========================================

# 1. 重置总计分数
scoreboard players set 全服总计 st_mine 0
scoreboard players set 全服总计 st_place 0
scoreboard players set 全服总计 st_move 0
scoreboard players set 全服总计 st_kill 0
scoreboard players set 全服总计 st_pvp 0
scoreboard players set 全服总计 st_dmg_in 0
scoreboard players set 全服总计 st_dmg_out 0
scoreboard players set 全服总计 st_death 0

# 2. 累加常规数据 (核心：只选非 bot 玩家)
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_mine += @s st_mine
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_place += @s st_place
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_kill += @s st_kill
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_pvp += @s st_pvp
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_dmg_in += @s st_dmg_in
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_dmg_out += @s st_dmg_out
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_death += @s st_death

# 3. 特殊计算：全服移动总距离 (cm -> m)
scoreboard players set #total_cm st_sys 0

# 只统计真人移动数据
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_walk
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_fly
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_sprint
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_crouch
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_swim
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_aviate
execute as @a[tag=!bot] run scoreboard players operation #total_cm st_sys += @s raw_climb

# 单位换算
scoreboard players set #const st_sys 100
scoreboard players operation #total_cm st_sys /= #const st_sys
scoreboard players operation 全服总计 st_move = #total_cm st_sys