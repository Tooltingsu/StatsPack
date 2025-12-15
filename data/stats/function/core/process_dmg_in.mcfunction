# 1. 计算进位： #temp = acc / 20
scoreboard players operation #temp st_sys = @s acc_dmg_in
scoreboard players operation #temp st_sys /= #const_dmg st_sys

# 2. 加给玩家
scoreboard players operation @s st_dmg_in += #temp st_sys

# 3. 加给全服总计
scoreboard players operation 全服总计 st_dmg_in += #temp st_sys

# 4. 取余： acc %= 20 (保留不足1心的零头)
scoreboard players operation @s acc_dmg_in %= #const_dmg st_sys