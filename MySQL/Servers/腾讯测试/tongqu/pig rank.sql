--  EXPLAIN
 SELECT count(*) FROM `tq_pig_rank` 
--  FORCE INDEX (platform_score) 
 WHERE `tq_pig_rank`.`platform` = 2 AND score > 1


-- SELECT * FROM `tq_pig_rank` WHERE id != 395256 AND platform = 1 AND score >= 4 AND score <= 11 LIMIT 50
