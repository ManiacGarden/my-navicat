
select *,
       0.01379-0.31506*roi1+0.43798*roi2-1.12672*roi3-0.18598*roi4-2.04130*roi5+0.43799*roi6+3.77238*roi7 as roi_pred30,
       0.01379-0.31506*roi1+0.43798*roi2-1.12672*roi3-0.18598*roi4-2.04130*roi5+0.43799*roi6+3.77238*roi7 - roi7 as increase30
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
          MAX(CASE WHEN date_after = 14 THEN ad_roi END) AS roi15,
          MAX(CASE WHEN date_after = 29 THEN ad_roi END) AS roi30,
          MAX(CASE WHEN date_after = 59 THEN ad_roi END) AS roi60
      from tq_wx_amp_roi r
               join game g on r.app_id = g.app_id
      where 1
--       and r.app_id = 'wx14ee95fd074e909e'
-- and date_at >= '2025-04-02'
      GROUP BY r.app_id, date_at
      having max(ad_cost > 1000)
         and MAX(CASE WHEN date_after = 6 THEN ad_roi END) > 0
      order by r.app_id asc, date_at asc
     ) as roi1
order by increase30 asc