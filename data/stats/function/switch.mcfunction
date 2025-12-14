$scoreboard players set #index st_sys $(id)

# 切换后强制暂停，防止马上被切走
scoreboard players set #state st_sys 1
# 切换后强制显示
scoreboard players set #display st_sys 0

# 立即刷新显示
function stats:rotate

tellraw @s [{"text":"[系统] 已切换榜单并暂停轮播","color":"green"}]