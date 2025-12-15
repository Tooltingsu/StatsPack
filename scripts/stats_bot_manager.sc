// ==========================================
// 🛠️ StatsPack 挖掘修复专用脚本
// ==========================================

__config() -> {
    'scope' -> 'global',
    // 【关键】强制给予脚本OP权限，否则它无法修改计分板
    'command_permission' -> 4
};

__on_start() -> (
    print(format('l [StatsPack] 调试脚本已加载！请尝试挖掘。'));
);

// --- 挖掘事件 (无条件触发) ---
__on_player_breaks_block(player, block) -> (
    run(str('scoreboard players add %s st_mine 1', player));
    run('scoreboard players add 全服总计 st_mine 1');
);
    

// 假人过滤功能
__on_player_connects(player) -> (
    schedule(20, 'check_player', player);
);

check_player(player) -> (
    if (player ~ 'player_type' != 'real',
        run('tag ' + player + ' add bot');
        run('team join stats_bots ' + player);
        run('scoreboard players reset ' + player);
    );
    if (player ~ 'player_type' == 'real',
        run('tag ' + player + ' remove bot');
    );
);

scan_and_fix() -> (
    for(player('all'),
        if (_ ~ 'player_type' != 'real',
            run('tag ' + _ + ' add bot');
            run('scoreboard players reset ' + _);
        );
    );
);
