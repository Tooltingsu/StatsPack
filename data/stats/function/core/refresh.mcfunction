# ==========================================
# 核心刷新逻辑：计算移动 -> 复制 -> 筛选 -> 格式化
# ==========================================

# 1. 【新增】预计算：计算移动距离 (cm -> m)
# -------------------------------------------------
# 1.1 设定常数 100
scoreboard players set #const st_sys 100

# 1.2 对所有真实玩家进行求和运算
# 先把 st_move 设为 walk
execute as @a run scoreboard players operation @s st_move = @s raw_walk
# 累加其他所有移动方式
execute as @a run scoreboard players operation @s st_move += @s raw_fly
execute as @a run scoreboard players operation @s st_move += @s raw_sprint
execute as @a run scoreboard players operation @s st_move += @s raw_crouch
execute as @a run scoreboard players operation @s st_move += @s raw_swim
execute as @a run scoreboard players operation @s st_move += @s raw_aviate
execute as @a run scoreboard players operation @s st_move += @s raw_climb

# 1.3 单位换算：除以 100 (厘米变米)
execute as @a run scoreboard players operation @s st_move /= #const st_sys

# -------------------------------------------------

# 2. 清空显示板
scoreboard players reset * st_display
scoreboard players reset 全服总计 st_display

# 3. 复制数据 (注意索引变化)
# -------------------------------------------------
# 0: 挖掘
execute if score #index st_sys matches 0 as @a run scoreboard players operation @s st_display = @s st_mine
execute if score #index st_sys matches 0 run scoreboard players operation 全服总计 st_display = 全服总计 st_mine

# 1: 放置
execute if score #index st_sys matches 1 as @a run scoreboard players operation @s st_display = @s st_place
execute if score #index st_sys matches 1 run scoreboard players operation 全服总计 st_display = 全服总计 st_place

# 2: 移动 (新榜单)
execute if score #index st_sys matches 2 as @a run scoreboard players operation @s st_display = @s st_move
execute if score #index st_sys matches 2 run scoreboard players operation 全服总计 st_display = 全服总计 st_move

# 3: 击杀
execute if score #index st_sys matches 3 as @a run scoreboard players operation @s st_display = @s st_kill
execute if score #index st_sys matches 3 run scoreboard players operation 全服总计 st_display = 全服总计 st_kill

# 4: PVP
execute if score #index st_sys matches 4 as @a run scoreboard players operation @s st_display = @s st_pvp
execute if score #index st_sys matches 4 run scoreboard players operation 全服总计 st_display = 全服总计 st_pvp

# 5: 承伤
execute if score #index st_sys matches 5 as @a run scoreboard players operation @s st_display = @s st_dmg_in
execute if score #index st_sys matches 5 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_in

# 6: 输出
execute if score #index st_sys matches 6 as @a run scoreboard players operation @s st_display = @s st_dmg_out
execute if score #index st_sys matches 6 run scoreboard players operation 全服总计 st_display = 全服总计 st_dmg_out

# 7: 死亡
execute if score #index st_sys matches 7 as @a run scoreboard players operation @s st_display = @s st_death
execute if score #index st_sys matches 7 run scoreboard players operation 全服总计 st_display = 全服总计 st_death


# 4. Top 10 过滤
function stats:core/filter_top10

# 5. 单位格式化 (X.Yw)
# 真实玩家
execute as @a[tag=rank_keep] run scoreboard players display numberformat @s st_display
execute as @a[tag=rank_keep] run scoreboard players operation #val st_sys = @s st_display
execute as @a[tag=rank_keep] run data modify storage stats:ram name set value "@s"
execute as @a[tag=rank_keep] run function stats:core/check_format

# 全服总计
scoreboard players display numberformat 全服总计 st_display
scoreboard players operation #val st_sys = 全服总计 st_display
data modify storage stats:ram name set value "全服总计"
function stats:core/check_format