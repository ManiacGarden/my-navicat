SELECT t.app_name app_name,
       t.date date,
       t.app_id app_id,
       t.total_income total_income,
       t.ad_income ad_income,
       t.order_income order_income,
       t.new_ad_income new_ad_income,
       t.new_order_income new_order_income,
       t.ad_consume ad_consume,
       t.profit profit,
       t.ad_show_pv ad_show_pv,
       t.ad_click_pv ad_click_pv,
       t.ad_consume / t.ad_click_pv cost_per_click,
       t.ad_click_pv / t.ad_show_pv ctr_new,
       t.load_success_pv load_success_pv,
       t.new_user_flow new_user_flow,
       t.active_user_flow active_user_flow,
       t.ad_consume / t.new_user_flow cost_per_action,
       t.cash_ad_play_pv cash_ad_play_pv,
       t.new_ad_income / (t.ecpm_new / 1000) cash_ad_play_pv_new,
       t.ad_income / t.cash_ad_play_pv * 1000 ecpm,
       t.stay_time_per_user stay_time_per_user,
       t.new_ad_income / t.new_user_flow new_arpu,
       t.ad_income / t.active_user_flow active_arpu,
       t.action_cnt action_cnt,
       t.tt_new_retention_active tt_new_retention_active,
       t.retention_active retention_active,
       t.cash_ad_play_pv / t.active_user_flow avg_pv_req_cnt,
       t.new_ad_income / (t.ecpm_new / 1000) / t.new_user_flow new_pv_req_cnt,
       t.video_user_cnt video_user_cnt,
       t.video_count_new video_count_new,
       t.video_count_new / t.new_user video_count_new_avg,
       t.video_expose_new video_expose_new,
       t.video_expose_new / t.new_user video_expose_new_avg,
       t.new_user new_user,
       t.video_user_cnt / t.new_user permeability,
       t.ecpm_new ecpm_new,
       t.roi1 roi1,
       t.roi2 roi2,
       t.roi3 roi3,
       t.roi4 roi4,
       t.roi5 roi5,
       t.roi6 roi6,
       t.roi7 roi7,
       t.roi15 roi15,
       t.roi30 roi30,
       t.roi60 roi60
FROM tq_admin_tt_promotion t
    left join game g
on g.app_id = t.app_id
where g.promotion_flag = 2
-- 多个游戏单天
-- and t.date = '2025-05-06'
-- order by t.active_user_flow desc
-- 单个游戏多天
and t.app_id = 'tt898bff3616b9fb2c07' and t.date >= '2025-05-02' and t.date <= '2025-05-11'
order by t.date asc
-- 	and (t.app_id like select concat('%', '挪车', '%') or t.app_name like concat('%', '挪车', '%'))
-- 	and 49 member of (g.authorized_user_id->"$")
-- 	and g.outer_flag = 1
-- 	order by