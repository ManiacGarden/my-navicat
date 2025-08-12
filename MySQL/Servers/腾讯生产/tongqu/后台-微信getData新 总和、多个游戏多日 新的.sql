select w.id     id,
       w.app_id app_id,
       g.name   app_name,
       w.date date,

       sum(w.active_num) active_num,
       sum(w.active_times) active_times,
       sum(w.new_num) new_num,
       sum(w.share_num) share_num,
       sum(w.share_times) share_times,
       sum(w.income / 100) income,
       sum(w.price) price,
       sum(w.price) / sum(w.wx_cost) price_prop,
       sum(CASE
            WHEN w.date >= '2025-01-01' THEN w.price * 0.97
            WHEN w.date >= '2024-01-01' THEN w.price * 0.96
           ELSE w.price * 0.91
		   END) price_after,
	   sum(CASE
            WHEN w.date >= '2025-01-01' THEN w.price * 0.97
            WHEN w.date >= '2024-01-01' THEN w.price * 0.96
           ELSE w.price * 0.91
		   END) / sum(w.income / 100) price_prop_income,
       sum(w.first_day_price) first_day_price,
       sum(w.wx_cost) wx_cost,
			 sum(CASE
        WHEN w.date >= '2025-01-01' THEN w.wx_cost * 0.97
        WHEN w.date >= '2024-01-01' THEN w.wx_cost * 0.96
        ELSE w.wx_cost * 0.91
			 END) wx_cost_after,
       sum(w.search) search,
       sum(w.search_new) search_new,
       sum(w.search_new) / sum(w.new_num) search_new_prop,
       sum(w.ad) ad,
       sum(w.ad_new) ad_new,
       sum(w.ad_new) / sum(w.new_num) ad_new_prop,
			 -- 历史总人数，只适用于多个游戏多日
       max(g.sum_user) sum_user,
       sum(d.exposure_count) exposure_count,
         sum(d.income / 100) / sum(d.exposure_count) * 1000 ecpm,
         sum(d.exposure_count) / sum(w.active_num) ipu,
         sum(w.income / 100) / sum(w.active_num) arpu,

			 sum(w.new_from_app),
			 sum(w.new_from_chat),
			 sum(w.new_from_wxad),
			 sum(w.new_from_search),

       sum(w.active_average_times * w.active_num) / sum(w.active_num) active_average_times,
       sum(w.active_average_duration * w.active_num) / sum(w.active_num) active_average_duration,
       sum(w.active_num * w.active_secondary_retention_rate) / sum(w.active_num) active_secondary_retention_rate,
       sum(w.new_num * w.new_secondary_retention_rate) / sum(w.new_num) new_secondary_retention_rate,
       sum(w.share_times) / sum(w.share_num) share_average_times,
       sum(w.share_num) / sum(w.active_num) share_rate,
       sum(w.wx_cost) / sum(w.ad_new)              cpa,
	     sum(w.first_day_price) * 2.5 / (sum(w.wx_cost * w.roi1) * 2) first_day_price_rate,
			 sum(wg.active_num) ye_active_num,
       sum(wg.active_num * wg.active_secondary_retention_rate) / sum(wg.active_num) ye_active_secondary_retention_rate,
			 sum(wg.new_num) ye_new_num,
       sum(wg.new_num * wg.new_secondary_retention_rate) / sum(wg.new_num) ye_new_secondary_retention_rate,

     sum(t.cost) / sum(t.mini_game_register_users) cpa_new,
     sum(t.cost) / sum(t.view_count) * 1000 cpm,
     sum(t.income_pv_pla24) / sum(t.ad_paying_users_pla24) ad_pay_avg,

       gr.roi_expected_channels_moments1 roi_expected_channels_moments1,
       gr.roi_expected_channels_moments7 roi_expected_channels_moments7,
       gr.roi_expected_channels1 roi_expected_channels1,
       gr.roi_expected_channels7 roi_expected_channels7,
       gr.roi_expected_moments1 roi_expected_moments1,
       gr.roi_expected_moments7 roi_expected_moments7,

			 sum(CASE
        WHEN w.date >= '2025-01-01' THEN w.income / 100 + w.price * 0.97 - w.wx_cost * 0.97
        WHEN w.date >= '2024-01-01' THEN w.income / 100 + w.price * 0.96 - w.wx_cost * 0.96
        ELSE w.income / 100 + w.price * 0.91 - w.wx_cost * 0.91
			 END) profit,

       g.remark                        remark,
       g.subject                       subject

