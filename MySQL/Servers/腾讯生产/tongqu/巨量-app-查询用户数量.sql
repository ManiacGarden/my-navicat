SELECT 
-- *
-- count(*)
addiction_type,
count(*)
FROM `tongqu`.`tq_ecpm_app_user`
 
WHERE
1 

-- AND DATE(update_at) = '2023-09-13'
-- AND DATE(create_at) = '2024-02-18'
-- AND `update_at` > '2023-08-08 15:03:48'

-- and create_at > '2024-06-09 00:44:35'
and date(create_at) = '2024-06-08'

-- 打螺丝达人IOS
-- and appid = '6476814061'
and clickid != ''

-- ORDER BY `update_at` DESC
-- ORDER BY `create_at` DESC
-- ORDER BY `addiction_last_login_time` DESC
-- limit 1000
GROUP BY addiction_type