SELECT COUNT(DISTINCT main_id) AS row_count
FROM `tq_yinli_video_tx` d 
left join tq_yinli_video_material m on d.main_id = m.id
WHERE stat_time >= '2024-08-21' and stat_time <= '2024-08-21';





SELECT 
	sum(d.cost) cost, sum(d.mini_game_ad_monetization_amount) mini_game_ad_monetization_amount, sum(d.view_count) view_count, sum(d.valid_click_count) valid_click_count, sum(d.mini_game_register_users) mini_game_register_users,
	sum(d.mini_game_ad_monetization_amount) / sum(d.cost) mini_game_ad_monetization_roi,
	sum(d.valid_click_count) / sum(d.view_count) ctr,
	sum(d.cost) / sum(d.valid_click_count) cpc,
	sum(d.cost) / sum(d.mini_game_register_users) mini_game_register_cost,
	sum(d.mini_game_register_users) / sum(d.valid_click_count) mini_game_register_rate,
	main_id, file_md5, gravity_material_id, thumbnail_url, file_url, file_name
FROM `tq_yinli_video_tx` d left join tq_yinli_video_material m on d.main_id = m.id
WHERE stat_time >= '2024-08-21' and stat_time <= '2024-08-21' 
GROUP BY main_id ORDER BY cost DESC;

