
-- 1: 单天所有游戏
-- 2: 单个游戏历史
-- 3: 多个游戏多天
-- 4: 单天游戏总和
-- 5: 单个游戏历史总和
-- 6: 多个游戏多天总和
SELECT	t.app_id,
				g.name app_name,
				t.date_at,
				t.ad_fund,
				t.income,
				ta.monetize_ad_income,	
				ta.user_total_cnt,
				ta.user_retention_cnt,
				ta.advertise_ad_cost,
				r.stat_cost,
				r.show_cnt,
				r.click_cnt
from (
	SELECT	app_id,
					date_at,
					sum(ad_fund) ad_fund,
					sum(income) income
	from tq_ecpm_wx_game_data
-- 	case 1:
-- 	where date_at = '2025-08-13' group by app_id, date_at ORDER BY income desc
	-- case 2:
where app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id, date_at ORDER BY date_at asc
-- case 3:
-- where date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id ORDER BY sum(income) desc
-- case 4:
-- where date_at = '2025-08-13' group by date_at 
-- case 5:
-- where app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id
-- case 6:
-- where date_at BETWEEN '2025-07-01' and '2025-08-31'
) t
left join game g on t.app_id = g.app_id
left join (
-- 微信后台的计划-广告表
    SELECT app_id,
						date_at,
         sum(advertise_ad_cost) advertise_ad_cost,
         sum(monetize_ad_income)      monetize_ad_income,
         sum(user_total_cnt)    user_total_cnt,
         sum(user_retention_cnt) user_retention_cnt
    from tq_ecpm_wx_roi_tt_account
		where date_after = 0
-- 		case 1:
-- 		and date_at = '2025-08-13' group by app_id, date_at
-- 		case 2:
			and app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id, date_at order by date_at asc
-- 		case 3:
-- 	 and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id order by sum(advertise_ad_cost) desc
-- 		case 4:
-- 		and date_at = '2025-08-13' group by date_at
-- 		case 5:
-- 			and app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id
-- 		case 6:
-- 	 and date_at BETWEEN '2025-07-01' and '2025-08-31'
) ta
-- case 1,2:
on t.app_id = ta.app_id and t.date_at = ta.date_at
-- case 3:
-- on t.app_id = ta.app_id
-- case 4,5,6:
-- on 1
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
where app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id, date_at order by date_at asc
-- case 3:
-- where date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id order by sum(stat_cost) desc
-- case 4:
--  where date_at = '2025-08-13' group by date_at
-- case 5:
-- where app_id = 'wx8f847f037d4100a7' and date_at BETWEEN '2025-07-01' and '2025-08-31' group by app_id
-- case 6:
-- where date_at BETWEEN '2025-07-01' and '2025-08-31'
) r
-- case1, case2:
on t.app_id = r.app_id and t.date_at = r.date_at
-- case 3:
-- on t.app_id = r.app_id
-- case 4,5,6:
-- on 1






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
-- -- where app_id = 'wx8f847f037d4100a7'
-- -- group by app_id, date_at
-- -- case 3:
-- 		where date_at BETWEEN '2025-08-10' and '2025-08-24'
-- 		group by app_id
-- ) a 
-- -- case1, case2:
-- -- on t.app_id = a.app_id and t.date_at = a.date_at
-- -- case3:
-- on t.app_id = a.app_id