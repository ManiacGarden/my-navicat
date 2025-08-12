SELECT sum(wx_cost) from wx_game_analysis_data where date >= '2025-01-01' and date < '2025-03-31';
SELECT sum(cost) from tq_tcad_ad_data_all where date_at >= '2024-01-01' and date_at < '2025-01-01';
SELECT sum(ad_consume) from tq_admin_tt_promotion where date >= '2024-01-01' and date < '2025-01-01';


SELECT sum(income) from wx_game_analysis_data where date >= '2024-01-01' and date < '2025-01-01';
SELECT sum(total_income) from tq_admin_tt_promotion where date >= '2024-01-01' and date < '2025-01-01' and ad_consume > 0;