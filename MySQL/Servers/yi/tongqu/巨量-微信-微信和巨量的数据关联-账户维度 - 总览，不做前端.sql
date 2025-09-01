SELECT ta.app_id,
			 ta.date_at,
			 ta.advertiser_id,
			 h.manager_id,
			 h.tag,
			 r.stat_cost,
			 ta.advertise_ad_cost,
			 ta.monetize_ad_income,
			 ta.user_total_cnt,
			 ta.user_retention_cnt,
			 r.show_cnt,
			 r.click_cnt
from (
-- 微信后台的计划-广告表
    SELECT app_id,
						date_at,
				advertiser_id,
         sum(advertise_ad_cost) advertise_ad_cost,
         sum(monetize_ad_income)      monetize_ad_income,
         sum(user_total_cnt)    user_total_cnt,
         sum(user_retention_cnt) user_retention_cnt
    from tq_ecpm_wx_roi_tt_account
		WHERE date_at BETWEEN '2025-07-01' and '2025-08-27'
		and app_id = 'wx2bd39bc6b432744f'
		and date_after = 0
    group by advertiser_id, date_at
		order by date_at asc, sum(advertise_ad_cost) desc
) ta
-- 巨量每小时数据
left join (
    SELECT app_id,
		date_at,
           advertiser_id,
           sum(stat_cost) stat_cost,
           sum(show_cnt)  show_cnt,
           sum(click_cnt) click_cnt
    from tq_ecpm_wx_ad_realtime
		WHERE date_at BETWEEN '2025-07-01' and '2025-08-27'
		and app_id = 'wx2bd39bc6b432744f'
    GROUP BY advertiser_id, date_at
) r
on ta.advertiser_id = r.advertiser_id and ta.date_at = r.date_at
left join tq_ecpm_wx_hold h on ta.advertiser_id = h.advertiser_id


-- where (advertise_ad_cost - stat_cost) /  stat_cost > 0.02 or (advertise_ad_cost - stat_cost) /  stat_cost < -0.02

order by ta.date_at asc, r.stat_cost desc


-- (
--     SELECT app_id,
-- 						date_at,
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
-- 		WHERE date_at BETWEEN '2025-07-01' and '2025-08-26'
-- 		and app_id = 'wx2bd39bc6b432744f'
--     group by advertiser_id, date_at
-- ) a