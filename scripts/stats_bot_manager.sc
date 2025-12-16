// ==========================================
// 🤖 StatsPack 混合管理器 (防误伤修复版)
// ==========================================

__config() -> {
    'scope' -> 'global',
    'command_permission' -> 4,
    'commands' -> {
        'fix_bots' -> 'scan_and_fix',
        'sync_history' -> 'sync_all_mining_stats'
    }
};

__on_start() -> (
    run('team add stats_bots');
    run('team modify stats_bots color gray');
    print(format('l [StatsPack] 脚本已加载 (防误伤模式)。'));
);

// --- 1. 进服检测 (核心修复) ---
__on_player_connects(player) -> (
    // 延迟 20 tick，等待数据加载完毕
    schedule(20, 'check_player', player);
);

check_player(player) -> (
    // 1. 【关键】进服先“洗白”，强制移除 bot 标签
    // 这样保证真人绝对不会带标签
    run(str('tag %s remove bot', player));
    
    // 获取玩家类型
    type = player ~ 'player_type';
    
    // 2. 只有明确是假人时，才打标签
    if (type == 'fake' || type == 'shadow',
        run(str('tag %s add bot', player));
        run(str('team join stats_bots %s', player));
        run(str('scoreboard players reset %s', player));
        print(format(str('g [StatsPack] 检测到假人: %s (已屏蔽)', player)));
    );
);

// --- 2. 手动扫描修复 ---
scan_and_fix() -> (
    count_bot = 0;
    count_real = 0;
    for(player('all'),
        p = _;
        type = p ~ 'player_type';
        
        // 明确是假人 -> 加标签
        if (type == 'fake' || type == 'shadow',
            run(str('tag %s add bot', p));
            run(str('scoreboard players reset %s', p));
            count_bot += 1;
        );
        
        // 明确是真人 -> 删标签
        if (type == 'real',
            run(str('tag %s remove bot', p));
            count_real += 1;
        );
    );
    print(format(str('l [StatsPack] 扫描完成: 标记 %d 个假人, 清洗 %d 个真人。', count_bot, count_real)));
);

// --- 3. 挖掘统计 (混合模式) ---
__on_player_breaks_block(player, block) -> (
    // 严格检查：真人 + 生存模式
        run(str('scoreboard players add %s st_mine 1', player));
        run('scoreboard players add 全服总计 st_mine 1');
);

// --- 4. 历史数据校准 ---
sync_all_mining_stats() -> (
    p = player();
    print(format('g 正在同步原版挖掘统计...'));
    total = 0;
    for(block_list(),
        stat = statistic(p, 'mined', _);
        if (stat, total += stat);
    );
    if (total > 0,
        run(str('scoreboard players set %s st_mine %d', p, total));
        print(format(str('l [成功] 真实挖掘数: %d', total)));
    );
);