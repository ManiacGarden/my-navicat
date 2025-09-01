select t.id,
       t.app_id,
       t.total_num,
       t.active_num,
       t.active_times,
       t.active_average_times,
       t.active_average_duration,
       t.active_secondary_retention_rate,
       t.new_num,
       t.new_secondary_retention_rate,
       t.share_times,
       t.screen_public_times,
       t.screen_public_num,
       t.screen_public_rate,
       t.pv_click,
       t.cost,
       t.jump_inc,
       t.pv_req_cnt,
       t.pv_show,
       t.record_suc_rate,
       t.verify_status,
       g.name                                                    app_name,
       g.publish_time,
       tg.sort_no,
       tg1.sort_no                                               new_sort_no,
       wg.active_secondary_retention_rate                        ye_active_secondary_retention_rate,
       wg.new_secondary_retention_rate                           ye_new_secondary_retention_rate,
       t.date,
       tp.video_count_new / t.new_num                            video_count_new_avg,
       tp.video_expose_new / t.new_num                           video_expose_new_avg,
       tp.new_pv_req_cnt                                         new_pv_req_cnt,
       case when ts.game_id IS NOT NULL then true else false end task
from tt_game_analysis_data t
         join game g on g.app_id = t.app_id
         left join tt_game tg on tg.game_id = t.app_id and tg.date = t.date
         left join tt_game tg1 on tg1.game_id = t.app_id and tg1.date = curdate()
         left join tq_admin_tt_promotion tp on t.app_id = tp.app_id and tp.date = t.date
         left join (select app_id, active_secondary_retention_rate, new_secondary_retention_rate, date
                    from tt_game_analysis_data
                    where date = subdate('2025-08-17 00:00:00.0', interval 1 day)) wg on wg.app_id = t.app_id
         left join (SELECT date, game_id from tt_task_game where date = '2025-08-17 00:00:00.0' GROUP BY game_id) ts
                   on t.date = ts.date and t.app_id = ts.game_id
where g.deleted_flag = 0
  and t.date = '2025-08-17 00:00:00.0'
order by t.active_num desc;