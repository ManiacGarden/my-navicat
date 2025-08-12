-- 先选了，income设置为Null，因为程序判定为null才会拉取
SELECT * from wx_game_analysis_data where date='2024-08-18' order by date asc, wx_cost desc;

-- 删掉旧的
delete FROM `wx_game_ad_data` where date = '2024-08-18' 
