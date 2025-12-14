# 如果池子里没人了，直接停止
execute unless entity @a[tag=rank_pool] run return 0

# 1. 设定一个极小值作为初始最大值
scoreboard players set #max_val st_sys -2147483648

# 2. 遍历池子里的玩家，找到最大分数
# 把每个人的分数和 #max_val 比较，如果比它大，就更新 #max_val
execute as @a[tag=rank_pool] run scoreboard players operation #max_val st_sys > @s st_display

# 3. 找到那个分数等于最大值的玩家，打上临时标记
# (如果有并列第一，这步会标记所有并列的人)
execute as @a[tag=rank_pool] if score @s st_display = #max_val st_sys run tag @s add rank_temp

# 4. 从临时标记里只选一个人 (limit=1) 晋级
# 晋级者打上 rank_keep (保留)，并从 rank_pool (池子) 移除
tag @a[tag=rank_temp,limit=1] add rank_keep
tag @a[tag=rank_keep] remove rank_pool

# 5. 清理临时标记 (为并列的其他人做准备，或者下一轮使用)
tag @a remove rank_temp