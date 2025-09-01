select sum(t.active_num)                                                         active_num,
       sum(t.active_times)                                                       active_times,
       sum(t.active_average_times * t.active_num) / sum(t.active_num)            active_average_times,
       sum(t.active_average_duration * t.active_num) / sum(t.active_num)         active_average_duration,
       sum(t.active_secondary_retention_rate * t.active_num) / sum(t.active_num) active_secondary_retention_rate,
       sum(t.new_num)                                                            new_num,
       sum(t.new_secondary_retention_rate * t.new_num) / sum(t.new_num)          new_secondary_retention_rate,
       sum(t.share_times)                                                        share_times,
       sum(t.screen_public_times)                                                screen_public_times,
       sum(t.screen_public_num)                                                  screen_public_num,
       sum(t.pv_click)                                                           pv_click,
       sum(t.cost)                                                               cost,
       sum(t.jump_inc)                                                           jump_inc,
       sum(t.pv_req_cnt)                                                         pv_req_cnt,
       sum(t.pv_show)                                                            pv_show,
       sum(tp.video_count_new) / sum(t.new_num)                                  video_count_new_avg2,
			 SUM(CASE WHEN tp.video_count_new > 0 AND t.new_num > 0 THEN tp.video_count_new * t.new_num ELSE 0 END)
			 / SUM(CASE WHEN tp.video_count_new > 0 AND t.new_num > 0 THEN t.new_num ELSE 0 END) video_count_new_avg,
       sum(tp.video_expose_new) / sum(t.new_num)                                 video_expose_new_avg,
       sum(tp.new_pv_req_cnt * t.new_num) / sum(t.new_num)                       new_pv_req_cnt
from tt_game_analysis_data t
         join game g on g.app_id = t.app_id
         left join tt_game tg on tg.game_id = t.app_id and tg.date = t.date
         left join tt_game tg1 on tg1.game_id = t.app_id and tg1.date = curdate()
         left join tq_admin_tt_promotion tp on t.app_id = tp.app_id and tp.date = t.date
         left join (select app_id, active_secondary_retention_rate, new_secondary_retention_rate, date
                    from tt_game_analysis_data
                    where date = subdate('2025-08-17 00:00:00.0', interval 1 day)) wg on wg.app_id = t.app_id
where g.deleted_flag = 0
  and t.date = '2025-08-17 00:00:00.0'
order by t.active_num desc;