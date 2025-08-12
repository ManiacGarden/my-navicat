SELECT t1.*, t2.ranking - t1.ranking AS rank_change, g.entity as entity
    FROM tq_tt_game_center_ranking_new t1
    LEFT JOIN (
        SELECT app_id, ranking
        FROM tq_tt_game_center_ranking_new
        WHERE date_time = '2024-10-10'
    ) t2 ON t1.app_id = t2.app_id
		left join tq_tt_game_list g on t1.app_id=g.app_id
    WHERE t1.date_time = '2024-10-11'
    ORDER BY t1.ranking ASC
    LIMIT 50 OFFSET 0
