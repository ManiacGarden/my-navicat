SELECT *
FROM `tongqu`.`tt_game_analysis_data` 
WHERE 1
-- `app_id` = 'ttfbbd8d006482ab7807' 
AND 
`date` >= '2024-06-11'
-- `date` <= '2024-03-12'
-- and
-- `date` >= '2024-03-06'
order by date asc;

SELECT *
FROM `tongqu`.`tt_tiktok_game_analysis_data` 
WHERE 1
-- `app_id` = 'ttfbbd8d006482ab7807' 
AND 
`date` >= '2024-06-11'
-- `date` >= '2024-05-28'
-- AND
-- source = 1
order by date asc;


SELECT *
FROM `tongqu`.`tt_game_income_data` 
-- FROM `tongqu`.`tt_game_analysis_data` 
WHERE 1
-- `app_id` = 'ttfbbd8d006482ab7807' 
AND 
`date` >= '2024-06-11'
-- `date` < '2023-09-28'
-- and
-- `date` > '2024-04-18'
order by date asc;