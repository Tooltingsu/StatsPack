# --- 输入：假定 #val st_sys 已经存储了要判断的分数 ---
# --- 输入：假定 storage stats:ram name 已经存储了目标名字 ---

# 1. 如果小于 10000 (1w)，恢复默认显示
execute if score #val st_sys matches ..9999 run return fail

# 2. 如果大于等于 10000，开始计算
# 2.1 计算整数位 (int = val / 10000)
scoreboard players operation #int st_sys = #val st_sys
scoreboard players set #const st_sys 10000
scoreboard players operation #int st_sys /= #const st_sys

# 2.2 计算小数位 (dec = (val % 10000) / 1000)
scoreboard players operation #dec st_sys = #val st_sys
scoreboard players operation #dec st_sys %= #const st_sys
scoreboard players set #const st_sys 1000
scoreboard players operation #dec st_sys /= #const st_sys

# 3. 将结果存入 Storage，准备调用宏
execute store result storage stats:ram i int 1 run scoreboard players get #int st_sys
execute store result storage stats:ram d int 1 run scoreboard players get #dec st_sys

# 4. 调用宏应用格式
function stats:core/apply_w with storage stats:ram