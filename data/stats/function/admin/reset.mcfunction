# 清空显示数据
scoreboard players reset * st_mine
scoreboard players reset * st_place
scoreboard players reset * st_move
scoreboard players reset * st_kill
scoreboard players reset * st_pvp
scoreboard players reset * st_dmg_in
scoreboard players reset * st_dmg_out
scoreboard players reset * st_death

# 清空后台原始统计 (必须清空，否则移动榜会马上变回原样)
scoreboard players reset * raw_walk
scoreboard players reset * raw_fly
scoreboard players reset * raw_sprint
scoreboard players reset * raw_crouch
scoreboard players reset * raw_swim
scoreboard players reset * raw_aviate
scoreboard players reset * raw_climb

# 清空全服总计
scoreboard players reset 全服总计 st_mine
scoreboard players reset 全服总计 st_place
scoreboard players reset 全服总计 st_move
scoreboard players reset 全服总计 st_kill
scoreboard players reset 全服总计 st_pvp
scoreboard players reset 全服总计 st_dmg_in
scoreboard players reset 全服总计 st_dmg_out
scoreboard players reset 全服总计 st_death

tellraw @a {"text":"[系统] 所有榜单数据(含移动记录)已被清空。","color":"red"}