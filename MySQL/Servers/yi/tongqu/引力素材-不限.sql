SELECT 
	ad_cost, ad_show, ad_click, ad_app_activate, ad_app_key_active

FROM tq_yinli_video_all
WHERE stat_time >= '2024-08-20' and stat_time <= '2024-08-20' ORDER BY ad_cost DESC
