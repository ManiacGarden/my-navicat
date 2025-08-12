select 
			 w.id id,
       w.app_id app_id,
       g.name                             app_name,
       w.date date,
			 
       w.active_num active_num,
       w.active_times active_times,
       w.new_num new_num,
       w.share_num share_num,
       w.share_times share_times,
       w.income / 100 income,
       w.price price,
			 w.price / w.wx_cost price_prop,
       CASE
        WHEN w.date >= '2025-01-01' THEN w.price * 0.97
        WHEN w.date >= '2024-01-01' THEN w.price * 0.96
        ELSE w.price * 0.91
			 END price_after,
			 CASE
        WHEN w.date >= '2025-01-01' THEN w.price * 0.97
        WHEN w.date >= '2024-01-01' THEN w.price * 0.96
        ELSE w.price * 0.91
			 END / (w.income / 100) price_prop_income,
       w.first_day_price first_day_price,
       w.wx_cost wx_cost,
			 CASE
        WHEN w.date >= '2025-01-01' THEN w.wx_cost * 0.97
        WHEN w.date >= '2024-01-01' THEN w.wx_cost * 0.96
        ELSE w.wx_cost * 0.91
			 END wx_cost_after,
       w.search search,
       w.search_new search_new,
       w.search_new / w.new_num search_new_prop,
       w.ad ad,
       w.ad_new ad_new,
       w.ad_new / w.new_num ad_new_prop,
       g.sum_user sum_user,
       d.exposure_count exposure_count,
			 d.exposure_count / w.active_num ipu,
			 w.income / 100 / w.active_num arpu,
			 
			 w.new_from_app,
			 w.new_from_chat,
			 w.new_from_wxad,
			 w.new_from_search,
	 
       w.active_average_times active_average_times,
       w.active_average_duration active_average_duration,
       w.active_secondary_retention_rate active_secondary_retention_rate,
       w.new_secondary_retention_rate new_secondary_retention_rate,
       w.share_average_times share_average_times,
       w.share_rate share_rate,
       w.roi1 roi1,
       w.wx_cost / w.ad_new               cpa,
			 w.first_day_price * 2.5 / (w.wx_cost * w.roi1 * 2) first_day_price_rate,
       d.e_cpm / 100 ecpm,
			 wg.active_num ye_active_num,
			 wg.new_num ye_new_num,
       wg.active_secondary_retention_rate ye_active_secondary_retention_rate,
       wg.new_secondary_retention_rate    ye_new_secondary_retention_rate,
			 
			 w.wx_cost / w.mini_game_register_users cpa_new,
			 
			 w.wx_cost / w.view_count * 1000 cpm,
			 w.ad_pay_avg ad_pay_avg,
       w.roi_expected_channels_moments1 roi_expected_channels_moments1,
       w.roi_expected_channels_moments7 roi_expected_channels_moments7,
       w.roi_expected_channels1 roi_expected_channels1,
       w.roi_expected_channels7 roi_expected_channels7,
       w.roi_expected_moments1 roi_expected_moments1,
       w.roi_expected_moments7 roi_expected_moments7,
			 
       CASE
        WHEN w.date >= '2025-01-01' THEN w.income / 100 + w.price * 0.97 - w.wx_cost * 0.97
        WHEN w.date >= '2024-01-01' THEN w.income / 100 + w.price * 0.96 - w.wx_cost * 0.96
        ELSE w.income / 100 + w.price * 0.91 - w.wx_cost * 0.91
			 END profit,
			 
       g.remark                           remark,
       g.subject                          subject
			 
from wx_game_analysis_data w
         join game g on g.app_id = w.app_id
         left join wx_game_ad_data d
                   on d.app_id = w.app_id and d.date = w.date and d.ad_slot_type = 'SLOT_ID_WEAPP_REWARD_VIDEO'
         left join wx_game_ad_data d1 on d1.app_id = w.app_id and d1.date = w.date and d1.ad_slot_type = 'ALL'
				 left join wx_game_analysis_data wg on wg.date = subdate(w.date, interval 1 day) and wg.app_id = w.app_id
-- 				 left join(
-- 						SELECT * from tq_tcad_ad_data_all 
-- 						where app_id ='wx2bd39bc6b432744f'  
-- 				 
-- 				 
-- 				 ) t on w.app_id = t.app_id and w.date = t.date_at
where g.deleted_flag = 0
-- 投放
  and g.promotion_flag = 2
-- 	投放权限
-- 	and 103 member of (g.authorized_user_id->"$")
-- 搜索
-- 	and (w.app_id like '%箭头%' or g.name like '%箭头%')
-- 单日多个游戏
--   and w.date = '2025-03-25'
-- order by active_num desc
-- 单个游戏多日
  and w.date <= '2025-04-24' and w.date >= '2025-04-21'
	and w.app_id='wx2bd39bc6b432744f'
order by w.date asc