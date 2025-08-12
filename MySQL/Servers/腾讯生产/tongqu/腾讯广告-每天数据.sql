select date_at,
       app_id,
       sum(cost)               cost_sum,
       sum(amount)             amount_sum,
       sum(amount) / sum(cost) roi1
from tq_tcad_ad_data_all
where 1
  and date_at >= '2024-07-01'
  and date_at <= '2024-07-09'
	and app_id = 'wx857c0c83245274f0'
group by app_id, date_at
ORDER BY date_at desc, cost_sum desc