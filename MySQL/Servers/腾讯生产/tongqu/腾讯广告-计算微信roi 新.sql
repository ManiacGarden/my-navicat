select date_at,
       app_id,
       sum(amount1) / sum(cost)  roi1,
       sum(amount2) / sum(cost)  roi2,
       sum(amount3) / sum(cost)  roi3,
       sum(amount4) / sum(cost)  roi4,
       sum(amount5) / sum(cost)  roi5,
       sum(amount6) / sum(cost)  roi6,
       sum(amount7) / sum(cost)  roi7,
       sum(amount8) / sum(cost)  roi8,
       sum(amount9) / sum(cost)  roi9,
       sum(amount10) / sum(cost) roi10,
       sum(amount11) / sum(cost) roi11,
       sum(amount12) / sum(cost) roi12,
       sum(amount13) / sum(cost) roi13,
       sum(amount14) / sum(cost) roi14,
       sum(amount15) / sum(cost) roi15,
       sum(amount20) / sum(cost) roi20,
       sum(amount25) / sum(cost) roi25,
       sum(amount30) / sum(cost) roi30,
       sum(amount45) / sum(cost) roi45,
       sum(amount60) / sum(cost) roi60
from tq_tcad_ad_data_all
where app_id = 'wx96be6a2c8e4f2400'
  and date_at >= '2024-11-07'
  and date_at <= '2024-11-11'
group by date_at
ORDER BY date_at asc