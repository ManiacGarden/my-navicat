select date_at, app_id, sum(cost) cost_sum, 
sum(amount1) / sum(cost) roi1,
sum(amount2) / sum(cost) roi2,
sum(amount3) / sum(cost) roi3,
sum(amount4) / sum(cost) roi4,
sum(amount5) / sum(cost) roi5,
sum(amount6) / sum(cost) roi6,
sum(amount6) / sum(cost) roi7,
sum(amount6) / sum(cost) roi8,
sum(amount6) / sum(cost) roi9,
sum(amount6) / sum(cost) roi10,
sum(amount6) / sum(cost) roi11,
sum(amount6) / sum(cost) roi12,
sum(amount6) / sum(cost) roi13,
sum(amount6) / sum(cost) roi14,
sum(amount6) / sum(cost) roi15,
sum(amount6) / sum(cost) roi30,
sum(amount6) / sum(cost) roi60
from tq_tcad_ad_data_all
where app_id='wxe81c4bd460b9a891' 
and date_at >= '2024-10-10'
group by date_at