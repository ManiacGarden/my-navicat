SELECT t.app_id, count(*) days, min(t.date), max(t.date), t.cost, sum(t.active_num) from tt_game_analysis_data t

 join (
 
 -- 这期间收入总收入大于3000的游戏
	SELECT * from (
		SELECT app_id, sum(cost) sum_cost from tt_game_analysis_data where date> '2025-07-09' GROUP BY app_id
	) tmp 
	where sum_cost > 3000
	
) tmp2 on t.app_id = tmp2.app_id


where t.date > '2025-07-09' 
and t.date < '2025-08-17'
 and t.cost = 0 and t.active_num > 500
group by app_id

order by  t.active_num desc