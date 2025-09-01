SELECT app_id, date_at, date_after, ad_income, ad_income_inc from tq_wx_amp_roi_live where app_id='wx8f847f037d4100a7'  order by date_at desc, date_after asc;

SELECT app_id, date_at, date_after, ad_income, ad_income_inc from tq_wx_amp_roi_live where app_id='wx8f847f037d4100a7'  and date_at = '2024-07-17' order by date_at desc, date_after asc;



SELECT app_id, date_inc, sum(ad_income_inc) from (
	SELECT 
	 o.app_id,
	 o.date_at, ADDDATE(o.date_at, o.date_after) date_inc, o.date_after, 
	 o.ad_income ad_income_o, o1.ad_income ad_income_o1,
	 o.ad_income - (case when o1.ad_income is null then 0 else o1.ad_income end) ad_income_inc 
	 from tq_wx_amp_roi_live o
	left join (
		SELECT app_id, date_at, date_after, ad_income from tq_wx_amp_roi_live
		where app_id='wx8f847f037d4100a7'
	) o1 on o.date_at = o1.date_at and o1.date_after = o.date_after - 1
	where o.app_id='wx8f847f037d4100a7'
	order by 
-- 	o.date_at desc,
  ADDDATE(o.date_at, o.date_after) desc,
	o.date_after asc
) d
GROUP BY app_id, date_inc 
order by date_inc asc;


SELECT app_id, date_inc, sum(ad_income_inc) from (
    SELECT 
     o.app_id,
     o.date_at, ADDDATE(o.date_at, o.date_after) date_inc, o.date_after, 
     o.ad_income ad_income_o, o1.ad_income ad_income_o1,
     o.ad_income - (case when o1.ad_income is null then 0 else o1.ad_income end) ad_income_inc 
     from tq_wx_amp_roi_video o
    left join (
        SELECT app_id, date_at, date_after, ad_income from tq_wx_amp_roi_video
        where app_id='wx8f847f037d4100a7'
    ) o1 on o.date_at = o1.date_at and o1.date_after = o.date_after - 1
    where o.app_id='wx8f847f037d4100a7'
    order by 
--  o.date_at desc,
  ADDDATE(o.date_at, o.date_after) desc,
    o.date_after asc
) d
GROUP BY app_id, date_inc 
order by date_inc asc;
