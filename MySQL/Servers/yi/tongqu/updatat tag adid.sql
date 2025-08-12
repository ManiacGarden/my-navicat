select a.tag a_tag, o.tag o_tag from
-- update 
tq_tcad_ad_id a
join tq_tcad_oath o on o.ad_id=a.ad_id
-- set o.tag = a.tag
where a.tag != ""