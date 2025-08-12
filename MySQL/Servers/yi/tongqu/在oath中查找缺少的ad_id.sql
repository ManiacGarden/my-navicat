insert into tq_tcad_ad_id
    (app_id, app_name, ad_id, tag)
select o.app_id, g.name, o.ad_id, o.tag
from tq_tcad_oath o
         join game g on o.app_id = g.app_id
where o.create_at > '2024-05-02 17:40:35'
order by o.create_at desc