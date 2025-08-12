SELECT *
FROM tq_tt_pull_status t1
WHERE (app_id, date_at) IN (
    SELECT app_id, date_at
    FROM tq_tt_pull_status
    GROUP BY app_id, date_at
    HAVING COUNT(*) > 1
);

DELETE t1
FROM tq_tt_pull_status t1
INNER JOIN (
    SELECT MIN(id) AS id, app_id, date_at
    FROM tq_tt_pull_status
    GROUP BY app_id, date_at
) t2
ON t1.app_id = t2.app_id AND t1.date_at = t2.date_at AND t1.id <> t2.id;