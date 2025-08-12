delete
-- select *
 from tq_tcad_ad_id where 
ad_id in 
(select * from (
select i.ad_id from tq_tcad_ad_id i join tq_tcad_ad_data d 
on i.ad_id=d.ad_id
where d.create_at > '2024-04-19 13:38:19' 
and d.create_at < '2024-04-19 13:48:19' 
 and d.cost=0.0
)  as d)