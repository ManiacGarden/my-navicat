-- select w.app_id, t.roi1 t_roi1, w.roi1 w_roi1, w.date
-- from tq_wx_roi t
UPDATE tq_wx_roi t
JOIN wx_game_analysis_data w ON w.app_id = t.app_id AND w.date = t.data_date
SET t.roi1 = w.roi1
where w.roi1 != 0.0 and t.roi1 = 0.0
and t.data_date > '2024-02-20';

