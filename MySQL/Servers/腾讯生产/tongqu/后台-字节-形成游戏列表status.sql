SELECT g.app_id app_id, g.`name` app_name, t.date date_at, t.active_num active_num, g.promotion_flag priority
FROM game g
       left join tt_game_analysis_data t on t.app_id = g.app_id and t.date = '2024-06-19'
WHERE g.deleted_flag = 0
  and g.platform = 'tt'
  and g.update_at > '2023-06-21 10:09:32'
ORDER BY t.active_num desc
