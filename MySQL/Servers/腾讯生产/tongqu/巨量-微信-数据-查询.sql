SELECT 
app_id, date_at, advertiser_id, 
sum(stat_cost), sum(show_cnt), sum(click_cnt) 
from tq_ecpm_wx_ad_realtime

where 1
and app_id = 'wx2bd39bc6b432744f'
 and date_at between '2025-08-01' and '2025-08-05'

GROUP BY app_id, advertiser_id, date_at
order by date_at desc, app_id desc, stat_cost desc;


SELECT 
app_id, date_at, advertiser_id, 
sum(stat_cost), sum(show_cnt), sum(click_cnt) 
from tq_ecpm_wx_ad_realtime

where 1
and promotion_id = '7530958717975986217'
 and date_at = '2025-07-28' 

order by date_at desc, app_id desc, stat_cost desc;
