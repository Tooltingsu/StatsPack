// ==========================================
// 🤖 StatsPack 混合管理器 (队伍保护版)
// 功能: 假人过滤 + 挖掘统计 + 保护真人队伍
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
    run('team modify stats_bots displayName {"text":"[Bot]","color":"gray"}');
    print(format('l [StatsPack] 脚本已就绪 (队伍保护模式)。'));
);

// --- 1. 进服检测 ---
__on_player_connects(player) -> (
    schedule(20, 'check_player', player);
);

check_player(player) -> (
    type = player ~ 'player_type';
    
    // 如果是假人
    if (type == 'fake' || type == 'shadow',
        // 1. 必须打标签 (用于数据包屏蔽数据)
        run('tag ' + player + ' add bot');
        
        // 2. 分数清零
        run('scoreboard players reset ' + player);
        
        // 3. 【核心修改】队伍安全检查
        // 获取玩家当前所在的队伍
        current_team = query(player, 'team');
        
        // 只有当玩家【没有队伍】时，才加入 stats_bots
        // 如果玩家已经在 A 队，就不动他，防止把真人挤出 A 队
        if (current_team == null,
            run('team join stats_bots ' + player);
            print(format(str('g [StatsPack] 无队假人 %s 已归入 stats_bots。', player)));
        ,
            // 如果已经在别的队，只打印个提示，不动队伍
            print(format(str('g [StatsPack] 假人 %s 已在队伍 %s 中，保持原样。', player, current_team)));
        );
    );
    
    // 如果是真人
    if (type == 'real',
        run('tag ' + player + ' remove bot');
    );
);

// --- 2. 离线清理 ---
__on_player_disconnects(player, reason) -> (
    // 1. 获取当前队伍
    current_team = query(player, 'team');
    
    // 2. 只有当他确实在 stats_bots 队里时，才执行离开
    // 如果他在 A 队，绝对不能踢，否则真人上线也没队了
    if (current_team == 'stats_bots',
        run(str('team leave %s', player));
    )
);

// --- 3. 手动修复指令 ---
scan_and_fix() -> (
    for(player('all'),
        p = _;
        if (p ~ 'player_type' != 'real',
            run('tag ' + p + ' add bot');
            run('scoreboard players reset ' + p);
            
            // 手动修复也遵循安全原则
            if (query(p, 'team') == null,
                run('team join stats_bots ' + p);
            );
        );
        if (p ~ 'player_type' == 'real',
            run('tag ' + p + ' remove bot');
        );
    );
    print(format('l [StatsPack] 标签已修复 (队伍保持现状)。'));
);

// --- 4. 挖掘统计 ---
__on_player_breaks_block(player, block) -> (
    if (player ~ 'player_type' == 'real' && player ~ 'gamemode' == 'survival',
        run(str('scoreboard players add %s st_mine 1', player));
        run('scoreboard players add 全服总计 st_mine 1');
    )
);

// --- 5. 历史数据校准 ---
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
