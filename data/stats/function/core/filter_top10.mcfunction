# --- 筛选 Top 10 (双重过滤) ---

# 1. 准备工作：给 "非bot" 的真实玩家打上筛选标签
# 这一步直接把假人拒之门外
tag @a[tag=!bot] add rank_pool

# 2. 运行10次挑选
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

# 3. 移除未晋级的玩家
scoreboard players reset @a[tag=!rank_keep] st_display

# 4. 清理所有标签
tag @a remove rank_pool
tag @a remove rank_keep
tag @a remove rank_temp