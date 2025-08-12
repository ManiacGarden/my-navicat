select 
t.app_id, g.`name`, g.publish_time
from
tt_game_analysis_data t
join game g on t.app_id= g.app_id
where t.date='2024-04-01'
and t.app_id not in (
	select app_id from 
tt_game_analysis_data
where date='2024-03-31'
)
order by g.publish_time desc