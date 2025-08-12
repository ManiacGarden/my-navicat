SELECT

    t1.date_at, t1.app_id, t1.ad_cost,
    t1.ad_roi roi1,
    t2.ad_roi roi2,
    t3.ad_roi roi3,
    t4.ad_roi roi4,
    t5.ad_roi roi5,
    t6.ad_roi roi6,
    t7.ad_roi roi7,
    t15.ad_roi roi15,
		0.0099-0.2227*t1.ad_roi+0.0790*t2.ad_roi+0.1091*t3.ad_roi-0.6663*t4.ad_roi-0.4047*t5.ad_roi-0.8569*t6.ad_roi+2.9262*t7.ad_roi roi_pred15,
    t30.ad_roi roi30,
		0.0182-0.3919*t1.ad_roi+0.0398*t2.ad_roi+0.5146*t3.ad_roi-2.2432*t4.ad_roi+0.5684*t5.ad_roi-2.7562*t6.ad_roi+5.2034*t7.ad_roi roi_pred30
from tq_wx_amp_roi t1
         left join  tq_wx_amp_roi t2 on t1.app_id = t2.app_id and t1.date_at = t2.date_at and t2.date_after = 1
         left join  tq_wx_amp_roi t3 on t1.app_id = t3.app_id and t1.date_at = t3.date_at and t3.date_after = 2
         left join  tq_wx_amp_roi t4 on t1.app_id = t4.app_id and t1.date_at = t4.date_at and t4.date_after = 3
         left join  tq_wx_amp_roi t5 on t1.app_id = t5.app_id and t1.date_at = t5.date_at and t5.date_after = 4
         left join  tq_wx_amp_roi t6 on t1.app_id = t6.app_id and t1.date_at = t6.date_at and t6.date_after = 5
         left join  tq_wx_amp_roi t7 on t1.app_id = t7.app_id and t1.date_at = t7.date_at and t7.date_after = 6
         left join  tq_wx_amp_roi t15 on t1.app_id = t15.app_id and t1.date_at = t15.date_at and t15.date_after = 14
         left join  tq_wx_amp_roi t30 on t1.app_id = t30.app_id and t1.date_at = t30.date_at and t30.date_after = 29

where t1.date_at >= '2025-01-01' and t1.date_after = 0 
-- and t1.app_id = 'wxef3d935be4e18729'
and concat(t1.app_id,t1.date_at) in (
	SELECT concat(app_id,date) from wx_game_analysis_data where date >= '2024-01-01' and wx_cost > 1000 and t1.ad_cost> 1000
)
and t30.ad_roi != 0
order by 
-- date_at desc
 ad_cost desc