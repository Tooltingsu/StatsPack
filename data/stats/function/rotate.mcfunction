# 1. 切换索引 (0-8)
execute if score #index st_sys matches 8.. run scoreboard players set #index st_sys -1
scoreboard players add #index st_sys 1

# 2. 修改 st_display 的标题 (Display Name)
# 这样侧边栏始终是 st_display，但名字会变
execute if score #index st_sys matches 0 run scoreboard objectives modify st_display displayname {"text":"⛏️ 挖掘榜 (Top 10)","color":"gold"}
execute if score #index st_sys matches 1 run scoreboard objectives modify st_display displayname {"text":"🧱 放置榜 (Top 10)","color":"green"}
execute if score #index st_sys matches 2 run scoreboard objectives modify st_display displayname {"text":"🕊️ 飞行榜 (Top 10)","color":"aqua"}
execute if score #index st_sys matches 3 run scoreboard objectives modify st_display displayname {"text":"🏃 行走榜 (Top 10)","color":"yellow"}
execute if score #index st_sys matches 4 run scoreboard objectives modify st_display displayname {"text":"⚔️ 击杀榜 (Top 10)","color":"red"}
execute if score #index st_sys matches 5 run scoreboard objectives modify st_display displayname {"text":"🤺 PVP榜 (Top 10)","color":"dark_red"}
execute if score #index st_sys matches 6 run scoreboard objectives modify st_display displayname {"text":"🛡️ 承伤榜 (Top 10)","color":"light_purple"}
execute if score #index st_sys matches 7 run scoreboard objectives modify st_display displayname {"text":"🗡️ 输出榜 (Top 10)","color":"dark_purple"}
execute if score #index st_sys matches 8 run scoreboard objectives modify st_display displayname {"text":"☠️ 死亡榜 (Top 10)","color":"gray"}

# 3. 立即触发一次数据刷新
function stats:core/refresh