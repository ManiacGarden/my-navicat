SELECT appid, sum(cost) scost 
from tq_huge_data 
where create_at > '2025-03-01 00:00:00' and ad_name='全量数据' GROUP BY appid ORDER BY scost desc;

update tq_ecpm_game set is_monitor = 1 where appid in ('tt58a92e14c7a3e15707',
'tt9c12eaaf03275e7d07',
'tt9c1feaa2032978c807',
'tt1b5d6de0846afc0307',
'ttff6289df605ebec407')