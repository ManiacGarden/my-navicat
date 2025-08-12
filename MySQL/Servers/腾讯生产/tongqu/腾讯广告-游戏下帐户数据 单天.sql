select o.id,
       o.ad_id,
       o.tag,
       sum(d.cost)                       as cost,
       sum(d.amount)                     as amount,
       sum(d.amount_today)               as amount_today,
       sum(d.amount_today) / sum(d.cost) as roi,
       sum(d.amount) / sum(d.cost)       as roi1,
       sum(d.amount2) / sum(d.cost)      as roi2,
       sum(d.amount3) / sum(d.cost)      as roi3,
       sum(d.amount4) / sum(d.cost)      as roi4,
       sum(d.amount5) / sum(d.cost)      as roi5,
       sum(d.amount6) / sum(d.cost)      as roi6,
       sum(d.amount7) / sum(d.cost)      as roi7,
       sum(d.amount14) / sum(d.cost)     as roi14,
       sum(d.amount30) / sum(d.cost)     as roi30,
       sum(d.amount60) / sum(d.cost)     as roi60
from tq_tcad_oath o
       left join tq_tcad_ad_data_all d on o.ad_id = d.ad_id and d.date_at = '2024-07-10'
where o.app_id = 'wxe81c4bd460b9a891'
GROUP BY o.id
order by cost desc