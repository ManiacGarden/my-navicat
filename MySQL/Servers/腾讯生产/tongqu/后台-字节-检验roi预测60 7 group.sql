
 
 SELECT 
t.app_id, g.name,
count(*), sum(ad_consume),
sum(0.1613 - 0.4339*roi1 - 0.7816*roi2 - 1.1059*roi3 + 1.4735*roi4 - 3.2304*roi5 - 0.5175*roi6 + 5.2596*roi7 - roi7) / count(*) avg_increase,
roi1, roi2, roi3, roi4, roi5, roi6, roi7, 
0.1613 - 0.4339*roi1 - 0.7816*roi2 - 1.1059*roi3 + 1.4735*roi4 - 3.2304*roi5 - 0.5175*roi6 + 5.2596*roi7 roi_pred60_by7,
0.1613 - 0.4339*roi1 - 0.7816*roi2 - 1.1059*roi3 + 1.4735*roi4 - 3.2304*roi5 - 0.5175*roi6 + 5.2596*roi7 - roi7 increase7
from tq_admin_tt_promotion t join game g on t.app_id = g.app_id
where 1
-- and ad_consume >= 4000
-- and app_id='tt7e1708aae127ad2f07'
and roi7 > 0 
-- and roi15=0
-- and roi15> 0
-- and roi30=0
-- and roi30 > 0
and 0.1613 - 0.4339*roi1 - 0.7816*roi2 - 1.1059*roi3 + 1.4735*roi4 - 3.2304*roi5 - 0.5175*roi6 + 5.2596*roi7 - roi7 <0
group by t.app_id
order by count(*) desc