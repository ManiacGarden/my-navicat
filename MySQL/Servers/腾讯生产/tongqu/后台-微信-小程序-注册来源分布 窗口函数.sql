SELECT app_id, date_at, source, source_value, user_num
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY date_at ORDER BY user_num DESC) AS rn
  FROM tq_wx_user_source
  WHERE app_id = 'wx2bd39bc6b432744f'
    AND date_at >= '2025-07-01'
    AND date_at <= '2025-07-24'
) t
WHERE rn <= 6
ORDER BY date_at ASC, user_num DESC;
