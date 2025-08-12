select t.date_at,
       t.app_id,
       sum(t.cost)               T_cost_sum,
			 wx_cost W_cost,
       sum(t.amount)             T_amount_sum,
       sum(t.amount) / sum(t.cost) T_roi1,
			 w.roi1 W_roi1
from tq_tcad_ad_data_all t
join wx_game_analysis_data w on t.app_id=w.app_id and t.date_at=w.date
where 1
  and t.date_at = '2024-07-03'
--   and date_at <= '2024-07-09'
-- 	and app_id = 'wx857c0c83245274f0'
-- 
-- and  
-- (
--   (amount < amount2 or amount2 = 0 or amount2 is null) and
--   (amount < amount3 or amount3 = 0 or amount3 is null) and
--   (amount < amount4 or amount4 = 0 or amount4 is null) and
--   (amount < amount5 or amount5 = 0 or amount5 is null) and
--   (amount < amount6 or amount6 = 0 or amount6 is null) and
--   (amount < amount7 or amount7 = 0 or amount7 is null)
-- )


group by t.app_id, t.date_at
ORDER BY t.date_at desc, T_cost_sum desc