from wx_game_analysis_data w
    join game g
on g.app_id = w.app_id
    left join wx_game_ad_data d
    on d.app_id = w.app_id and d.date = w.date and d.ad_slot_type = 'SLOT_ID_WEAPP_REWARD_VIDEO'
    left join wx_game_ad_data d1
    on d1.app_id = w.app_id and d1.date = w.date and d1.ad_slot_type = 'ALL'
    left join wx_game_analysis_data wg
    on wg.date = subdate(w.date, interval 1 day) and wg.app_id = w.app_id
    left join (
        SELECT
        app_id,
				'sum_tag' sum_tag,
        sum(cost) cost,
        sum(view_count) view_count,
        sum(mini_game_register_users) mini_game_register_users,
        sum(income_pv_pla24) income_pv_pla24,
        sum(ad_paying_users_pla24) ad_paying_users_pla24
        from tq_tcad_ad_data_all
        -- 所有游戏多日
            where date_at >= '2025-05-01' and date_at <= '2025-05-13' group by app_id
        -- 所有游戏多日总和
--         where date_at >= '2025-05-01' and date_at <= '2025-05-13'
        -- 单日所有游戏总和
--         where date_at = '2025-04-26'
--     单个游戏多日总和
--         where date_at >= '2025-05-01' and date_at <= '2025-05-13' and app_id='wx2bd39bc6b432744f'
-- 不是总和
    ) t on w.app_id = t.app_id
-- 是总和
-- 		) t on 1 =1
    left join (
        SELECT
        app_id,
        date_at,
				'sum_tag' sum_tag,
        AVG (CASE WHEN (site = 1 or site = 2) and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels_moments1,
        AVG (CASE WHEN (site = 1 or site = 2) and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels_moments7,
        AVG (CASE WHEN site = 1 and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels1,
        AVG (CASE WHEN site = 1 and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_channels7,
        AVG (CASE WHEN site = 2 and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS roi_expected_moments1,
        AVG (CASE WHEN site = 2 and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS roi_expected_moments7
        from tq_tcad_adgroup
--         所有游戏多日
        where date_at >= '2025-05-01' and date_at <= '2025-05-13'
        GROUP BY app_id
--         -- 所有游戏多日总和
--         where date_at >= '2025-05-01' and date_at <= '2025-05-13'
        -- 单日所有游戏总和
--         where date_at = '2025-04-26'
--     单个游戏多日总和
--         where date_at >= '2025-05-01' and date_at <= '2025-05-13' and app_id='wx2bd39bc6b432744f'
-- 		不是总和
    ) gr on w.app_id = gr.app_id 
-- 是总和
-- 		) gr on 1 = 1


where 1 

-- where g.deleted_flag = 0
-- 投放
  and g.promotion_flag = 2
-- 投放权限
-- 	and 103 member of (g.authorized_user_id->"$")
-- 搜索
--   and (w.app_id like '%挪车%'
--    or g.name like '%挪车%')


-- 所有游戏多日
  and w.date >= '2025-05-01' and w.date <= '2025-05-13'
group by w.app_id
order by active_num desc
-- 所有游戏多日总和
--   and w.date >= '2025-05-01' and w.date <= '2025-05-13'
-- 单日所有游戏总和
--   and w.date = '2025-04-26'
-- 单个游戏多日总和
--   and w.date >= '2025-05-01' and w.date <= '2025-05-13'
-- 	and w.app_id='wx2bd39bc6b432744f'