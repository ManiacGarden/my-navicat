select d.date_at date_at,
       d.app_id,
       sum(d.amount1) / sum(d.cost)  roi1,
       sum(d.amount2) / sum(d.cost)  roi2,
       sum(d.amount3) / sum(d.cost)  roi3,
       sum(d.amount4) / sum(d.cost)  roi4,
       sum(d.amount5) / sum(d.cost)  roi5,
       sum(d.amount6) / sum(d.cost)  roi6,
       sum(d.amount7) / sum(d.cost)  roi7,
       sum(d.amount8) / sum(d.cost)  roi8,
       sum(d.amount9) / sum(d.cost)  roi9,
       sum(d.amount10) / sum(d.cost) roi10,
       sum(d.amount11) / sum(d.cost) roi11,
       sum(d.amount12) / sum(d.cost) roi12,
       sum(d.amount13) / sum(d.cost) roi13,
       sum(d.amount14) / sum(d.cost) roi14,
       sum(d.amount15) / sum(d.cost) roi15,
       sum(d.amount30) / sum(d.cost) roi30,
       sum(d.amount60) / sum(d.cost) roi60,
       sum(d.cost)                   cost_sum,
       w.wx_cost,
       w.price,
       w.price / sum(d.cost)         price_rate
from tq_tcad_ad_data_all d
         left join (select *
                    from wx_game_analysis_data
                    WHERE app_id = 'wx96be6a2c8e4f2400'
                      and date >= '2024-10-01'
                      and date <= '2024-11-04') w
                   on d.app_id = w.app_id and d.date_at = w.date
where d.app_id = 'wx96be6a2c8e4f2400'
  and date_at >= '2024-10-01'
  and date_at <= '2024-11-04'
group by date_at