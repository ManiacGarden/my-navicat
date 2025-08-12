update tt_game_analysis_data set pv_show = 0, pv_click = 0, pv_req_cnt = 0 where verify_status = 5 and date>'2023-12-01';
-- select * from tt_game_analysis_data where verify_status = 5 and date='2023-10-02' order by active_num desc;

update tt_tiktok_game_analysis_data set pv_show = 0, pv_click = 0, pv_req_cnt = 0 where verify_status = 5 and date>'2023-12-01';

update tt_game_income_data set pv_show = 0, pv_click = 0, pv_req_cnt = 0 where verify_status = 5 and date>'2023-12-01';