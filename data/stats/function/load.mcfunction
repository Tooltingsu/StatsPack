# --- 1. 数据存储板 (存数据的) ---
scoreboard objectives add st_mine dummy {"text":"⛏️ 挖掘榜","color":"gold"}
scoreboard objectives add st_place dummy {"text":"🧱 放置榜","color":"green"}
scoreboard objectives add st_fly minecraft.custom:minecraft.fly_one_cm {"text":"🕊️ 飞行榜","color":"aqua"}
scoreboard objectives add st_walk minecraft.custom:minecraft.walk_one_cm {"text":"🏃 行走榜","color":"yellow"}
scoreboard objectives add st_kill minecraft.custom:minecraft.mob_kills {"text":"⚔️ 击杀榜","color":"red"}
scoreboard objectives add st_pvp minecraft.custom:minecraft.player_kills {"text":"🤺 PVP榜","color":"dark_red"}
scoreboard objectives add st_dmg_in minecraft.custom:minecraft.damage_taken {"text":"🛡️ 承伤榜","color":"light_purple"}
scoreboard objectives add st_dmg_out minecraft.custom:minecraft.damage_dealt {"text":"🗡️ 输出榜","color":"dark_purple"}
scoreboard objectives add st_death minecraft.custom:minecraft.deaths {"text":"☠️ 死亡榜","color":"gray"}

# --- 2. 显示专用板 (给玩家看的) ---
# 这个板会经过过滤，只留前10名
scoreboard objectives add st_display dummy {"text":"📊 统计榜单","color":"white"}
# 固定显示这个板
scoreboard objectives setdisplay sidebar st_display

# --- 3. 系统控制 ---
scoreboard objectives add st_sys dummy
scoreboard objectives add st_op trigger

# 初始化
scoreboard players set #timer st_sys 0
scoreboard players set #index st_sys 0
scoreboard players set #state st_sys 0
scoreboard players set #display st_sys 0

# 创建全服总计的队伍 (用于美化名字)
team add st_total_label
team modify st_total_label prefix {"text":"","color":"gold"}
team join st_total_label 全服总计
team modify st_total_label color white

tellraw @a [{"text":"[统计系统] ","color":"green"},{"text":"加载完成！已启用Top10过滤模式。","color":"white"}]