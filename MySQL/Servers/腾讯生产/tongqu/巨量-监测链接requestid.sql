select 
*
-- count(*)
 from tq_ecpm_requestid 
where 1
and app_id = 'tt9c12eaaf03275e7d07'
-- and advertiserid = '1801185993725961'

-- and create_at > '2025-02-14 09:44:35'
order by id desc
limit 1000