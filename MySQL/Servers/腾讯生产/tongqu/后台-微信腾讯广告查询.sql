SELECT tc.app_id,
       g.name,
       tc.date_at,
       tc.cost,
       w.wx_cost,
       w.wx_cost / w.ad_new cpa,
       tc.cpa_new,
       tc.cpm,
       tc.ad_pay_avg
from (select t.app_id,
             t.date_at,
             sum(t.cost)                                           cost,
             sum(t.cost) / sum(t.mini_game_register_users)         cpa_new,
             sum(t.cost) / sum(t.view_count) * 1000                cpm,
             sum(t.income_pv_pla24) / sum(t.ad_paying_users_pla24) ad_pay_avg
      from tq_tcad_ad_data_all t
      where t.date_at = '2025-04-27'
      group by t.app_id, t.date_at) tc
         left join wx_game_analysis_data w on tc.app_id = w.app_id and tc.date_at = w.date
         join game g on tc.app_id = g.app_id
order by tc.cost desc;


SELECT avg(deep_conversion_worth_expected_roi)
from tq_tcad_adgroup where date_at = '2025-04-27' and app_id='wx2bd39bc6b432744f' and site = 1 and deep_conversion_worth_goal = 1;

SELECT *
from tq_tcad_adgroup where date_at = '2025-04-27' and app_id='wx2bd39bc6b432744f' and site = 1 and deep_conversion_worth_goal = 2;


SELECT
  AVG(CASE WHEN site = 1 and deep_conversion_worth_goal = 1 THEN deep_conversion_worth_expected_roi END) AS avg1,
  AVG(CASE WHEN site = 1 and deep_conversion_worth_goal = 2 THEN deep_conversion_worth_expected_roi END) AS avg2
from tq_tcad_adgroup where date_at = '2025-04-25' and app_id='wx2bd39bc6b432744f' 
