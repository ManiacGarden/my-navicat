SELECT a.app_id,
			 a.advertiser_id,
			 a.monetize_ad_income,
			 a.monetize_ad_income_d3,
			 a.monetize_ad_income_d7,
			 a.advertise_reg_uv,
			 a.advertise_total_uv,
			 a.monetize_exp_cnt_1d,
			 a.monetize_uv_d1,
			 r.stat_cost,
			 r.show_cnt,
			 r.click_cnt
from (
    SELECT app_id,
				advertiser_id,
         sum(monetize_ad_income)    monetize_ad_income,
         sum(monetize_ad_income_d3) monetize_ad_income_d3,
         sum(monetize_ad_income_d7) monetize_ad_income_d7,
         sum(advertise_reg_uv)      advertise_reg_uv,
         sum(advertise_total_uv)    advertise_total_uv,
         sum(monetize_exp_cnt_1d)   monetize_exp_cnt_1d,
         sum(monetize_uv_d1)        monetize_uv_d1
    from tq_ecpm_wx_amp
--     where date_at = '2025-08-15'
		WHERE date_at BETWEEN '2025-08-10' and '2025-08-26'
		and app_id = 'wx2bd39bc6b432744f'
    group by advertiser_id
) a
left join (
    SELECT app_id,
           advertiser_id,
           sum(stat_cost) stat_cost,
           sum(show_cnt)  show_cnt,
           sum(click_cnt) click_cnt
    from tq_ecpm_wx_ad_realtime
--     where date_at = '2025-08-15'
		WHERE date_at BETWEEN '2025-08-10' and '2025-08-26'
		and app_id = 'wx2bd39bc6b432744f'
    GROUP BY advertiser_id
) r 
on a.advertiser_id = r.advertiser_id