
 
 
 
 SELECT 
date, app_id, ad_consume, roi1, roi2, roi3, roi4, roi5, roi6, roi7,
0.031 - 0.1786*roi1 + 0.0284*roi2 - 0.2163*roi3 - 0.1447*roi4 - 0.3482*roi5 - 0.9196*roi6 + 2.7351*roi7 roi_pred15_by7,
0.031 - 0.1786*roi1 + 0.0284*roi2 - 0.2163*roi3 - 0.1447*roi4 - 0.3482*roi5 - 0.9196*roi6 + 2.7351*roi7 - roi7 increase7
-- 0.1231-0.630*roi1-0.9249*roi2-0.6355*roi3+1.2593*roi4-2.4718*roi5+1.0408*roi6+1.2068*roi7+1.3480*roi15 roi_pred60_by15,
-- 0.1231-0.630*roi1-0.9249*roi2-0.6355*roi3+1.2593*roi4-2.4718*roi5+1.0408*roi6+1.2068*roi7+1.3480*roi15 - roi15 increase15
-- 0.0149-0.1009*roi1+0.3723*roi2-0.6163*roi3+0.6342*roi4-1.1831*roi5+0.9986*roi6-0.2188*roi7-0.8459*roi15+1.9289*roi30 roi_pred60_by30,
-- 0.0149-0.1009*roi1+0.3723*roi2-0.6163*roi3+0.6342*roi4-1.1831*roi5+0.9986*roi6-0.2188*roi7-0.8459*roi15+1.9289*roi30 - roi30 increase30
from tq_admin_tt_promotion 
where 1
-- and ad_consume >= 1000
-- and app_id='tt7e1708aae127ad2f07'
and roi7 > 0 
-- and roi15> 0
-- and roi30=0
-- and roi30 > 0
 order by increase7 asc