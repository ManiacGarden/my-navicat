select w.id     id,
       w.app_id app_id,
       g.name   app_name,
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
       r.roi1 roi1,  
       r.roi3 roi3,  
       r.roi7 roi7,  
       w.wx_cost / w.ad_new               cpa,
	   w.first_day_price * 2.5 / (w.wx_cost * w.roi1 * 2) first_day_price_rate,
       d.e_cpm / 100 ecpm,
	   wg.active_num ye_active_num,
	   wg.new_num ye_new_num,
       wg.active_secondary_retention_rate ye_active_secondary_retention_rate,
       wg.new_secondary_retention_rate    ye_new_secondary_retention_rate,

			 t.cost / t.mini_game_register_users cpa_new,
			 t.cost / t.view_count * 1000 cpm,
			 t.income_pv_pla24 / t.ad_paying_users_pla24 ad_pay_avg,

       gr.roi_expected_channels_moments1 roi_expected_channels_moments1,
       gr.roi_expected_channels_moments7 roi_expected_channels_moments7,
       gr.roi_expected_channels1 roi_expected_channels1,
       gr.roi_expected_channels7 roi_expected_channels7,
       gr.roi_expected_moments1 roi_expected_moments1,
       gr.roi_expected_moments7 roi_expected_moments7,

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
         left join(
            SELECT
            app_id,
            date_at,
            sum(cost) cost,
            sum(view_count) view_count,
            sum(mini_game_register_users) mini_game_register_users,
            sum(income_pv_pla24) income_pv_pla24,
            sum(ad_paying_users_pla24) ad_paying_users_pla24
             from tq_tcad_ad_data_all
            -- 单日多个游戏
            where date_at = '2025-04-25' GROUP BY app_id, date_at
             -- 单个游戏多日
--             where app_id ='wx2bd39bc6b432744f' and date_at >= '2025-04-25' and date_at <= '2025-04-26' GROUP BY date_at, app_id
         ) t on w.app_id = t.app_id and w.date = t.date_at
         left join (
            SELECT
            app_id,
            date_at,
            AVG(CASE WHEN (site = 1 or site = 2) and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels_moments1,
            AVG(CASE WHEN (site = 1 or site = 2) and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels_moments7,
            AVG(CASE WHEN site = 1 and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels1,
            AVG(CASE WHEN site = 1 and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels7,
            AVG(CASE WHEN site = 2 and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_moments1,
            AVG(CASE WHEN site = 2 and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_moments7
            from tq_tcad_adgroup
            -- 单日多个游戏
            where date_at = '2025-04-25'  GROUP BY app_id, date_at
             -- 单个游戏多日
--             where app_id ='wx2bd39bc6b432744f' and date_at >= '2025-04-25' and date_at <= '2025-04-26' GROUP BY date_at, app_id
         ) gr on w.app_id = gr.app_id and w.date = gr.date_at
	    left join (
              SELECT
                app_id, date_at,
                MAX(ad_cost) ad_cost,
                MAX(CASE WHEN date_after = 0 THEN ad_roi END) AS roi1,
                MAX(CASE WHEN date_after = 2 THEN ad_roi END) AS roi3,
                MAX(CASE WHEN date_after = 6 THEN ad_roi END) AS roi7,
								ad_cost * MAX(CASE WHEN date_after = 0 THEN ad_roi END) AS income1,
                ad_cost * MAX(CASE WHEN date_after = 2 THEN ad_roi END) AS income3,
                ad_cost * MAX(CASE WHEN date_after = 6 THEN ad_roi END) AS income7
            from tq_wx_amp_roi
					-- 单日多个游戏
					where date_at = '2025-04-25' GROUP BY app_id, date_at
-- 					 单个游戏多日
--             where app_id ='wx2bd39bc6b432744f' and date_at >= '2025-04-25' and date_at <= '2025-04-26' GROUP BY date_at, app_id
						-- 单日多个游戏
	    ) r on w.app_id = r.app_id and w.date = r.date_at
where g.deleted_flag = 0
-- 投放
  and g.promotion_flag = 2
-- 	投放权限
-- 	and 103 member of (g.authorized_user_id->"$")
-- 搜索
-- 	and (w.app_id like '%箭头%' or g.name like '%箭头%')
-- 单日多个游戏
  and w.date = '2025-04-25' order by w.active_num desc
-- 单个游戏多日
--   and w.date >= '2025-04-25' and w.date <= '2025-04-26'  and w.app_id='wx2bd39bc6b432744f'
--   order by w.date asc