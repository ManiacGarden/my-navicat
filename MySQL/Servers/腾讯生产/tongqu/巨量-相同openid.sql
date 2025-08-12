-- explain
-- SELECT 
-- count(*)
-- FROM `tongqu`.`tq_ecpm_user`
--  
-- WHERE openid in (
	SELECT openid
	from tq_ecpm_user
	where create_at > '2024-02-17 00:00:00'
	and create_at < '2024-02-18 00:00:00'
	and `appid` = 'tt717b07c6ee48360002' 
	GROUP BY openid
	HAVING count(*) > 1
-- )
-- limit 100