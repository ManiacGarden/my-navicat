SELECT
    r.app_id, g.name, r.date_at,
    a.predicted_income_14 predicted_income_14,
    a.predicted_income_30 predicted_income_30,
    MAX(r.ad_cost) ad_cost,
    o.pr_cost,
    o.pr_price,
    o.price_rate,
    MAX(CASE WHEN date_after = 0 THEN ad_roi END) AS roi1,
    MAX(CASE WHEN date_after = 1 THEN ad_roi END) AS roi2,
    MAX(CASE WHEN date_after = 2 THEN ad_roi END) AS roi3,
    MAX(CASE WHEN date_after = 3 THEN ad_roi END) AS roi4,
    MAX(CASE WHEN date_after = 4 THEN ad_roi END) AS roi5,
    MAX(CASE WHEN date_after = 5 THEN ad_roi END) AS roi6,
    MAX(CASE WHEN date_after = 6 THEN ad_roi END) AS roi7,
    MAX(CASE WHEN date_after = 7 THEN ad_roi END) AS roi8,
    MAX(CASE WHEN date_after = 8 THEN ad_roi END) AS roi9,
    MAX(CASE WHEN date_after = 9 THEN ad_roi END) AS roi10,
    MAX(CASE WHEN date_after = 10 THEN ad_roi END) AS roi11,
    MAX(CASE WHEN date_after = 11 THEN ad_roi END) AS roi12,
    MAX(CASE WHEN date_after = 12 THEN ad_roi END) AS roi13,
    MAX(CASE WHEN date_after = 13 THEN ad_roi END) AS roi14,
    MAX(CASE WHEN date_after = 14 THEN ad_roi END) AS roi15,
    MAX(CASE WHEN date_after = 15 THEN ad_roi END) AS roi16,
    MAX(CASE WHEN date_after = 16 THEN ad_roi END) AS roi17,
    MAX(CASE WHEN date_after = 17 THEN ad_roi END) AS roi18,
    MAX(CASE WHEN date_after = 18 THEN ad_roi END) AS roi19,
    MAX(CASE WHEN date_after = 19 THEN ad_roi END) AS roi20,
    MAX(CASE WHEN date_after = 20 THEN ad_roi END) AS roi21,
    MAX(CASE WHEN date_after = 21 THEN ad_roi END) AS roi22,
    MAX(CASE WHEN date_after = 22 THEN ad_roi END) AS roi23,
    MAX(CASE WHEN date_after = 23 THEN ad_roi END) AS roi24,
    MAX(CASE WHEN date_after = 24 THEN ad_roi END) AS roi25,
    MAX(CASE WHEN date_after = 25 THEN ad_roi END) AS roi26,
    MAX(CASE WHEN date_after = 26 THEN ad_roi END) AS roi27,
    MAX(CASE WHEN date_after = 27 THEN ad_roi END) AS roi28,
    MAX(CASE WHEN date_after = 28 THEN ad_roi END) AS roi29,
    MAX(CASE WHEN date_after = 29 THEN ad_roi END) AS roi30,
    MAX(CASE WHEN date_after = 30 THEN ad_roi END) AS roi31,
    MAX(CASE WHEN date_after = 31 THEN ad_roi END) AS roi32,
    MAX(CASE WHEN date_after = 32 THEN ad_roi END) AS roi33,
    MAX(CASE WHEN date_after = 33 THEN ad_roi END) AS roi34,
    MAX(CASE WHEN date_after = 34 THEN ad_roi END) AS roi35,
    MAX(CASE WHEN date_after = 35 THEN ad_roi END) AS roi36,
    MAX(CASE WHEN date_after = 36 THEN ad_roi END) AS roi37,
    MAX(CASE WHEN date_after = 37 THEN ad_roi END) AS roi38,
    MAX(CASE WHEN date_after = 38 THEN ad_roi END) AS roi39,
    MAX(CASE WHEN date_after = 39 THEN ad_roi END) AS roi40,
    MAX(CASE WHEN date_after = 40 THEN ad_roi END) AS roi41,
    MAX(CASE WHEN date_after = 41 THEN ad_roi END) AS roi42,
    MAX(CASE WHEN date_after = 42 THEN ad_roi END) AS roi43,
    MAX(CASE WHEN date_after = 43 THEN ad_roi END) AS roi44,
    MAX(CASE WHEN date_after = 44 THEN ad_roi END) AS roi45,
    MAX(CASE WHEN date_after = 45 THEN ad_roi END) AS roi46,
    MAX(CASE WHEN date_after = 46 THEN ad_roi END) AS roi47,
    MAX(CASE WHEN date_after = 47 THEN ad_roi END) AS roi48,
    MAX(CASE WHEN date_after = 48 THEN ad_roi END) AS roi49,
    MAX(CASE WHEN date_after = 49 THEN ad_roi END) AS roi50,
    MAX(CASE WHEN date_after = 50 THEN ad_roi END) AS roi51,
    MAX(CASE WHEN date_after = 51 THEN ad_roi END) AS roi52,
    MAX(CASE WHEN date_after = 52 THEN ad_roi END) AS roi53,
    MAX(CASE WHEN date_after = 53 THEN ad_roi END) AS roi54,
    MAX(CASE WHEN date_after = 54 THEN ad_roi END) AS roi55,
    MAX(CASE WHEN date_after = 55 THEN ad_roi END) AS roi56,
    MAX(CASE WHEN date_after = 56 THEN ad_roi END) AS roi57,
    MAX(CASE WHEN date_after = 57 THEN ad_roi END) AS roi58,
    MAX(CASE WHEN date_after = 58 THEN ad_roi END) AS roi59,
    MAX(CASE WHEN date_after = 59 THEN ad_roi END) AS roi60,
    MAX(CASE WHEN date_after = 60 THEN ad_roi END) AS roi61,
    MAX(CASE WHEN date_after = 61 THEN ad_roi END) AS roi62,
    MAX(CASE WHEN date_after = 62 THEN ad_roi END) AS roi63,
    MAX(CASE WHEN date_after = 63 THEN ad_roi END) AS roi64,
    MAX(CASE WHEN date_after = 64 THEN ad_roi END) AS roi65,
    MAX(CASE WHEN date_after = 65 THEN ad_roi END) AS roi66,
    MAX(CASE WHEN date_after = 66 THEN ad_roi END) AS roi67,
    MAX(CASE WHEN date_after = 67 THEN ad_roi END) AS roi68,
    MAX(CASE WHEN date_after = 68 THEN ad_roi END) AS roi69,
    MAX(CASE WHEN date_after = 69 THEN ad_roi END) AS roi70,
    MAX(CASE WHEN date_after = 70 THEN ad_roi END) AS roi71,
    MAX(CASE WHEN date_after = 71 THEN ad_roi END) AS roi72,
    MAX(CASE WHEN date_after = 72 THEN ad_roi END) AS roi73,
    MAX(CASE WHEN date_after = 73 THEN ad_roi END) AS roi74,
    MAX(CASE WHEN date_after = 74 THEN ad_roi END) AS roi75,
    MAX(CASE WHEN date_after = 75 THEN ad_roi END) AS roi76,
    MAX(CASE WHEN date_after = 76 THEN ad_roi END) AS roi77,
    MAX(CASE WHEN date_after = 77 THEN ad_roi END) AS roi78,
    MAX(CASE WHEN date_after = 78 THEN ad_roi END) AS roi79,
    MAX(CASE WHEN date_after = 79 THEN ad_roi END) AS roi80,
    MAX(CASE WHEN date_after = 80 THEN ad_roi END) AS roi81,
    MAX(CASE WHEN date_after = 81 THEN ad_roi END) AS roi82,
    MAX(CASE WHEN date_after = 82 THEN ad_roi END) AS roi83,
    MAX(CASE WHEN date_after = 83 THEN ad_roi END) AS roi84,
    MAX(CASE WHEN date_after = 84 THEN ad_roi END) AS roi85,
    MAX(CASE WHEN date_after = 85 THEN ad_roi END) AS roi86,
    MAX(CASE WHEN date_after = 86 THEN ad_roi END) AS roi87,
    MAX(CASE WHEN date_after = 87 THEN ad_roi END) AS roi88,
    MAX(CASE WHEN date_after = 88 THEN ad_roi END) AS roi89,
    MAX(CASE WHEN date_after = 89 THEN ad_roi END) AS roi90
