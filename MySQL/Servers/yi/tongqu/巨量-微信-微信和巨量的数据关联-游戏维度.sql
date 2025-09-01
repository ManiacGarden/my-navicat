
SELECT	t.app_id,
				g.`name` app_name,
				t.date_at,
				ta.monetize_ad_income,
				ta.user_total_cnt,
				ta.user_retention_cnt,
				t.ad_fund,
				t.income,
				r.stat_cost,
				r.show_cnt,
				r.click_cnt
from tq_ecpm_wx_game_data t
left join (
-- 微信后台的计划-广告表
    SELECT app_id,
						date_at,
				advertiser_id,
         sum(advertise_ad_cost) advertise_ad_cost,
         sum(monetize_ad_income)      monetize_ad_income,
         sum(user_total_cnt)    user_total_cnt,
         sum(user_retention_cnt) user_retention_cnt
    from tq_ecpm_wx_roi_tt_account
		where date_after = 0
-- 		case 1:
-- 		and date_at = '2025-08-13' group by app_id, date_at
-- 		case 2:
-- 			and app_id = 'wx2bd39bc6b432744f' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id, date_at order by date_at asc
) ta
on t.app_id = ta.app_id and t.date_at = ta.date_at
left join (
    SELECT app_id,
           date_at,
           sum(stat_cost) stat_cost,
           sum(show_cnt)  show_cnt,
           sum(click_cnt) click_cnt
    from tq_ecpm_wx_ad_realtime
-- case 1:
--  where date_at = '2025-08-13' group by app_id, date_at
-- case 2:
where app_id = 'wx2bd39bc6b432744f' and date_at BETWEEN '2025-07-01' and '2025-08-31'
group by app_id, date_at order by date_at asc
-- case 3:
-- where date_at BETWEEN '2025-08-10' and '2025-08-24' group by app_id
) r
-- case1, case2:
on t.app_id = r.app_id and t.date_at = r.date_at
-- case3:
-- on a.app_id = r.app_id

left join game g on t.app_id = g.app_id

-- case 1:
-- where t.date_at = '2025-08-13'
-- ORDER BY r.stat_cost desc
-- case 2:
where t.app_id = 'wx2bd39bc6b432744f' and t.date_at BETWEEN '2025-07-01' and '2025-08-31'
group by t.app_id, t.date_at ORDER BY t.date_at asc
-- case 3:
-- where t.date_at BETWEEN '2025-08-10' and '2025-08-24' group by t.app_id ORDER BY r.stat_cost desc






-- 				a.monetize_ad_income,
-- 				a.monetize_ad_income_d3,
-- 				a.monetize_ad_income_d7,
-- 				a.advertise_reg_uv,
-- 				a.advertise_total_uv,
-- 				a.monetize_exp_cnt_1d,
-- 				a.monetize_uv_d1,
-- left join
-- (
--     SELECT date_at,
--          app_id,
--          sum(monetize_ad_income)    monetize_ad_income,
--          sum(monetize_ad_income_d3) monetize_ad_income_d3,
--          sum(monetize_ad_income_d7) monetize_ad_income_d7,
--          sum(advertise_reg_uv)      advertise_reg_uv,
--          sum(advertise_total_uv)    advertise_total_uv,
--          sum(monetize_exp_cnt_1d)   monetize_exp_cnt_1d,
--          sum(monetize_uv_d1)        monetize_uv_d1
--     from tq_ecpm_wx_amp
-- -- case 1:
-- --  where date_at = '2025-08-13'
-- -- group by app_id, date_at
-- -- case 2:
-- -- where app_id = 'wx2bd39bc6b432744f'
-- -- group by app_id, date_at
-- -- case 3:
-- 		where date_at BETWEEN '2025-08-10' and '2025-08-24'
-- 		group by app_id
-- ) a 
-- -- case1, case2:
-- -- on t.app_id = a.app_id and t.date_at = a.date_at
-- -- case3:
-- on t.app_id = a.app_id