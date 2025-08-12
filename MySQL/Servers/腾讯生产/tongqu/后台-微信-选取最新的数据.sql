SELECT * from wx_game_analysis_data where date > '2025-03-10' 
-- and active_num > 1000
;

SELECT * from wx_game_ad_data where date > '2025-03-10' 
-- and income > 200
;

SELECT * from tq_tcad_ad_data_all where date_at > '2025-03-10' 
-- and cost > 10
;

SELECT * from tq_wx_amp_roi where date_at > '2025-03-10'
-- and ad_cost > 10
;