SELECT 
date, app_id, ad_consume, roi1, roi2, roi3, roi4, roi5, roi6, roi7, roi15, roi30, roi60
from tq_admin_tt_promotion where 
-- date >= '2024-01-01' and ad_consume >= 1000
app_id = 'tt395d4fe0a66a0dbb07'
and roi15> 0
 order by 
 date DESC,
 ad_consume desc;
 
 