select 
g.* 
from game g
join tq_admin_tt_promotion t on g.app_id=t.app_id
where t.date='2024-05-15' and g.promotion_flag = 2
order by t.active_user_flow DESC
limit 15
