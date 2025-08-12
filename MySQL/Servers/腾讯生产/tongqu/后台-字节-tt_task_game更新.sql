-- 注意有3个地方要改日期
INSERT INTO `tt_task_game` (`id`, `game_id`, `game_name`, `icon`, `poster_icon`, `introduction`, `tag`,
                                  `start_time`, `end_time`, `recent_max_profit`, `total_play_count`, `user_count`,
                                  `video_count`, `sort_no`, `date`, `update_at`, `create_at`)
    (select NULL,  `game_id`,  `game_name`,  `icon`,  `poster_icon`,  `introduction`,  `tag`,  `start_time`,  `end_time`,  `recent_max_profit`,  `total_play_count`,  `user_count`,  `video_count`,  `sort_no`, 
		 -- 复制到这天  
		'2024-05-23',  `update_at`,  `create_at`
     FROM tt_task_game
		 -- 有的那天，复制源
     where date ='2024-05-17'
       and game_id not in
         (SELECT game_id from tt_task_game
				 -- 复制到这天
         where date = '2024-05-23'));
