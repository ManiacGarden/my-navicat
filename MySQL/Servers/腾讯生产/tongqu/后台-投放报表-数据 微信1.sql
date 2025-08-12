select
	g.app_id app_id, g.`name` app_name, '广点通' platform,
	sum(d.wx_cost) as cost, sum(d.profit) as profit, sum(d.price) as price,
	t.roi1, t.roi7, t.seven_rate,
	avg(d.active_average_duration) duration_avg,
	sum(a.exposure_count) / sum(d.active_num) as exposure_count,
	avg(case when d.new_secondary_retention_rate != 0.0 then d.new_secondary_retention_rate end) retention
from game g
         left join wx_game_analysis_data d on g.app_id = d.app_id and d.date >= '2024-07-26' and d.date <= '2024-08-01'
         left join wx_game_ad_data a on g.app_id = a.app_id and a.ad_slot_type='SLOT_ID_WEAPP_REWARD_VIDEO'and d.date = a.date
         left join (SELECT app_id,
                           sum(amount1) / sum(cost)                                               as roi1,
                           sum(case when date_at <= '2024-07-26' then amount7 end) / sum(case when date_at <= '2024-07-26' then cost end)                    as roi7,
                           (sum(case when date_at <= '2024-07-26' then amount7 end) / sum(case when date_at <= '2024-07-26' then cost end)) / (sum(amount1) / sum(cost)) as seven_rate
                    from tq_tcad_ad_data_all
                    where app_id in
                          ('wx8f847f037d4100a7', 'wx9bb6e4b6702ea612', 'wx857c0c83245274f0', 'wxe81c4bd460b9a891',
                           'wx96be6a2c8e4f2400', 'wx14ee95fd074e909e', 'wx82de65a9bd84d2d5')
                      and date_at >= '2024-07-26'
                      and date_at <= '2024-08-01'
                    group by app_id) as t on g.app_id=t.app_id
where g.app_id in
      ('wx8f847f037d4100a7', 'wx9bb6e4b6702ea612', 'wx857c0c83245274f0', 'wxe81c4bd460b9a891', 'wx96be6a2c8e4f2400',
       'wx14ee95fd074e909e', 'wx82de65a9bd84d2d5')
GROUP BY g.app_id
order by cost desc;