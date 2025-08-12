select
-- g.`name`, d.date, d.roi7
	g.app_id app_id, g.`name` app_name, '巨量' platform,
	sum(d.ad_consume) as cost, sum(d.profit) as profit,
	sum(d.new_ad_income) / sum(d.ad_consume) as roi1,
	avg(case when d.roi7 != 0.0 then d.roi7 end) as roi7,
	avg(case when d.roi7 != 0.0 then d.roi7 end) / (sum(d.new_ad_income) / sum(d.ad_consume)) as seven_rate,
	avg(d.stay_time_per_user) duration_avg,
	avg(new_pv_req_cnt) as ad_avg,
	avg(case when d.retention_active != 0.0 then d.retention_active end) retention
from game g
         left join tq_admin_tt_promotion d on g.app_id = d.app_id and d.date >= '2024-07-26' and d.date <= '2024-08-01'
where g.app_id in
      ('tt7e1708aae127ad2f07', 'tt6f5e19e3f06f6f0e02', 'ttae2ed89331123a8e07', 'tt717b07c6ee48360002')
GROUP BY g.app_id
order by cost desc;