# 1. 玩家 +1 (非 Bot)
scoreboard players add @s[tag=!bot] st_place 1

# 2. 全服 +1 (非 Bot)
# 这一步是为了让总计实时更新
execute if entity @s[tag=!bot] run scoreboard players add 全服总计 st_place 1

# 3. 重置进度，等待下次触发
advancement revoke @s only stats:detect_place