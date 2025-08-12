
select * from tq_tcad_ad_id where ad_id in (
	SELECT ad_id
	from tq_tcad_ad_id
	GROUP BY ad_id
	HAVING count(*) > 1
) order by ad_id