SELECt t.app_name app_name,
       t.date date,
       t.app_id app_id,
       sum(t.total_income) total_income,
       sum(t.ad_income) ad_income,
       sum(t.order_income) order_income,
       sum(t.new_ad_income) new_ad_income,
       sum(t.new_order_income) new_order_income,
       sum(t.ad_consume) ad_consume,
       sum(t.profit) profit,
       sum(t.ad_show_pv) ad_show_pv,
       sum(t.ad_click_pv) ad_click_pv,
       sum(t.ad_consume) / sum(t.ad_click_pv) cost_per_click,
       sum(t.ad_click_pv) / sum(t.ad_show_pv) ctr_new,
       sum(t.load_success_pv) load_success_pv,
       sum(t.new_user_flow) new_user_flow,
       sum(t.active_user_flow) active_user_flow,
       sum(t.ad_consume) / sum(t.new_user_flow) cost_per_action,
       sum(t.cash_ad_play_pv) cash_ad_play_pv,
       sum(t.new_ad_income / (t.ecpm_new / 1000)) cash_ad_play_pv_new,
       sum(t.ad_income) / sum(t.cash_ad_play_pv) * 1000 ecpm,
       sum(t.stay_time_per_user * (t.new_user_flow / 1000)) / sum(t.new_user_flow) * 1000 stay_time_per_user,
       sum(t.new_ad_income) / sum(t.new_user_flow) new_arpu,
       sum(t.ad_income) / sum(t.active_user_flow) active_arpu,
       sum(t.action_cnt) action_cnt,
       sum(t.tt_new_retention_active * t.new_user) / sum(t.new_user) tt_new_retention_active,
       sum(t.retention_active * t.new_user_flow) / sum(t.new_user_flow) retention_active,
       sum(t.cash_ad_play_pv) / sum(t.active_user_flow) avg_pv_req_cnt,
       sum(t.new_ad_income / (t.ecpm_new / 1000)) / sum(t.new_user_flow) new_pv_req_cnt,
       sum(t.video_user_cnt) video_user_cnt,
       sum(t.video_count_new) video_count_new,
       sum(t.video_count_new) / sum(t.new_user) video_count_new_avg,
       sum(t.video_expose_new) video_expose_new,
       sum(t.video_expose_new) / sum(t.new_user) video_expose_new_avg,
       sum(t.new_user) new_user,
       sum(t.video_user_cnt) / sum(t.new_user) permeability,
       sum(new_ad_income) / sum(t.new_ad_income / t.ecpm_new) ecpm_new,
			 sum(CASE WHEN t.roi1 != 0 THEN ad_consume * t.roi1 ELSE 0 END) / nullif(sum(CASE WHEN t.roi1 != 0 THEN ad_consume ELSE 0 END), 0) AS roi1,
       sum(CASE WHEN t.roi2 != 0 THEN ad_consume * t.roi2 ELSE 0 END) / nullif(sum(CASE WHEN t.roi2 != 0 THEN ad_consume ELSE 0 END), 0) AS roi2,
       sum(CASE WHEN t.roi3 != 0 THEN ad_consume * t.roi3 ELSE 0 END) / nullif(sum(CASE WHEN t.roi3 != 0 THEN ad_consume ELSE 0 END), 0) AS roi3,
       sum(CASE WHEN t.roi4 != 0 THEN ad_consume * t.roi4 ELSE 0 END) / nullif(sum(CASE WHEN t.roi4 != 0 THEN ad_consume ELSE 0 END), 0) AS roi4,
       sum(CASE WHEN t.roi5 != 0 THEN ad_consume * t.roi5 ELSE 0 END) / nullif(sum(CASE WHEN t.roi5 != 0 THEN ad_consume ELSE 0 END), 0) AS roi5,
       sum(CASE WHEN t.roi6 != 0 THEN ad_consume * t.roi6 ELSE 0 END) / nullif(sum(CASE WHEN t.roi6 != 0 THEN ad_consume ELSE 0 END), 0) AS roi6,
       sum(CASE WHEN t.roi7 != 0 THEN ad_consume * t.roi7 ELSE 0 END) / nullif(sum(CASE WHEN t.roi7 != 0 THEN ad_consume ELSE 0 END), 0) AS roi7,
       sum(CASE WHEN t.roi15 != 0 THEN ad_consume * t.roi15 ELSE 0 END) / nullif(sum(CASE WHEN t.roi15 != 0 THEN ad_consume ELSE 0 END), 0) AS roi15,
       sum(CASE WHEN t.roi30 != 0 THEN ad_consume * t.roi30 ELSE 0 END) / nullif(sum(CASE WHEN t.roi30 != 0 THEN ad_consume ELSE 0 END), 0) AS roi30,
       sum(CASE WHEN t.roi60 != 0 THEN ad_consume * t.roi60 ELSE 0 END) / nullif(sum(CASE WHEN t.roi60 != 0 THEN ad_consume ELSE 0 END), 0) AS roi60
FROM tq_admin_tt_promotion t
    left join game g
on g.app_id = t.app_id
where g.promotion_flag = 2
-- 多个游戏多天
and t.date >= '2025-05-02' and t.date <= '2025-05-11' GROUP BY t.app_id order by active_user_flow desc
-- 多个游戏单天总和
-- and t.date = '2025-05-01'
-- 单个游戏多天总和
-- and t.app_id = 'tt898bff3616b9fb2c07' and t.date >= '2025-05-02' and t.date <= '2025-05-11'
-- 多个游戏多天总和
-- and t.date >= '2025-05-02' and t.date <= '2025-05-11'

-- 	and (t.app_id like select concat('%', '挪车', '%') or t.app_name like concat('%', '挪车', '%'))
-- 	and 49 member of (g.authorized_user_id->"$")
-- 	and g.outer_flag = 1
-- 	order by