
update tq_ecpm_wx_hold set manager_id = '112' where tag like '%syl%';
update tq_ecpm_wx_hold set manager_id = '107' where tag like '%wzh%';
update tq_ecpm_wx_hold set manager_id = '100' where tag like '%xmm%';
update tq_ecpm_wx_hold set manager_id = '97' where tag like '%xwq%';
update tq_ecpm_wx_hold set manager_id = '96' where tag like '%ljj%';
update tq_ecpm_wx_hold set manager_id = '105' where tag like '%ftw%';
update tq_ecpm_wx_hold set manager_id = '110' where tag like '%lw%';
update tq_ecpm_wx_hold set manager_id = '82' where tag like '%cq%';


update tq_ecpm_wx_hold set manager_id = '80' where tag like '%wh%';
update tq_ecpm_wx_hold set manager_id = '94' where tag like '%whh%';

update tq_ecpm_wx_hold set manager_id = '77' where tag like '%xy%';
update tq_ecpm_wx_hold set manager_id = '69' where tag like '%zmy%';
update tq_ecpm_wx_hold set manager_id = '67' where tag like '%hsx%';
update tq_ecpm_wx_hold set manager_id = '66' where tag like '%jyt%';


update tq_ecpm_wx_roi_tt_account r join tq_ecpm_wx_hold h on r.advertiser_Id = h.advertiser_id
set r.manager_id = h.manager_id;

update tq_ecpm_wx_ad_realtime r join tq_ecpm_wx_hold h on r.advertiser_id = h.advertiser_id
set r.manager_id = h.manager_id;