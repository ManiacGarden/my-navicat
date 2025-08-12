SELECT *,sum(stat_cost), sum(show_cnt), sum(click_cnt)  from (
SELECT 
app_id, date_at, advertiser_id, 
sum(stat_cost) over (partition by app_id, date_at) stat_cost_app_id,
stat_cost, show_cnt, click_cnt
from tq_ecpm_wx_ad_realtime 
) a
GROUP BY app_id, advertiser_id, date_at
order by date_at desc, stat_cost_app_id desc, stat_cost desc;