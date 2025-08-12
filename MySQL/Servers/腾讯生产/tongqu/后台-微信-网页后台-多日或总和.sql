select a.id,
       a.app_id                          app_id,
       a.date_at                         date_at,
       sum(w.new_num * a.new_average_duration) / sum(w.new_num)            new_average_duration,
       sum(w.new_num * a.new_average_ad) / sum(w.new_num)            new_average_ad,
--        a.ad_avg_encourage_init           ad_avg_encourage_init,
--        a.ad_avg_encourage_wxad           ad_avg_encourage_wxad,
       g.name                            app_name,
       sum(w.active_num * w.active_average_duration) / sum(w.active_num)         active_average_duration,
			 sum(w.active_num) active_num,
       sum(d.exposure_count) / sum(w.active_num)   active_average_ad,
        sum(w.new_num * w.new_secondary_retention_rate) / sum(w.new_num)    retention_new,
       sum(r.user_reg_cnt * r.user_retention_ratio) / sum(r.user_reg_cnt)            retention_ad,
       sum(r.ad_cost)                         ad_cost,
--        a.ad_stay_time_init               ad_stay_time_init,
       sum(a.live_income)                     live_income,
       sum(a.video_income)                    video_income
--        a.predicted_income_14             predicted_income_14,
--        a.predicted_income_30             predicted_income_30,
--        a.predicted_income_14 / r.ad_cost predicted_roi_14,
--        a.predicted_income_30 / r.ad_cost predicted_roi_30,
--        r14.ad_income / r.ad_cost         roi14,
--        r30.ad_income / r.ad_cost         roi30
from tq_wx_amp a
         join game g on g.app_id = a.app_id
         left join wx_game_analysis_data w on a.date_at = w.date and a.app_id = w.app_id
         left join tq_wx_amp_roi r on a.app_id = r.app_id and a.date_at = r.date_at and r.date_after = 1
         left join tq_wx_amp_roi r14 on a.app_id = r14.app_id and a.date_at = r14.date_at and r14.date_after = 13
         left join tq_wx_amp_roi r30 on a.app_id = r30.app_id and a.date_at = r30.date_at and r30.date_after = 29
         left join wx_game_ad_data d
                   on d.app_id = w.app_id and d.date = w.date and d.ad_slot_type = 'SLOT_ID_WEAPP_REWARD_VIDEO'
where g.deleted_flag = 0
-- 多个游戏多天
  and a.date_at >= '2025-05-02'
  and a.date_at <= '2025-05-29'
GROUP BY a.app_id
order by active_num desc
-- 多个游戏单天总和
-- and a.date_at = '2025-05-01'
-- 单个游戏多天总和
-- and a.app_id = 'tt898bff3616b9fb2c07' and a.date_at >= '2025-05-02' and a.date_at <= '2025-05-11'
-- 多个游戏多天总和
-- and a.date_at >= '2025-05-02' and a.date_at <= '2025-05-11'