SELECT app_id, date_at, date_after, sum(cost), sum(amount) from tq_tcad_ad_data_all_trace where app_id='wx8f847f037d4100a7' and date_at = '2025-04-05';




SELECT * from tq_wx_amp_roi where app_id='wx8f847f037d4100a7' and date_at = '2025-04-05' order by date_after desc;
SELECT * from tq_tcad_ad_data_all_trace where app_id='wx8f847f037d4100a7' and date_at = '2025-04-05'  order by cost desc;



-- 可以看出基本2个月后腾讯广告的收入就不再增长
SELECT * from (
	SELECT r.app_id, r.date_at, r.date_after, r.ad_cost cost_r, r.ad_income income_r, t.cost cost_t, t.amount income_t, (r.ad_income - t.amount) / t.amount 
				from tq_wx_amp_roi r
					join(SELECT app_id, date_at, date_after, sum(cost) cost, sum(amount) amount, sum(amount) / sum(cost) roi
										 FROM tq_tcad_ad_data_all_trace 
-- 										 where app_id = 'wx2bd39bc6b432744f'
										 GROUP by app_id, date_at, date_after
										 order by app_id, date_at asc, date_after asc) t
	 on r.app_id  = t.app_id and r.date_at = t.date_at and r.date_after = t.date_after
) re 
where re.cost_t > 2000
-- and app_id = 'wx2bd39bc6b432744f'
and app_id in (
'wx2bd39bc6b432744f',
'wxef3d935be4e18729',
'wx8f847f037d4100a7',
'wx5a9c314274d9c315',
'wxd6315883ea05a29e',
'wx96be6a2c8e4f2400',
'wxbf99bc03f1ef1346',
'wx75d3f555a66f69fa',
'wx9bb6e4b6702ea612',
'wx5fa85b481374e5b8'

)
order by app_id, date_at asc, date_after asc



-- 这个不太好，只选最后一天。
SELECT * from (
	SELECT r.app_id, r.date_at date_at, r.ad_cost ad_cost_r, r.ad_income income_r, at.cost ad_cost_at, at.amount income_at, (r.ad_income - at.amount) / at.amount 
	from (SELECT app_id, date_at, ad_cost, ad_income
				from (SELECT *, RANK() Over (PARTITION by app_id, date_at order by date_after desc) as rnk from tq_wx_amp_roi) t
				where t.rnk = 1) r
					  join(SELECT app_id, date_at, sum(cost) cost, sum(amount) amount
										 FROM (SELECT *,
																	RANK() OVER (PARTITION BY app_id, date_at ORDER BY date_after DESC) AS rnk
													 FROM tq_tcad_ad_data_all_trace) t
										 WHERE rnk = 1
										 GROUP by app_id, date_at
	) at
	 on r.app_id  = at.app_id and r.date_at = at.date_at 

) re
where re.ad_cost_at > 2000

and app_id in (
'wx2bd39bc6b432744f',
'wxef3d935be4e18729',
'wx8f847f037d4100a7',
'wx5a9c314274d9c315',
'wxd6315883ea05a29e',
'wx96be6a2c8e4f2400',
'wxbf99bc03f1ef1346',
'wx75d3f555a66f69fa',
'wx9bb6e4b6702ea612',
'wx5fa85b481374e5b8'

)
order by app_id, date_at asc


