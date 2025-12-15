# 1. 玩家 +1
scoreboard players add @s[tag=!bot] st_place 1
# 2. 全服 +1
execute if entity @s[tag=!bot] run scoreboard players add 全服总计 st_place 1
# 3. 重置进度
advancement revoke @s only stats:detect_place