SELECT date, sum(active_num) from wx_game_analysis_data GROUP BY date order by date desc;
SELECT date, sum(active_num) from tt_game_analysis_data GROUP BY date order by date desc;


SELECT year(date) year, month(date) month, sum(active_num) from wx_game_analysis_data GROUP BY year(date), month(date) order by year desc, month desc;
SELECT year(date) year, month(date) month, sum(active_num) from tt_game_analysis_data GROUP BY year(date), month(date) order by year desc, month desc;