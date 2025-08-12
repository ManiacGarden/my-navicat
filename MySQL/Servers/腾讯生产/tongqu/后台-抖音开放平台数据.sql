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
		   a.cost - p.ad_consume * 0.97 - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa) + p.total_income * 0.1 + (t.income_live + t.income_cpa + t.income_cps) * 0.1 - video_reward - live_reward as real_profit,
	
	
		   -- 非买量收入
		   -- 综合利润-发行人利润-投放利润
		   (a.cost - p.ad_consume * 0.97 - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa) + p.total_income * 0.1 + (t.income_live + t.income_cpa + t.income_cps) * 0.1) - ((t.income_live + t.income_cpa + t.income_cps) - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa)) - (p.total_income - p.ad_consume) as no_buy_profit,
	
		   -- 综合利润
		   -- 流量主收入-投放实际消耗-发行人总消耗+投放广告金+发行人广告金
		   a.cost - p.ad_consume * 0.97 - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa) + p.total_income * 0.1 + (t.income_live + t.income_cpa + t.income_cps) * 0.1 as all_profit,
		   -- 利润率
				 -- 实际利润/(投放实际消耗+发行人消耗）
		   (a.cost - p.ad_consume * 0.97 - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa) + p.total_income * 0.1 + (t.income_live + t.income_cpa + t.income_cps) * 0.1 - live_reward) / (p.ad_consume * 0.97 + (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa)) as profit_rate,
	
		   -- 利润
		   -- 总广告收入-投放广告消耗-短视频cpa0.15买量费用-直播任务cpa0.09买量费用-短视频补贴-直播补贴
		   (a.cost -p.ad_consume -t.expense_cpa -t.expense_live_cpa - t.video_reward - t.live_reward) as profit,
	
		   -- 发行人总消耗
		   t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa as advertiser_cost,
		   -- 发行人总收入
		   t.income_live + t.income_cpa + t.income_cps as advertiser_income,
		   -- 发行人总利润 = 发行人总收入-发行人总消耗
		   (t.income_live + t.income_cpa + t.income_cps) - (t.expense_live_cpa + t.expense_live_cps + t.expense_cps + t.expense_cpa) as advertiser_profit,
		   -- 发行人推广激励金
		   (t.income_live + t.income_cpa + t.income_cps) * 0.1 as advertiser_encourage,
	
		   -- 直播总买量费用
		   t.expense_live_cpa + t.expense_live_cps as expense_live_all,
		   -- 直播利润
		   t.income_live - (t.expense_live_cpa + t.expense_live_cps) - t.live_reward as live_profit,
		   -- 短视频CPA利润
		   t.income_cpa - t.expense_cpa - t.video_reward as cpa_profit,
		   -- 短视频CPS利润
		   t.income_cps - t.expense_cps - t.video_reward as cps_profit	
-- 		 FROM tq_tt_advert t left join tq_admin_tt_promotion p on t.app_id = p.app_id and t.date_time = p.date left join tt_game_analysis_data a on t.app_id = a.app_id and t.date_time = a.date join game g on g.app_id = t.app_id WHERE t.app_id = 'tt32dc4461adeb4e8202' AND (t.date_time >= '2025-02-01' AND t.date_time <= '2025-02-07') ORDER BY expense_cpa DESC
		 
		 FROM tq_tt_advert t left join tq_admin_tt_promotion p on t.app_id = p.app_id and t.date_time = p.date left join tt_game_analysis_data a on t.app_id = a.app_id and t.date_time = a.date join game g on g.app_id = t.app_id WHERE t.date_time = '2025-02-14' ORDER BY expense_cpa DESC
