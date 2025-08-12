SELECT 
		   t.*,
		   g.name              as app_name,
		   -- 投放广告消耗
		   p.ad_consume        as ad_consume,
		   -- 总广告收入(运营)（流量主收入）（实际收入）
		   a.cost as all_income,
		   -- 投放广告收入（分成前） 即广告收入(投放) (投放收入)
		   p.total_income as total_income,
	
		   -- 实际消耗
		   p.ad_consume * 0.97 as ad_consume_real,
		   -- 投放收入分成后
		   p.total_income * 0.9 as total_income_after,
		   -- 投放利润
		   -- 投放广告收入（分成前）-投放广告消耗
		   (p.total_income - p.ad_consume) as promotion_profit,
		   -- 投放广告金
		   p.total_income * 0.1 as promotion_ad,
	
	
		   -- 实际利润
		   -- 流量主收入-投放消耗-发行人总消耗+投放广告金+发行人广告金-短视频补贴金额-直播补贴金额
		   a.cost - p.ad_consume * 0.97 - t.expense + p.total_income * 0.1 + (t.ad_income_settle) * 0.1 - video_reward - live_reward as real_profit,
	
	
		   -- 非买量收入
		   -- 综合利润-发行人利润-投放利润
		   (a.cost - p.ad_consume * 0.97 - t.expense + p.total_income * 0.1 + t.ad_income_settle * 0.1) - (t.ad_income_settle - t.expense) - (p.total_income - p.ad_consume) as no_buy_profit,
	
		   -- 综合利润
		   -- 流量主收入-投放实际消耗-发行人总消耗+投放广告金+发行人广告金
		   a.cost - p.ad_consume * 0.97 - t.expense + p.total_income * 0.1 + t.income_live * 0.1 as all_profit,
		   -- 利润率
				 -- 实际利润/(投放实际消耗+发行人消耗）
		   (a.cost - p.ad_consume * 0.97 - t.expense + p.total_income * 0.1 + t.ad_income_settle * 0.1 - live_reward) / (p.ad_consume * 0.97 + t.expense) as profit_rate,
	
		   -- 利润
		   -- 总广告收入-投放广告消耗-短视频cpa0.15买量费用-直播任务cpa0.09买量费用-短视频补贴-直播补贴
		   (a.cost -p.ad_consume -t.expense_cpa -t.expense_live_cpa - t.video_reward - t.live_reward) as profit,
	
		   -- 发行人总消耗
		   t.expense as advertiser_cost,
		   -- 发行人总收入
		   t.ad_income_settle as advertiser_income,
		   -- 发行人总利润 = 发行人总收入-发行人总消耗
		   t.ad_income_settle - t.expense as advertiser_profit,
		   -- 发行人推广激励金
		   t.ad_income_settle * 0.1 as advertiser_encourage,
	
		   -- 直播总买量费用
		   t.expense_live as expense_live_all,
		   -- 直播利润
		   t.income_live - t.expense_live_cpa - t.live_reward as live_profit,
		   -- 短视频CPA利润
		   t.income_cpa - t.expense_cpa - t.video_reward as cpa_profit,
		   -- 短视频CPS利润
		   t.income_cps - t.expense_cps as cps_profit	
		 FROM tq_admin_tt_promotion p
		 left join (
				SELECT
					ad.app_id, ad.date_time, ad.video_reward, ad.live_reward, ad.ps,
					sum(expense) expense,
					sum(CASE WHEN bid_type = 1 THEN expense END) expense_cpa, 
					sum(CASE WHEN bid_type = 27 THEN expense END) expense_cps, 
					sum(CASE WHEN bid_type IN (28, 22, 30) THEN expense END) expense_live,
					sum(CASE WHEN bid_type = 30 THEN expense END) expense_live_cps_only, 
					sum(CASE WHEN bid_type = 22 THEN expense END) expense_live_cpa_only, 
					sum(ad_income_settle) ad_income_settle,
					sum(CASE WHEN bid_type IN (28, 22, 30) THEN ad_income_settle END) income_live,
					sum(CASE WHEN bid_type = 1 THEN ad_income_settle END) income_cpa,
					sum(CASE WHEN bid_type = 27 THEN ad_income_settle END) income_cps,
					sum(live_cpa_expense) expense_live_cpa, 
					sum(live_cps_expense) expense_live_cps
				from tq_tt_advert ad
				left join tq_tt_advert_task t on ad.app_id = t.app_id and ad.date_time = t.date_time
				WHERE t.date_time = '2025-06-25'
				GROUP BY t.app_id, t.date_time
				order by ad.app_id, ad.date_time desc
		 ) t on t.app_id = p.app_id and t.date_time = p.date 
		 left join tt_game_analysis_data a on t.app_id = a.app_id and t.date_time = a.date 
		 join game g on g.app_id = t.app_id 
		 WHERE t.date_time = '2025-06-25' ORDER BY expense_cpa DESC
