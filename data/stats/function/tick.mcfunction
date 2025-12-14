# 1. 开启触发器权限
scoreboard players enable @a st_op

# 2. 处理指令
execute as @a unless score @s st_op matches 0 run function stats:process_op

# 3. 轮播计时器 (10秒换一次榜)
execute if score #state st_sys matches 0 if score #display st_sys matches 0 run scoreboard players add #timer st_sys 1
execute if score #state st_sys matches 0 if score #display st_sys matches 0 if score #timer st_sys matches 200.. run scoreboard players set #timer st_sys 0
execute if score #state st_sys matches 0 if score #display st_sys matches 0 if score #timer st_sys matches 0 run function stats:rotate

# 4. 实时刷新显示 (每20 tick = 1秒 刷新一次数据)
# 这样既保证了实时性，又不会因为每tick排序导致卡顿
scoreboard players add #refresh_timer st_sys 1
execute if score #refresh_timer st_sys matches 1.. run function stats:core/refresh
execute if score #refresh_timer st_sys matches 1.. run scoreboard players set #refresh_timer st_sys 0

# 5. 计算总和
function stats:calc_total