# 清空所有玩家
scoreboard players reset * st_mine
scoreboard players reset * st_place
scoreboard players reset * st_fly
scoreboard players reset * st_walk
scoreboard players reset * st_kill
scoreboard players reset * st_pvp
scoreboard players reset * st_dmg_in
scoreboard players reset * st_dmg_out
scoreboard players reset * st_death

# 清空中文总计
scoreboard players reset 全服总计 st_mine
scoreboard players reset 全服总计 st_place
scoreboard players reset 全服总计 st_fly
scoreboard players reset 全服总计 st_walk
scoreboard players reset 全服总计 st_kill
scoreboard players reset 全服总计 st_pvp
scoreboard players reset 全服总计 st_dmg_in
scoreboard players reset 全服总计 st_dmg_out
scoreboard players reset 全服总计 st_death

tellraw @a {"text":"[系统] 所有榜单数据已被管理员清空。","color":"red"}