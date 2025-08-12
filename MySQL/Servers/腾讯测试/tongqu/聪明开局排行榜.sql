SELECT c.id, c.parent_id, c.name, r.point
FROM tq_china_area c
         left join tq_clever_rank r on c.id = r.district_id and r.platform = 1
WHERE c.parent_id = 1
order by r.point desc