select *
from tq_tcad_ad_id d
where d.ad_id not in (select ad_id
                      from tq_tcad_oath)