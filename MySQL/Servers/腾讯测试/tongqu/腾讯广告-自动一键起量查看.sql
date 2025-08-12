SELECT 
s.app_id,
s.account_id,
s.adgroup_id,
s.adgroup_name,
s.auto_acquisition_budget,
GROUP_CONCAT(c.scheduled_hour) hours
 from tq_tcad_adgroup_cron c
join tq_tcad_adgroup_stats s
on c.tcad_adgroup_id = s.id
GROUP BY s.id