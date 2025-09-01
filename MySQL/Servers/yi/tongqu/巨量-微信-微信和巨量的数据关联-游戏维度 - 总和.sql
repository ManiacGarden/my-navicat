SELECT	t.app_id,
				g.`name` app_name,
				r.stat_cost,
				ta.monetize_ad_income,
				ta.user_total_cnt,
				ta.user_retention_cnt,
				sum(t.ad_fund) ad_fund,
				sum(t.income) income,
				sum(r.show_cnt) show_cnt,
				sum(r.click_cnt) click_cnt
from tq_ecpm_wx_game_data t
left join (
    SELECT app_id,
						date_at,
				advertiser_id,
--          sum(advertise_ad_cost) advertise_ad_cost,
         sum(monetize_ad_income)      monetize_ad_income,
         sum(user_total_cnt)    user_total_cnt,
         sum(user_retention_cnt) user_retention_cnt
    from tq_ecpm_wx_roi_tt_account
		where date_after = 0
-- case 1:
--  and date_at = '2025-08-13'
-- case 2:
-- and app_id = 'wx8f847f037d4100a7' 
-- and date_at BETWEEN '2025-07-01' and '2025-08-24'
-- case 3:
-- 	and date_at BETWEEN '2025-07-01' and '2025-08-24'
) ta on 1
left join (
    SELECT app_id,
           date_at,
           sum(stat_cost) stat_cost,
           sum(show_cnt)  show_cnt,
           sum(click_cnt) click_cnt
    from tq_ecpm_wx_ad_realtime
-- case 1:
--  where date_at = '2025-08-13'
-- case 2:
-- where app_id = 'wx8f847f037d4100a7' 
-- and date_at BETWEEN '2025-07-01' and '2025-08-24'
-- case 3:
-- where date_at BETWEEN '2025-07-01' and '2025-08-24'
) r 
on 1
left join game g on t.app_id = g.app_id
-- case 1:
--  where t.date_at = '2025-08-13'
-- case 2:
-- where t.app_id = 'wx8f847f037d4100a7'
-- and t.date_at BETWEEN '2025-07-01' and '2025-08-24'
-- case 3:
-- where t.date_at BETWEEN '2025-07-01' and '2025-08-24'


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
-- 
-- -- case 1:
-- --  where date_at = '2025-08-13'
-- -- case 2:
-- -- where app_id = 'wx8f847f037d4100a7'
-- -- and date_at BETWEEN '2025-07-01' and '2025-08-24'
-- -- case 3:
-- where date_at BETWEEN '2025-07-01' and '2025-08-24'
-- ) a
-- -- case1, case2:
-- on t.date_at = a.date_at
-- -- case3:
-- -- on t.app_id = a.app_id