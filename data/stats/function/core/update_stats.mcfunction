# ==========================================
# 核心数据更新
# ==========================================

# 1. 移动距离 (增量累加)
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_walk
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_fly
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_sprint
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_crouch
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_swim
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_aviate
execute as @a[tag=!bot] run scoreboard players operation @s acc_cm += @s raw_climb

execute as @a[tag=!bot] run scoreboard players reset @s raw_walk
execute as @a[tag=!bot] run scoreboard players reset @s raw_fly
execute as @a[tag=!bot] run scoreboard players reset @s raw_sprint
execute as @a[tag=!bot] run scoreboard players reset @s raw_crouch
execute as @a[tag=!bot] run scoreboard players reset @s raw_swim
execute as @a[tag=!bot] run scoreboard players reset @s raw_aviate
execute as @a[tag=!bot] run scoreboard players reset @s raw_climb

scoreboard players set #const st_sys 100
execute as @a[tag=!bot,scores={acc_cm=100..}] run function stats:core/process_move_math

# 2. 战斗数据 (增量累加)
# 击杀
execute as @a[tag=!bot] run scoreboard players operation @s st_kill += @s raw_kill
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_kill += @s raw_kill
execute as @a[tag=!bot] run scoreboard players reset @s raw_kill
# PVP
execute as @a[tag=!bot] run scoreboard players operation @s st_pvp += @s raw_pvp
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_pvp += @s raw_pvp
execute as @a[tag=!bot] run scoreboard players reset @s raw_pvp
# 承伤 (换算)
execute as @a[tag=!bot] run scoreboard players operation @s acc_dmg_in += @s raw_dmg_in
execute as @a[tag=!bot] run scoreboard players reset @s raw_dmg_in
scoreboard players set #const_dmg st_sys 20
execute as @a[tag=!bot,scores={acc_dmg_in=20..}] run function stats:core/process_dmg_in
# 输出 (换算)
execute as @a[tag=!bot] run scoreboard players operation @s acc_dmg_out += @s raw_dmg_out
execute as @a[tag=!bot] run scoreboard players reset @s raw_dmg_out
execute as @a[tag=!bot,scores={acc_dmg_out=20..}] run function stats:core/process_dmg_out
# 死亡
execute as @a[tag=!bot] run scoreboard players operation @s st_death += @s raw_death
execute as @a[tag=!bot] run scoreboard players operation 全服总计 st_death += @s raw_death
execute as @a[tag=!bot] run scoreboard players reset @s raw_death

# 3. 挖掘与放置 (由Carpet脚本接管)

# 4. 假人清洗
scoreboard players reset @a[tag=bot] st_mine
scoreboard players reset @a[tag=bot] st_place
scoreboard players reset @a[tag=bot] st_move
scoreboard players reset @a[tag=bot] st_kill
scoreboard players reset @a[tag=bot] st_pvp
scoreboard players reset @a[tag=bot] st_dmg_in
scoreboard players reset @a[tag=bot] st_dmg_out
scoreboard players reset @a[tag=bot] st_death