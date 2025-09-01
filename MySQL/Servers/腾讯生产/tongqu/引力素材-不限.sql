SELECT COUNT(DISTINCT main_id) AS row_count
FROM `tq_yinli_video_all` d
LEFT JOIN tq_yinli_video_material m ON d.main_id = m.id
WHERE stat_time >= '2024-08-01' AND stat_time <= '2024-08-21';






SELECT 
	sum(d.ad_cost) ad_cost, sum(d.ad_show) ad_show, sum(d.ad_click) ad_click, sum(d.ad_app_activate) ad_app_activate, sum(d.ad_app_key_active) ad_app_key_active,
	sum(d.ad_cost) / sum(d.ad_show) * 1000 ad_avg_show_cost,
	sum(d.ad_click) / sum(d.ad_show) ad_click_rate,
	sum(d.ad_cost) / sum(d.ad_click) ad_avg_click_cost,
	sum(d.ad_app_activate) / sum(d.ad_click) ad_app_activate_rate,
	sum(d.ad_cost) / sum(d.ad_app_activate) ad_app_activate_cost,
	sum(d.ad_app_key_active) * 1.0 / sum(d.ad_app_activate) ad_app_key_active_rate,
	sum(d.ad_cost) / sum(d.ad_app_key_active) ad_app_key_active_cost,
	sum(d.ad_app_retention) / sum(d.ad_app_activate) ad_app_retention_rate,
	main_id, file_md5, gravity_material_id, thumbnail_url, file_url, file_name
FROM `tq_yinli_video_all` d left join tq_yinli_video_material m on d.main_id = m.id
WHERE stat_time >= '2024-08-13' and stat_time <= '2024-08-13' 
GROUP BY main_id ORDER BY ad_cost DESC;

