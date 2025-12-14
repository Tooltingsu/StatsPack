// ==========================================
// 📊 StatsPack 假人自动过滤器
// 描述: 自动检测 Carpet 假人并打上 bot 标签，使其不参与排行榜统计
// ==========================================

__config() -> {
    'scope' -> 'global',
    'commands' -> {
        'fix_all' -> 'fix_existing_bots'
    }
};

// --- 当脚本加载时 ---
__on_start() -> (
    // 创建一个专门的队伍用于标记假人 (可选，为了视觉区分)
    // 如果不需要灰色名字，可以注释掉下面两行
    run('team add stats_bots');
    run('team modify stats_bots color gray');
    print(format('l [StatsPack] 假人管理器已加载！'));
);

// --- 当玩家/假人加入服务器时 ---
__on_player_connects(player) -> (
    // 获取玩家类型 (real, fake, shadow)
    type = player ~ 'player_type';
    
    // 如果是 假人(fake) 或 影子(shadow)
    if (type == 'fake' || type == 'shadow',
        // 1. 打上 bot 标签 (这是数据包识别的关键)
        run('tag ' + player + ' add bot');
        
        // 2. 移除 active 标签 (防止之前误触加入榜单)
        run('tag ' + player + ' remove active');
        
        // 3. 加入灰色队伍 (可选)
        run('team join stats_bots ' + player);
        
        // 4. 后台日志
        print(format(str('g [StatsPack] 检测到假人 %s，已自动屏蔽统计。', player)));
    );
    
    // 如果是 真人
    if (type == 'real',
        // 确保真人身上没有 bot 标签 (防止误伤)
        run('tag ' + player + ' remove bot');
    );
);

// --- 手动修复指令: /stats_bot_manager fix_all ---
// 用于处理脚本安装前就已经存在的假人
fix_existing_bots() -> (
    count = 0;
    // 遍历所有在线玩家
    for(player('all'),
        p = _;
        type = p ~ 'player_type';
        if (type == 'fake' || type == 'shadow',
            run('tag ' + p + ' add bot');
            run('tag ' + p + ' remove active');
            run('team join stats_bots ' + p);
            count += 1;
        )
    );
    print(format(str('l [StatsPack] 已修复 %d 个在线假人的标签。', count)));
);