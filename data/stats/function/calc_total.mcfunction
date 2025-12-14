# 直接使用中文名（去掉了引号，这在 1.21 是合法的）
scoreboard players set 全服总计 st_mine 0
scoreboard players set 全服总计 st_place 0
scoreboard players set 全服总计 st_fly 0
scoreboard players set 全服总计 st_walk 0
scoreboard players set 全服总计 st_kill 0
scoreboard players set 全服总计 st_pvp 0
scoreboard players set 全服总计 st_dmg_in 0
scoreboard players set 全服总计 st_dmg_out 0
scoreboard players set 全服总计 st_death 0

# 累加分数
execute as @a run scoreboard players operation 全服总计 st_mine += @s st_mine
execute as @a run scoreboard players operation 全服总计 st_place += @s st_place
execute as @a run scoreboard players operation 全服总计 st_fly += @s st_fly
execute as @a run scoreboard players operation 全服总计 st_walk += @s st_walk
execute as @a run scoreboard players operation 全服总计 st_kill += @s st_kill
execute as @a run scoreboard players operation 全服总计 st_pvp += @s st_pvp
execute as @a run scoreboard players operation 全服总计 st_dmg_in += @s st_dmg_in
execute as @a run scoreboard players operation 全服总计 st_dmg_out += @s st_dmg_out
execute as @a run scoreboard players operation 全服总计 st_death += @s st_death