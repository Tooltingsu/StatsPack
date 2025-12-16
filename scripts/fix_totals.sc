// ==========================================
// 🧮 全服总计校准器 (指令修复版)
// ==========================================

__config() -> {
    'scope' -> 'global',
    'command_permission' -> 4,
    // 【关键修改】注册指令
    // 现在你可以直接输入 /fix_totals 来运行，不需要用 /script run
    'commands' -> {
        '' -> 'fix_all'
    }
};

// 定义需要校准的榜单列表
global_objectives = [
    'st_mine', 
    'st_place', 
    'st_move', 
    'st_kill', 
    'st_pvp', 
    'st_dmg_in', 
    'st_dmg_out', 
    'st_death'
];

fix_all() -> (
    print(format('g [StatsPack] 开始校准全服总计...'));
    
    // 遍历每一个榜单
    for(global_objectives,
        obj = _;
        total_sum = 0;
        
        // 获取该榜单上所有有分数的玩家（含离线）
        holders = scoreboard(obj);
        
        // 遍历名单求和
        for(holders,
            name = _;
            // 排除“全服总计”自己，排除管理员测试用的 Total_xx
            // 注意：Carpet脚本里 scoreboard 函数返回的是玩家名字符串
            // 检查是否带有 bot 标签需要用 entity_selector 或 tag 指令，但对于离线玩家很难判断
            // 这里我们简单粗暴：只要不是以 "全服总计" 开头的都算进去
            // (前提是你已经用数据包把在线假人的分清零了，离线假人如果没分也不会被统计)
            if (name != '全服总计' && slice(name, 0, 5) != 'Total',
                score = scoreboard(obj, name);
                if (score, total_sum += score);
            )
        );
        
        // 覆盖写入全服总计
        run(str('scoreboard players set 全服总计 %s %d', obj, total_sum));
        print(format(str('l - %s 已校准为: %d', obj, total_sum)));
    );
    
    // 顺便校准一下总览页的展示
    run('function stats:core/update_stats');
    
    print(format('w [StatsPack] 校准完毕！'));
);