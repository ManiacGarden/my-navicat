-- SELECT * FROM `tq_ecpm_user`
-- where create_at > '2024-03-07 08:53:50' and clickid != '' and addiction_type = 4
-- order by create_at desc;

SELECT * FROM `tq_ecpm_requestid` r
join tq_ecpm_user u on r.requestid=u.requestid
where u.create_at > '2024-03-07 08:53:50' and u.clickid != '' and u.requestid != '';