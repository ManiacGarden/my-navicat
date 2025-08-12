select * from tq_ecpm_requestid 
where 1


and app_id='tte98f9f3276bb686907'
-- 拔螺丝达人
-- and `appid` = 'ttcb9cbd2154ab342c07'
-- 消螺丝
-- and app_id='tt9c1feaa2032978c807' 
-- 文字大状元
-- and app_id='tt82a7f41a1d97ab6702'
-- 消除麻将
-- and app_id = 'tta8a8de153799677e07'
-- 我挪车贼6
-- and app_id = 'tt47a6311bd897996307'
-- 我拼盘贼6
-- and app_id = 'tt80aaf6171f99813607'
-- 城堡逃生
-- and app_id = 'ttf493822e6ba2da5d07'
-- 熊猫打工记
-- and app_id = 'tt0b397d84940f8d0b07'
-- 地下英雄传
-- app_id = 'tt0e5d78e0916689c0'
and create_at > '2025-05-28 00:44:35'
-- and create_at > '2024-03-17 09:44:35'
order by id desc limit 1000 