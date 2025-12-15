tellraw @s ["\n",{"text":"┏━━━━━━━━ 👮 统计系统控制台 ━━━━━━━━┓","color":"gold","bold":true}]

# 系统控制
tellraw @s [{"text":" ▶ 系统控制:  ","color":"gray"},{"text":"[⏯ 暂停/继续]","color":"yellow","bold":true,"clickEvent":{"action":"suggest_command","value":"/trigger st_op set 1"},"hoverEvent":{"action":"show_text","contents":"代码 [1]\n锁定当前榜单，停止自动轮播"}},{"text":"  "},{"text":"[👁 显示/隐藏]","color":"aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/trigger st_op set 2"},"hoverEvent":{"action":"show_text","contents":"代码 [2]\n开启或关闭侧边栏显示"}}]

tellraw @s {"text":"──────────────────────────────────────","color":"dark_gray"}
tellraw @s {"text":" ▼ 榜单切换 (点击即切)","color":"gray"}

# 矩阵布局
tellraw @s [{"text":"  "},{"text":"[10] ⛏️ 挖掘","color":"gold","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 10"}},{"text":"   "},{"text":"[11] 🧱 放置","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 11"}},{"text":"   "},{"text":"[12] 🏃 移动","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 12"}}]
tellraw @s [{"text":"  "},{"text":"[13] ⚔️ 击杀","color":"red","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 13"}},{"text":"   "},{"text":"[14] 🤺 PVP ","color":"dark_red","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 14"}},{"text":"   "},{"text":"[15] 🛡️ 承伤","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 15"}}]
tellraw @s [{"text":"  "},{"text":"[16] 🗡️ 输出","color":"dark_purple","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 16"}},{"text":"   "},{"text":"[17] ☠️ 死亡","color":"gray","clickEvent":{"action":"suggest_command","value":"/trigger st_op set 17"}},{"text":"   "},{"text":"[❓ 指令帮助]","color":"white","clickEvent":{"action":"run_command","value":"/function stats:help"},"hoverEvent":{"action":"show_text","contents":"查看详细指令说明"}}]

tellraw @s {"text":"──────────────────────────────────────","color":"dark_gray"}

# 危险操作
tellraw @s [{"text":" ⚠️ 危险操作:  ","color":"red"},{"text":"[♻️ 清空全服数据]","color":"red","bold":true,"clickEvent":{"action":"suggest_command","value":"/trigger st_op set 99"},"hoverEvent":{"action":"show_text","contents":[{"text":"严重警告：\n","color":"red","bold":true},{"text":"此操作将永久删除数据库中\n所有玩家的历史记录！\n不可恢复！","color":"gray"}]}}]

tellraw @s [{"text":"┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛","color":"gold","bold":true}]