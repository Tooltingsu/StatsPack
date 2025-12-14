# 1. 切换状态 (0->1, 1->0)
scoreboard players add #state st_sys 1
execute if score #state st_sys matches 2.. run scoreboard players set #state st_sys 0

# 2. 反馈消息
execute if score #state st_sys matches 1 run tellraw @s [{"text":"[系统] 轮播已暂停 ⏸️","color":"yellow"}]
execute if score #state st_sys matches 0 run tellraw @s [{"text":"[系统] 轮播已继续 ▶️","color":"green"}]