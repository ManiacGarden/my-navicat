select o.ad_id,
-- 			o.id,
--        o.ad_id,
--        o.tag,
-- 			 d.cost,
-- 			 d.amount2,
-- 			 d.date_at
	sum(d.amount2) / sum(d.cost) roi2
from tq_tcad_oath o
       left join tq_tcad_ad_data_all d on o.ad_id = d.ad_id and d.date_at BETWEEN '2024-07-09' and '2024-07-21'
where o.app_id = 'wxe81c4bd460b9a891'
and d.date_at <= '2024-07-20'
group by d.ad_id
ORDER BY sum(d.cost) desc