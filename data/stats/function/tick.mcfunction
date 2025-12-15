scoreboard players enable @a st_op

# 管理员指令
execute as @a[tag=st_admin] unless score @s st_op matches 0 run function stats:process_op
execute as @a[tag=!st_admin] unless score @s st_op matches 0 run tellraw @s [{"text":"[❌] 权限不足","color":"red"}]
execute as @a[tag=!st_admin] unless score @s st_op matches 0 run scoreboard players set @s st_op 0

# 轮播计时器 (10秒)
execute if score #state st_sys matches 0 run scoreboard players add #timer st_sys 1
execute if score #state st_sys matches 0 if score #timer st_sys matches 200.. run scoreboard players set #timer st_sys 0
execute if score #state st_sys matches 0 if score #timer st_sys matches 0 run function stats:rotate

# 实时刷新 (1 tick)
function stats:core/update_stats