from tq_wx_amp_roi r
join game g on r.app_id = g.app_id
left join tq_wx_amp a on r.app_id = a.app_id and r.date_at = a.date_at
left join (
    -- o: s1 left join d3：日期范围内的消耗、广告金、广告金比例
    -- s1: 日期范围内的消耗和广告金
    -- d3: 日期范围内的广告金比例
    select s1.date_at,
           s1.app_id,
           s1.cost,
           s1.price,
           d3_agg.pr_cost,
           d3_agg.pr_price,
           d3_agg.pr_price / NULLIF(d3_agg.pr_cost, 0) AS price_rate
    from (
             select d1.date_at   date_at,
                    d1.app_id    app_id,
                    d1.ad_cost cost,
                    w.price
             from tq_wx_amp_roi d1
             left join (
                 select * from wx_game_analysis_data WHERE app_id = 'wxd6315883ea05a29e' and date >= '2025-03-07' and date <= '2025-04-10'
             ) w on d1.app_id = w.app_id and d1.date_at = w.date
             where d1.app_id = 'wxd6315883ea05a29e' and d1.date_at >= '2025-03-07' and d1.date_at <= '2025-04-10' and d1.date_after = 0
             order by d1.date_at asc
    ) s1
    LEFT JOIN (
        SELECT
            d2.app_id,
            d2.date_at,
            SUM(d2.ad_cost) OVER (PARTITION BY d2.app_id ORDER BY d2.date_at ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS pr_cost,
            SUM(w2.price) OVER (PARTITION BY d2.app_id ORDER BY d2.date_at ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS pr_price
        FROM tq_wx_amp_roi d2
                 LEFT JOIN wx_game_analysis_data w2 ON d2.app_id = w2.app_id AND d2.date_at = w2.date
        WHERE d2.app_id = 'wxd6315883ea05a29e'
          AND d2.date_at >= '2025-03-01'
          AND d2.date_at <= '2025-04-10'
          AND d2.date_after = 0
    ) d3_agg 
    ON s1.app_id = d3_agg.app_id AND s1.date_at = d3_agg.date_at
    group by s1.date_at
) o on r.date_at = o.date_at

where 1
  and r.app_id = 'wxd6315883ea05a29e'
  and r.date_at >= '2025-03-07' and r.date_at <= '2025-04-10'
GROUP BY r.app_id, date_at
order by r.app_id asc, date_at asc
