# 1. 核心显示板
scoreboard objectives add st_mine dummy {"text":"⛏️ 挖掘榜","color":"gold"}
scoreboard objectives add st_place dummy {"text":"🧱 放置榜","color":"green"}
scoreboard objectives add st_move dummy {"text":"🏃 移动榜 (米)","color":"aqua"}
scoreboard objectives add st_kill dummy {"text":"⚔️ 击杀榜","color":"red"}
scoreboard objectives add st_pvp dummy {"text":"🤺 PVP榜","color":"dark_red"}
scoreboard objectives add st_dmg_in dummy {"text":"🛡️ 承伤榜 (心)","color":"light_purple"}
scoreboard objectives add st_dmg_out dummy {"text":"🗡️ 输出榜 (心)","color":"dark_purple"}
scoreboard objectives add st_death dummy {"text":"☠️ 死亡榜","color":"gray"}

# 2. 后台统计 (Raw Data)
scoreboard objectives add raw_walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add raw_fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add raw_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add raw_crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add raw_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add raw_aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add raw_climb minecraft.custom:minecraft.climb_one_cm

scoreboard objectives add raw_kill minecraft.custom:minecraft.mob_kills
scoreboard objectives add raw_pvp minecraft.custom:minecraft.player_kills
scoreboard objectives add raw_dmg_in minecraft.custom:minecraft.damage_taken
scoreboard objectives add raw_dmg_out minecraft.custom:minecraft.damage_dealt
scoreboard objectives add raw_death minecraft.custom:minecraft.deaths

# 累加器
scoreboard objectives add acc_cm dummy
scoreboard objectives add acc_dmg_in dummy
scoreboard objectives add acc_dmg_out dummy

# 3. 系统初始化
scoreboard objectives add st_display dummy {"text":"📊 统计榜单","color":"white"}
scoreboard objectives setdisplay sidebar st_display
scoreboard objectives add st_sys dummy
scoreboard objectives add st_op trigger
scoreboard players set #timer st_sys 0
scoreboard players set #index st_sys 0
scoreboard players set #state st_sys 0

# 全服总计美化 (保留这个，因为分榜里还需要显示全服总计)
team add st_total_label
team modify st_total_label prefix {"text":"❀","color":"gold"}
team join st_total_label 全服总计
team modify st_total_label color white

tellraw @a [{"text":"[统计系统] ","color":"green"},{"text":"加载成功！","color":"white"}]