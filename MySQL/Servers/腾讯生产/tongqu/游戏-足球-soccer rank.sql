-- 写
-- SELECT * FROM `tq_soccer_rank` WHERE `tq_soccer_rank`.`platform` = 1 AND `tq_soccer_rank`.`openid` = '43543534' ORDER BY `tq_soccer_rank`.`id` LIMIT 1
-- INSERT INTO `tq_soccer_rank` (`platform`,`level`,`openid`,`nickname`,`icon`,`score`,`extra_data`) VALUES (1,3,'43543534','688','688',688,'')


-- 拉排行榜
-- SELECT * FROM `tq_soccer_rank` WHERE `tq_soccer_rank`.`platform` = 1 ORDER BY score DESC LIMIT 50
-- SELECT * FROM `tq_soccer_rank` WHERE `tq_soccer_rank`.`platform` = 1 AND `tq_soccer_rank`.`level` = 2 ORDER BY score DESC LIMIT 50


-- 本人排名
-- SELECT count(*) FROM `tq_soccer_rank` WHERE `tq_soccer_rank`.`platform` = 1 AND score > 555
-- explain SELECT count(*) FROM `tq_soccer_rank` WHERE `tq_soccer_rank`.`platform` = 1 AND `tq_soccer_rank`.`level` > 5 AND score > 42

SELECT count(*) FROM `tq_soccer_rank` 
WHERE 1
and`tq_soccer_rank`.`platform` = 1 
AND score > 42
AND `tq_soccer_rank`.`level` > 5