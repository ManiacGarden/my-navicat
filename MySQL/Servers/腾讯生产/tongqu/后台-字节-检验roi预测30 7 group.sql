
 
 SELECT 
t.app_id, g.name,
count(*), sum(ad_consume),
sum(0.0895 - 0.1611*roi1 - 0.7059*roi2 - 0.0984*roi3 - 0.0464*roi4 - 0.8961*roi5 - 0.9933*roi6 + 3.7543*roi7 - roi7) / count(*) avg_increase,
roi1, roi2, roi3, roi4, roi5, roi6, roi7, 
0.0895 - 0.1611*roi1 - 0.7059*roi2 - 0.0984*roi3 - 0.0464*roi4 - 0.8961*roi5 - 0.9933*roi6 + 3.7543*roi7 roi_pred30_by7,
0.0895 - 0.1611*roi1 - 0.7059*roi2 - 0.0984*roi3 - 0.0464*roi4 - 0.8961*roi5 - 0.9933*roi6 + 3.7543*roi7 - roi7 increase7
from tq_admin_tt_promotion t join game g on t.app_id = g.app_id
where 1
-- and ad_consume >= 4000
-- and app_id='tt7e1708aae127ad2f07'
and roi7 > 0 
-- and roi15=0
-- and roi15> 0
-- and roi30=0
-- and roi30 > 0
and 0.0895 - 0.1611*roi1 - 0.7059*roi2 - 0.0984*roi3 - 0.0464*roi4 - 0.8961*roi5 - 0.9933*roi6 + 3.7543*roi7 - roi7 <0
group by t.app_id
order by count(*) desc