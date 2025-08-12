
select *,
       0.0121-0.2034*roi1 +0.0177*roi2 +0.0441*roi3 - 0.6764*roi4 +0.3244*roi5 +0.4946*roi6
-0.2840*roi7 -1.3192*roi8+1.3040*roi9 -0.5552*roi10-0.6894*roi11 +0.5727*roi12 -2.6683*roi3+4.6140*roi14 as roi_pred30,
       0.0121-0.2034*roi1 +0.0177*roi2 +0.0441*roi3 - 0.6764*roi4 +0.3244*roi5 +0.4946*roi6
-0.2840*roi7 -1.3192*roi8+1.3040*roi9 -0.5552*roi10-0.6894*roi11 +0.5727*roi12 -2.6683*roi3+4.6140*roi14 - roi14 as increase30
from (SELECT
          r.app_id, g.name, date_at,
          MAX(ad_cost) ad_cost,
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
          MAX(CASE WHEN date_after = 29 THEN ad_roi END) AS roi30
      from tq_wx_amp_roi r
               join game g on r.app_id = g.app_id
      where 1
--       and r.app_id = 'wx14ee95fd074e909e'
-- and date_at >= '2025-04-02'
      GROUP BY r.app_id, date_at
      having max(ad_cost > 1000)
         and MAX(CASE WHEN date_after = 13 THEN ad_roi END) > 0
      order by r.app_id asc, date_at asc
     ) as roi1
order by increase30 asc