select o.id,
       o.ad_id,
       o.tag,
       sum(d.cost)                       as cost,
       sum(d.amount1)                     as amount1,
       sum(d.amount_today)               as amount_today,
       sum(d.amount_today) / sum(d.cost) as roi,
       sum(d.amount7) / sum(d.cost)      as roi7
from tq_tcad_oath o
       left join tq_tcad_ad_data_all d on o.ad_id = d.ad_id and d.date_at BETWEEN '2024-07-26' and '2024-08-02'
where o.app_id = 'wxe81c4bd460b9a891'
-- and d.date_at <= '2024-07-27'
-- GROUP BY o.id
order by cost desc