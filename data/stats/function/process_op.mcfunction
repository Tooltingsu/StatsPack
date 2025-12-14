# --- 功能处理中心 ---

# ==========================================
# 代码 1: 暂停/继续 (添加了全服广播提示)
# ==========================================

# 1. 切换状态逻辑 (0->1, 1->0)
execute if score @s st_op matches 1 run scoreboard players add #state st_sys 1
execute if score @s st_op matches 1 if score #state st_sys matches 2.. run scoreboard players set #state st_sys 0

# 2. 发送提示 (State=1 说明刚变成暂停)
# 使用 title 显示在屏幕中央，更显眼
execute if score @s st_op matches 1 if score #state st_sys matches 1 run title @a actionbar {"text":"⏸️ 统计榜单轮播已暂停","color":"yellow","bold":true}
execute if score @s st_op matches 1 if score #state st_sys matches 1 run tellraw @a [{"text":"[系统] ","color":"green"},{"text":"管理员暂停了榜单轮播。","color":"yellow"}]

# 3. 发送提示 (State=0 说明刚恢复)
execute if score @s st_op matches 1 if score #state st_sys matches 0 run title @a actionbar {"text":"▶️ 统计榜单轮播已继续","color":"green","bold":true}
execute if score @s st_op matches 1 if score #state st_sys matches 0 run tellraw @a [{"text":"[系统] ","color":"green"},{"text":"榜单轮播已恢复。","color":"green"}]


# ==========================================
# 代码 2: 显示/隐藏
# ==========================================
execute if score @s st_op matches 2 run scoreboard players add #display st_sys 1
execute if score @s st_op matches 2 if score #display st_sys matches 2.. run scoreboard players set #display st_sys 0

# 执行隐藏
execute if score @s st_op matches 2 if score #display st_sys matches 1 run scoreboard objectives setdisplay sidebar
execute if score @s st_op matches 2 if score #display st_sys matches 1 run tellraw @a [{"text":"[系统] ","color":"green"},{"text":"侧边栏已隐藏。","color":"red"}]

# 执行显示
execute if score @s st_op matches 2 if score #display st_sys matches 0 run function stats:rotate
execute if score @s st_op matches 2 if score #display st_sys matches 0 run tellraw @a [{"text":"[系统] ","color":"green"},{"text":"侧边栏已开启。","color":"green"}]


# ==========================================
# 代码 10-18: 切换榜单
# ==========================================
# 切换前强制暂停并显示
execute if score @s st_op matches 10..18 run scoreboard players set #state st_sys 1
execute if score @s st_op matches 10..18 run scoreboard players set #display st_sys 0

# 设置索引
execute if score @s st_op matches 10 run scoreboard players set #index st_sys -1
execute if score @s st_op matches 11 run scoreboard players set #index st_sys 0
execute if score @s st_op matches 12 run scoreboard players set #index st_sys 1
execute if score @s st_op matches 13 run scoreboard players set #index st_sys 2
execute if score @s st_op matches 14 run scoreboard players set #index st_sys 3
execute if score @s st_op matches 15 run scoreboard players set #index st_sys 4
execute if score @s st_op matches 16 run scoreboard players set #index st_sys 5
execute if score @s st_op matches 17 run scoreboard players set #index st_sys 6
execute if score @s st_op matches 18 run scoreboard players set #index st_sys 7

# 刷新并提示 (使用 Actionbar 不遮挡视线)
execute if score @s st_op matches 10..18 run function stats:rotate
execute if score @s st_op matches 10..18 run title @a actionbar {"text":"📊 管理员手动切换了榜单","color":"aqua"}


# ==========================================
# 代码 99: 清空数据
# ==========================================
execute if score @s st_op matches 99 run function stats:admin/reset


# --- 重置输入 ---
scoreboard players set @s st_op 0