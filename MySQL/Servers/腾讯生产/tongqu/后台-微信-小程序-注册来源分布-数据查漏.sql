SELECT g.promotion_flag, g.outer_flag, g.`name`, w.app_id, w.active_num, max(s.user_num)
from wx_game_analysis_data w
         left join game g on w.app_id = g.app_id
         left join tq_wx_user_source s on w.app_id = s.app_id and w.date = s.date_at
where w.date = '2025-07-17'
and g.outer_flag = 1
GROUP BY w.app_id
ORDER BY w.active_num desc