# 1. 清空显示板
scoreboard players reset * st_display
scoreboard players reset 全服总计 st_display

# 2. 根据当前索引，把源数据复制过来
# 全服总计 也要复制
execute if score #index st_sys matches 0 as @a run scoreboard players operation @s st_display = @s st_mine
execute if score #index st_sys matches 0 run scoreboard players operation 全服总计 st_display = 全服总计 st_mine

execute if score #index st_sys matches 1 as @a run scoreboard players operation @s st_display = @s st_place
execute if score #index st_sys matches 1 run scoreboard players operation 全服总计 st_display = 全服总计 st_place

execute if score #index st_sys matches 2 as @a run scoreboard players operation @s st_display = @s st_fly
execute if score #index st_sys matches 2 run scoreboard players operation 全服总计 st_display = 全服总计 st_fly

execute if score #index st_sys matches 3 as @a run scoreboard players operation @s st_display = @s st_walk
execute if score #index st_sys matches 3 run scoreboard players operation 全服总计 st_display = 全服总计 st_walk

execute if score #index st_sys matches 4 as @a run scoreboard players operation @s st_display = @s st_kill
execute if score #index st_sys matches 4 run scoreboard players operation 全服总计 st_display = 全服总计 st_kill

execute if score #index st_sys matches 5 as @a run scoreboard players operation @s st_display = @s st_pvp
execute if score #index st_sys matches 5 run scoreboard players operation 全服总计 st_display = 全服总计 st_pvp

execute if score #index st_sys matches 6 as @a run scoreboard players operation @s st_display = @s st_dmg_in
execute if score #index st_sys matches 6 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_in

execute if score #index st_sys matches 7 as @a run scoreboard players operation @s st_display = @s st_dmg_out
execute if score #index st_sys matches 7 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_out

execute if score #index st_sys matches 8 as @a run scoreboard players operation @s st_display = @s st_death
execute if score #index st_sys matches 8 run scoreboard players operation 全服总计 st_display = 全服总计 st_death

# 3. 执行 Top 10 过滤算法
function stats:core/filter_top10