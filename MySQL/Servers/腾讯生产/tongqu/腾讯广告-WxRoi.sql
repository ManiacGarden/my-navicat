select r.app_id,
       r.data_date,
       r.roi1,
       r.roi2,
       r.roi3,
       r.roi4,
       r.roi5,
       r.roi6,
       r.roi7,
       r.roi8,
       r.roi9,
       r.roi10,
       r.roi11,
       r.roi12,
       r.roi13,
       r.roi14,
       r.roi15,
       r.roi30,
       r.roi60,
			 w.wx_cost,
			 w.price,
			 w.price / w.wx_cost price_rate
from tq_wx_roi r
join wx_game_analysis_data w on r.app_id = w.app_id and r.data_date = w.date
WHERE (r.app_id = 'wx8f847f037d4100a7' and r.data_date >= '2024-09-21' and r.data_date <= '2024-09-25')
order by data_date ASC;

select r.app_id,
       r.data_date,
       r.roi1,
       r.roi2,
       r.roi3,
       r.roi4,
       r.roi5,
       r.roi6,
       r.roi7,
       r.roi8,
       r.roi9,
       r.roi10,
       r.roi11,
       r.roi12,
       r.roi13,
       r.roi14,
       r.roi15,
       r.roi30,
       r.roi60,
			 w.wx_cost,
			 w.price,
			 w.price / w.wx_cost price_rate
from tq_wx_roi r
left join (select * from wx_game_analysis_data 
      WHERE app_id = 'wx8f847f037d4100a7' 
      and date >= '2024-09-21' 
      and date <= '2024-09-26') w 
on r.app_id = w.app_id and r.data_date = w.date
WHERE r.app_id = 'wx8f847f037d4100a7' 
and r.data_date >= '2024-09-21' and r.data_date <= '2024-09-26'
order by data_date ASC;
