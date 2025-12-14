# ==========================================
# 核心刷新逻辑 (假人过滤版)
# ==========================================

# 1. 预计算：移动距离 (只算真人的)
# -------------------------------------------------
scoreboard players set #const st_sys 100

# 只有没打 bot 标签的人才进行计算，节省性能
execute as @a[tag=!bot] run scoreboard players operation @s st_move = @s raw_walk
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_fly
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_sprint
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_crouch
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_swim
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_aviate
execute as @a[tag=!bot] run scoreboard players operation @s st_move += @s raw_climb
execute as @a[tag=!bot] run scoreboard players operation @s st_move /= #const st_sys

# 2. 清空显示板
scoreboard players reset * st_display
scoreboard players reset 全服总计 st_display

# 3. 复制数据 (核心：只把真人的数据复制到显示板)
# 这样假人在 st_display 上就没有分数，自然就不会显示
# -------------------------------------------------

# 0: 挖掘
execute if score #index st_sys matches 0 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_mine
execute if score #index st_sys matches 0 run scoreboard players operation 全服总计 st_display = 全服总计 st_mine

# 1: 放置
execute if score #index st_sys matches 1 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_place
execute if score #index st_sys matches 1 run scoreboard players operation 全服总计 st_display = 全服总计 st_place

# 2: 移动
execute if score #index st_sys matches 2 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_move
execute if score #index st_sys matches 2 run scoreboard players operation 全服总计 st_display = 全服总计 st_move

# 3: 击杀
execute if score #index st_sys matches 3 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_kill
execute if score #index st_sys matches 3 run scoreboard players operation 全服总计 st_display = 全服总计 st_kill

# 4: PVP
execute if score #index st_sys matches 4 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_pvp
execute if score #index st_sys matches 4 run scoreboard players operation 全服总计 st_display = 全服总计 st_pvp

# 5: 承伤
execute if score #index st_sys matches 5 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_dmg_in
execute if score #index st_sys matches 5 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_in

# 6: 输出
execute if score #index st_sys matches 6 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_dmg_out
execute if score #index st_sys matches 6 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_out

# 7: 死亡
execute if score #index st_sys matches 7 as @a[tag=!bot] run scoreboard players operation @s st_display = @s st_death
execute if score #index st_sys matches 7 run scoreboard players operation 全服总计 st_display = 全服总计 st_death


# 4. Top 10 过滤
function stats:core/filter_top10


# 5. 单位格式化 (X.Yw)
# -------------------------------------------------
# 真实玩家 (rank_keep 标签只会在 filter_top10 里打给真人，所以这里不需要再判断 bot)
execute as @a[tag=rank_keep] run scoreboard players display numberformat @s st_display
execute as @a[tag=rank_keep] run scoreboard players operation #val st_sys = @s st_display
execute as @a[tag=rank_keep] run data modify storage stats:ram name set value "@s"
execute as @a[tag=rank_keep] run function stats:core/check_format

# 全服总计
scoreboard players display numberformat 全服总计 st_display
scoreboard players operation #val st_sys = 全服总计 st_display
data modify storage stats:ram name set value "全服总计"
function stats:core/check_format