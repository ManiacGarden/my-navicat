SELECT *
FROM tq_wx_amp_roi t1
WHERE (app_id, date_at, date_after) IN (
    SELECT app_id, date_at, date_after
    FROM tq_wx_amp_roi
    GROUP BY app_id, date_at, date_after
    HAVING COUNT(*) > 1
)
and t1.app_id='wx8f847f037d4100a7' ORDER BY t1.date_at desc, t1.date_after asc;


DELETE t1
-- SELECT *
FROM tq_wx_amp_roi t1
INNER JOIN (
    SELECT min(id) as id, app_id, date_at, date_after
    FROM tq_wx_amp_roi
    GROUP BY app_id, date_at, date_after
) t2
ON t1.app_id = t2.app_id AND t1.date_at = t2.date_at and t1.date_after = t2.date_after AND t1.id <> t2.id
-- and t1.app_id='wx8f847f037d4100a7'
;
