SELECT * FROM `tq_tapaway_rank` WHERE (platform = 2 OR platform = 5) AND `tq_tapaway_rank`.`province_id` = 12 ORDER BY time LIMIT 20

-- 原来的
-- SELECT * FROM `tq_tapaway_rank` WHERE `tq_tapaway_rank`.`platform` = 3 AND `tq_tapaway_rank`.`province_id` = 12 ORDER BY time LIMIT 20