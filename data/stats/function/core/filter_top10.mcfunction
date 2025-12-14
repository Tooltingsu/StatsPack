# --- 筛选 Top 10 ---
tag @a add rank_pool

# 运行10次挑选
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max
function stats:core/pick_max

# 移除未晋级的玩家
scoreboard players reset @a[tag=!rank_keep] st_display

# 清理所有标签 (手动分行写，防止粘连)
tag @a remove rank_pool
tag @a remove rank_keep
tag @a remove rank_temp