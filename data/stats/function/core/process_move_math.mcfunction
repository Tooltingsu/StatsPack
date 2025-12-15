scoreboard players operation #temp st_sys = @s acc_cm
scoreboard players operation #temp st_sys /= #const st_sys
scoreboard players operation @s st_move += #temp st_sys
scoreboard players operation 全服总计 st_move += #temp st_sys
scoreboard players operation @s acc_cm %= #const st_sys