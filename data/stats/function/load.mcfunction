# --- 1. 核心展示榜 ---
scoreboard objectives add st_mine dummy {"text":"⛏️ 挖掘榜","color":"gold"}
scoreboard objectives add st_place dummy {"text":"🧱 放置榜","color":"green"}
scoreboard objectives add st_move dummy {"text":"🏃 移动榜 (米)","color":"aqua"}
scoreboard objectives add st_kill minecraft.custom:minecraft.mob_kills {"text":"⚔️ 击杀榜","color":"red"}
scoreboard objectives add st_pvp minecraft.custom:minecraft.player_kills {"text":"🤺 PVP榜","color":"dark_red"}
scoreboard objectives add st_dmg_in minecraft.custom:minecraft.damage_taken {"text":"🛡️ 承伤榜","color":"light_purple"}
scoreboard objectives add st_dmg_out minecraft.custom:minecraft.damage_dealt {"text":"🗡️ 输出榜","color":"dark_purple"}
scoreboard objectives add st_death minecraft.custom:minecraft.deaths {"text":"☠️ 死亡榜","color":"gray"}

# --- 2. 后台原始统计 (cm) ---
# 这些数据用于累加计算总移动距离
scoreboard objectives add raw_walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add raw_fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add raw_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add raw_crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add raw_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add raw_aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add raw_climb minecraft.custom:minecraft.climb_one_cm
# 移除旧的废弃板 (清理垃圾)
scoreboard objectives remove st_walk
scoreboard objectives remove st_fly

# --- 3. 显示专用板 ---
scoreboard objectives add st_display dummy {"text":"📊 统计榜单","color":"white"}
scoreboard objectives setdisplay sidebar st_display

# --- 4. 系统控制 ---
scoreboard objectives add st_sys dummy
scoreboard objectives add st_op trigger
scoreboard players set #timer st_sys 0
scoreboard players set #index st_sys 0
scoreboard players set #state st_sys 0
scoreboard players set #display st_sys 0

# 全服总计美化
team add st_total_label
team modify st_total_label prefix {"text":"","color":"gold"}
team join st_total_label 全服总计
team modify st_total_label color white

# 更新最大索引 (现在只有 0-7 共8个榜)
scoreboard players set #max_index st_sys 7

tellraw @a [{"text":"[统计系统] ","color":"green"},{"text":"加载完成！移动榜已合并 (m)。","color":"white"}]