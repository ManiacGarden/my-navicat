SELECT t.*,
       g.name                                                                                                       as app_name,
       p.total_income                                                                                               as total_income,
       p.ad_consume                                                                                                 as ad_consume,
       a.cost                                                                                                       as all_income,
       (t.income_cpa + t.income_cps + t.income_live - t.expense_cpa - t.expense_cps - t.expense_live_cpa -
        t.expense_live_cps - t.video_reward -
        t.live_reward)                                                                                              as advertiser_profit,
       (p.total_income - p.ad_consume)                                                                              as promotion_profit,
       (a.cost - p.ad_consume - t.expense_cpa - t.expense_live_cpa - t.video_reward -
        t.live_reward)                                                                                              as profit,
       (a.cost - t.income_cpa - t.income_cps - t.income_live + t.expense_cps + t.expense_live_cps -
        p.total_income)                                                                                             as no_buy_profit
from tq_tt_advert t
         left join tq_admin_tt_promotion p on t.app_id = p.app_id and t.date_time = p.date
         left join tt_game_analysis_data a on t.app_id = a.app_id and t.date_time = a.date
         join game g on g.app_id = t.app_id
where 1
  and t.app_id = 'tt898bff3616b9fb2c07'
--   and t.date_time >= '2024-10-05'
--   and t.date_time <= '2024-10-10'
-- and t.date_time = '2024-10-08'
--   and 77 member of (g.authorized_user_id->"$")
-- order by expense_cpa DESC;
order by t.date_time desc