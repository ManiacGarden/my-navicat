SELECT COUNT(DISTINCT main_id) AS row_count
FROM `tq_yinli_video_byte` d
LEFT JOIN tq_yinli_video_material m ON d.main_id = m.id
WHERE stat_time >= '2024-08-21' AND stat_time <= '2024-08-21';






SELECT 
	sum(d.stat_cost) stat_cost, sum(d.attribution_micro_game_ltv0) attribution_micro_game_ltv0, sum(d.attribution_micro_game_ltv3) attribution_micro_game_ltv3, sum(d.attribution_micro_game_ltv7) attribution_micro_game_ltv7, sum(d.active) active, sum(d.game_addiction) game_addiction, sum(d.show_cnt) show_cnt, sum(d.click_cnt) click_cnt,
	sum(d.attribution_micro_game_ltv0) / sum(d.stat_cost) attribution_micro_game_roi0,
	sum(d.attribution_micro_game_ltv3) / sum(d.stat_cost) attribution_micro_game_roi3,
	sum(d.attribution_micro_game_ltv7) / sum(d.stat_cost) attribution_micro_game_roi7,
	sum(d.stat_cost) / sum(d.active) active_cost,
	sum(d.active) / sum(d.click_cnt) active_rate,
	sum(d.stat_cost) / sum(d.game_addiction) game_addiction_cost,
	sum(d.game_addiction) / sum(d.active) game_addiction_rat,
	sum(d.click_cnt) / sum(d.show_cnt) ctr,
	sum(d.stat_cost) / sum(d.click_cnt) cpc,
	sum(d.stat_cost) / sum(d.show_cnt) * 1000 show_cost,
	main_id, file_md5, gravity_material_id, thumbnail_url, file_url, file_name
FROM `tq_yinli_video_byte` d left join tq_yinli_video_material m on d.main_id = m.id
WHERE stat_time >= '2024-08-21' and stat_time <= '2024-08-21' 
GROUP BY main_id ORDER BY stat_cost DESC;

