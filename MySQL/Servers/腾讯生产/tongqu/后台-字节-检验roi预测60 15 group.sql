
 
 SELECT 
t.app_id, g.name,
count(*), sum(ad_consume),
sum(0.1210-0.1905*roi1-0.9056*roi2-0.6330*roi3+1.4664*roi4-2.5288*roi5+0.7851*roi6+1.3648*roi7+1.3646*roi15 - roi15) / count(*) avg_increase,
roi1, roi2, roi3, roi4, roi5, roi6, roi7, 
0.1210-0.1905*roi1-0.9056*roi2-0.6330*roi3+1.4664*roi4-2.5288*roi5+0.7851*roi6+1.3648*roi7+1.3646*roi15 roi_pred60_by15,
0.1210-0.1905*roi1-0.9056*roi2-0.6330*roi3+1.4664*roi4-2.5288*roi5+0.7851*roi6+1.3648*roi7+1.3646*roi15 - roi15 increase15
from tq_admin_tt_promotion t join game g on t.app_id = g.app_id
where 1
-- and ad_consume >= 4000
-- and app_id='tt7e1708aae127ad2f07'
-- and roi7 > 0 
-- and roi15=0
and roi15> 0
-- and roi30=0
-- and roi30 > 0
and 0.1210-0.1905*roi1-0.9056*roi2-0.6330*roi3+1.4664*roi4-2.5288*roi5+0.7851*roi6+1.3648*roi7+1.3646*roi15 - roi15 <0
group by t.app_id
-- order by count(*) desc
order by sum(ad_consume) desc