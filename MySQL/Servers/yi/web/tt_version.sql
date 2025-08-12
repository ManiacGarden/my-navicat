select * from tq_admin_tt_promotion t
join game g on t.app_id=g.app_id
where g.platform='tt'
and t.date = '2024-03-24'
and g.tt_version = 2