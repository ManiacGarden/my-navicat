select * from game g
left join wx_game_analysis_data w on g.app_id=w.app_id and w.date='2024-08-06'
 where g.platform='wx' and g.promotion_flag=2 
 order by w.wx_cost desc