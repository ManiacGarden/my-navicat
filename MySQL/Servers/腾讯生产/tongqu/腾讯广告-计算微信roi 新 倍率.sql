select d.date_at date_at,
       d.app_id,
       sum(d.cost)                   cost,
			 w.price
from tq_tcad_ad_data_all d
         left join (select *
                    from wx_game_analysis_data
                    WHERE app_id = 'wx96be6a2c8e4f2400'
                      and date >= '2024-11-01'
                      and date <= '2024-11-11') w
                   on d.app_id = w.app_id and d.date_at = w.date
where d.app_id = 'wx96be6a2c8e4f2400'
  and date_at >= '2024-11-01'
  and date_at <= '2024-11-11'
group by date_at