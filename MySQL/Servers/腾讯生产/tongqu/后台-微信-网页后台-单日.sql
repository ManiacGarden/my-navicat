select a.id,
       a.app_id                          app_id,
       a.date_at                         date_at,
       a.new_average_duration            new_average_duration,
       a.new_average_ad                  new_average_ad,
       a.ad_avg_encourage_init           ad_avg_encourage_init,
       a.ad_avg_encourage_wxad           ad_avg_encourage_wxad,
       g.name                            app_name,
       w.active_average_duration         active_average_duration,
       w.active_num                      active_num,
       d.exposure_count / w.active_num   active_average_ad,
       w.new_secondary_retention_rate    retention_new,
       r.user_retention_ratio            retention_ad,
       r.ad_cost                         ad_cost,
       a.ad_stay_time_init               ad_stay_time_init,
       a.live_income                     live_income,
       a.video_income                    video_income,
       a.predicted_income_14             predicted_income_14,
       a.predicted_income_30             predicted_income_30,
       a.predicted_income_14 / r.ad_cost predicted_roi_14,
       a.predicted_income_30 / r.ad_cost predicted_roi_30,
       r14.ad_income / r.ad_cost         roi14,
       r30.ad_income / r.ad_cost         roi30
from tq_wx_amp a
         join game g on g.app_id = a.app_id
         left join wx_game_analysis_data w on a.date_at = w.date and a.app_id = w.app_id
         left join tq_wx_amp_roi r on a.app_id = r.app_id and a.date_at = r.date_at and r.date_after = 1
         left join tq_wx_amp_roi r14 on a.app_id = r14.app_id and a.date_at = r14.date_at and r14.date_after = 13
         left join tq_wx_amp_roi r30 on a.app_id = r30.app_id and a.date_at = r30.date_at and r30.date_after = 29
         left join wx_game_ad_data d
                   on d.app_id = w.app_id and d.date = w.date and d.ad_slot_type = 'SLOT_ID_WEAPP_REWARD_VIDEO'
where g.deleted_flag = 0
-- 单日多个游戏
--   and a.date_at = '2025-05-26' order by w.active_num desc
-- 单个游戏多日
  and a.date_at >= '2025-05-26' and a.date_at <= '2025-05-29' and a.app_id = 'wx2bd39bc6b432744f'
order by a.date_at asc