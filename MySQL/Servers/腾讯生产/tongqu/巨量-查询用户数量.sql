SELECT 
-- *
addiction_type,
count(*)
FROM `tongqu`.`tq_ecpm_user`
 
WHERE
1

and `appid` = 'ttb07ac6c72f4f0d0702'

-- and `appid` = 'tt715c07e1ee6bd53807' 
-- and `cid` = '1799631079389323' 

and create_at > '2025-06-16 00:00:00'
-- and create_at < '2025-06-03 00:00:00'

-- AND `clickid` != ""
-- AND (`clickid` != ""
-- or requestid != '')
-- AND `clickid` != "undefined"
-- and addiction_type = 4

-- AND `active_up_time` <> '0000-00-00 00:00:00' 

-- and requestid != ""

-- 0: 只调激活接口(包括自然量)，没调过关键行为接口；
-- 1：正常；2：已上报 3：不达标;
-- 4: requesid不匹配或无requestid(自然量)，不上报激活和关键行为
-- AND `addiction_type` = 2
-- AND `addiction_type` = 4
-- AND `addiction_type` != 0

-- and cid != ""
-- and cid='1801185993725961' 

-- ORDER BY `create_at` DESC
GROUP BY addiction_type
-- limit 1000
-- ORDER BY id desc