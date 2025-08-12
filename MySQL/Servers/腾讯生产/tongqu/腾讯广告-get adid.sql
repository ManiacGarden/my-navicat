select o.id, o.ad_id ,sum(d.cost)  as cost, sum(d.amount) as amount, sum(d.amount)/sum(d.cost) as roi
from tq_tcad_oath o
left join tq_tcad_ad_data_all d on o.ad_id=d.ad_id  and d.date_at='2024-04-15'
where o.app_id='wxe81c4bd460b9a891'
GROUP BY o.id order by cost desc

-- -- 
-- select * from tq_tcad_oath o
--  where o.app_id='wxe81c4bd460b9a891'