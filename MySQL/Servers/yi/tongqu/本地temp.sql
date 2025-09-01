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
		and date_at = '2025-08-13'
-- 		case 2:
-- 		and date_at BETWEEN '2025-07-01' and '2025-08-27' and app_id = 'wx2bd39bc6b432744f'
-- 		case 3:
-- 		and date_at BETWEEN '2025-07-01' and '2025-08-27'
		
    group by app_id, date_at
		order by date_at asc, sum(advertise_ad_cost) desc