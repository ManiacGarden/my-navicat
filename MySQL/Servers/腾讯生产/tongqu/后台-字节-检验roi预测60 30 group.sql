
 
 SELECT 
t.app_id, g.name,
count(*), sum(ad_consume),
sum(0.01779-0.10893*roi1+0.38473*roi2-0.62709*roi3+0.65099*roi4-1.22598*roi5+1.05835*roi6-0.25011*roi7-0.84494*roi15+1.92689*roi30 - roi30) / count(*) avg_increase,
roi1, roi2, roi3, roi4, roi5, roi6, roi7, roi15, roi30,
0.01779-0.10893*roi1+0.38473*roi2-0.62709*roi3+0.65099*roi4-1.22598*roi5+1.05835*roi6-0.25011*roi7-0.84494*roi15+1.92689*roi30 roi_pred60_by30,
0.01779-0.10893*roi1+0.38473*roi2-0.62709*roi3+0.65099*roi4-1.22598*roi5+1.05835*roi6-0.25011*roi7-0.84494*roi15+1.92689*roi30 - roi7 increase30
from tq_admin_tt_promotion t join game g on t.app_id = g.app_id
where 1
-- and ad_consume >= 4000
-- and app_id='tt7e1708aae127ad2f07'
-- and roi7 > 0 
-- and roi15=0
-- and roi15> 0
-- and roi30=0
and roi30 > 0
and 0.01779-0.10893*roi1+0.38473*roi2-0.62709*roi3+0.65099*roi4-1.22598*roi5+1.05835*roi6-0.25011*roi7-0.84494*roi15+1.92689*roi30 - roi30 <0
group by t.app_id
order by count(*) desc