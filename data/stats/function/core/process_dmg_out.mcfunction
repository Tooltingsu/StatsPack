# 1. 计算进位
scoreboard players operation #temp st_sys = @s acc_dmg_out
scoreboard players operation #temp st_sys /= #const_dmg st_sys

# 2. 加给玩家
scoreboard players operation @s st_dmg_out += #temp st_sys

# 3. 加给全服总计
scoreboard players operation 全服总计 st_dmg_out += #temp st_sys

# 4. 取余
scoreboard players operation @s acc_dmg_out %= #const_dmg st_sys