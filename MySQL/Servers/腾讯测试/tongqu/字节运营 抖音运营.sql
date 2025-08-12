select t.source, t.date, t.* from tt_tiktok_game_analysis_data t
where 1
-- and date='2024-06-09'
and date<'2024-06-01'
and app_id='ttfbbd8d006482ab7807'
order by date asc, active_num desc;

select * from tt_game_analysis_data t
where 1
-- and date>='2024-06-09'
and app_id='ttfbbd8d006482ab7807'
order by date asc, active_num desc;