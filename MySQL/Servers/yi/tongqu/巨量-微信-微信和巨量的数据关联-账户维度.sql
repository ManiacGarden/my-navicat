-- 1: 
-- 2: 单个游戏多天账户
-- 3: 
-- 4: 
-- 5: 单个游戏多天账户总和
-- 6: 

SELECT ta.app_id,
			 ta.advertiser_id,
			 h.manager_id,
			 h.tag,
			 ta.monetize_ad_income,
			 ta.user_total_cnt,
			 ta.user_retention_cnt,
			 ta.advertise_ad_cost,
			 r.stat_cost,
			 r.show_cnt,
			 r.click_cnt
from (
		-- 微信T+1
    SELECT app_id,
					 date_at,
					advertiser_id,
					sum(advertise_ad_cost) advertise_ad_cost,
					sum(monetize_ad_income)      monetize_ad_income,
					sum(user_total_cnt)    user_total_cnt,
					sum(user_retention_cnt) user_retention_cnt
    from tq_ecpm_wx_roi_tt_account
		where date_after = 0
-- 		manager
		and manager_id = 80
-- case 2:
		and app_id = 'wx2bd39bc6b432744f' 
		and date_at BETWEEN '2025-07-01' and '2025-08-24'
		group by advertiser_id
		order by sum(monetize_ad_income) desc
-- case 5:
-- 		and app_id = 'wx2bd39bc6b432744f' 
-- 		and date_at BETWEEN '2025-07-01' and '2025-08-24'
) ta 
left join (
		-- 巨量
    SELECT app_id,
           advertiser_id,
           sum(stat_cost) stat_cost,
           sum(show_cnt)  show_cnt,
           sum(click_cnt) click_cnt
    from tq_ecpm_wx_ad_realtime
		where 1
-- 		manager
		and manager_id = 80
-- case 2:
		and date_at BETWEEN '2025-07-01' and '2025-08-26'
		and app_id = 'wx2bd39bc6b432744f'
    GROUP BY advertiser_id
		ORDER BY sum(stat_cost) desc
-- case 5:
-- 		and date_at BETWEEN '2025-07-01' and '2025-08-26'
-- 		and app_id = 'wx2bd39bc6b432744f'
) r
-- case 2:
on ta.advertiser_id = r.advertiser_id
left join tq_ecpm_wx_hold h on ta.advertiser_id = h.advertiser_id
ORDER BY ta.advertise_ad_cost desc
-- case 5:
-- on 1
-- left join tq_ecpm_wx_hold h on 0


-- (
--     SELECT app_id,
-- 				advertiser_id,
--          sum(monetize_ad_income)    monetize_ad_income,
--          sum(monetize_ad_income_d3) monetize_ad_income_d3,
--          sum(monetize_ad_income_d7) monetize_ad_income_d7,
--          sum(advertise_reg_uv)      advertise_reg_uv,
--          sum(advertise_total_uv)    advertise_total_uv,
--          sum(monetize_exp_cnt_1d)   monetize_exp_cnt_1d,
--          sum(monetize_uv_d1)        monetize_uv_d1
--     from tq_ecpm_wx_amp
-- --     where date_at = '2025-08-15'
-- 		WHERE date_at BETWEEN '2025-08-10' and '2025-08-26'
-- 		and app_id = 'wx2bd39bc6b432744f'
--     group by advertiser_id
-- ) a


-- 			 a.monetize_ad_income,
-- 			 a.monetize_ad_income_d3,
-- 			 a.monetize_ad_income_d7,
-- 			 a.advertise_reg_uv,
-- 			 a.advertise_total_uv,
-- 			 a.monetize_exp_cnt_1d,
-- 			 a.monetize_uv_d1,