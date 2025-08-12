select o.id,
       o.ad_id,
       o.tag,
       sum(d.cost) as cost,
       sum(d.amount) as amount,
       sum(d.amount_today) as amount_today,
       sum(d.amount_today) / sum(d.cost) as roi,
       sum(case when d.date_at < '2024-07-22' then d.amount end) / sum(case when d.date_at < '2024-07-22' then d.cost end) as roi1,
       sum(case when d.date_at < '2024-07-21' then d.amount2 end) / sum(case when d.date_at < '2024-07-21' then d.cost end) as roi2,
       sum(case when d.date_at < '2024-07-20' then d.amount3 end) / sum(case when d.date_at < '2024-07-20' then d.cost end) as roi3,
       sum(case when d.date_at < '2024-07-19' then d.amount4 end) / sum(case when d.date_at < '2024-07-19' then d.cost end) as roi4,
       sum(case when d.date_at < '2024-07-18' then d.amount5 end) / sum(case when d.date_at < '2024-07-18' then d.cost end) as roi5,
       sum(case when d.date_at < '2024-07-17' then d.amount6 end) / sum(case when d.date_at < '2024-07-17' then d.cost end) as roi6,
       sum(case when d.date_at < '2024-07-16' then d.amount7 end) / sum(case when d.date_at < '2024-07-16' then d.cost end) as roi7,
       sum(case when d.date_at < '2024-07-15' then d.amount14 end) / sum(case when d.date_at < '2024-07-15' then d.cost end) as roi14,
       sum(case when d.date_at < '2024-07-14' then d.amount30 end) / sum(case when d.date_at < '2024-07-14' then d.cost end) as roi30,
       sum(case when d.date_at < '2024-07-13' then d.amount60 end) / sum(case when d.date_at < '2024-07-13' then d.cost end) as roi60
from tq_tcad_oath o
         left join tq_tcad_ad_data_all d on o.ad_id = d.ad_id and d.date_at BETWEEN '2024-07-09' and '2024-07-21'
where o.app_id = 'wxe81c4bd460b9a891'
GROUP BY o.id
order by cost desc;
