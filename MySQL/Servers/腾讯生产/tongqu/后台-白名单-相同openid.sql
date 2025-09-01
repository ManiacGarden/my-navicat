-- explain
-- SELECT 
-- count(*)
-- FROM `tongqu`.`tq_ecpm_user`
--  
-- WHERE
-- 1 
-- and `appid` = 'tt717b07c6ee48360002' 
-- and clickid in (
	SELECT clickid
	from tq_tcad_ad_id
	where create_at > '2024-03-29 19:55:47'
	and clickid != ''
	GROUP BY clickid
	HAVING count(*) > 1
-- )
-- limit 100