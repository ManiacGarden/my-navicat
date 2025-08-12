SELECT 
*
-- count(*)
-- addiction_type, count(addiction_type)
-- delete
FROM `tongqu`.`tq_ecpm_ks_user`
 
WHERE
1
-- 箭头消消消
-- and `app_id` = 'ks714102016864449953' 
-- 打螺丝达人
-- and `app_id` = 'ks673569620576487020' 
-- 救救猪猪
-- and `app_id` = 'ks664843898342403225' 
-- 全民足球射手
-- and `app_id` = 'ks662592097999387049' 
-- 汉字热梗王
-- and `app_id` = 'ks672443720723561147' 
-- 爆笑玩梗
-- and `app_id` = 'ks701154168568479909'
-- 打螺丝王者
-- and `app_id` = 'ks705939245019290418'
-- 打个螺丝儿
-- and `app_id` = 'ks680606496323695917'
-- 打螺丝大师
-- and `app_id` = 'ks694680246751023725'
-- 进击的大鹅
-- and `app_id` = 'ks656681123403658807'
-- 我挪车贼6
-- and `app_id` = 'ks684828618903801091'
-- 箭头大作战
and `app_id` = 'ks650770148682787273'


-- AND DATE(update_at) = '2023-09-13'
-- AND DATE(create_at) = '2024-12-12'
-- AND `update_at` > '2024-06-20 09:32:40'
-- AND `create_at` > '2024-06-20 09:27:50'
-- AND `create_at` < '2023-10-28 00:00:00'
-- AND `active_up_time` <> '0000-00-00 00:00:00' 

-- AND `callback` != ""
-- 1：正常；2：已上报 3：不达标
-- AND `addiction_type` = 2
-- AND `addiction_type` != 0
-- AND `ipu` >= 5

-- and clickid != 'undefined'

-- ORDER BY `update_at` DESC
-- ORDER BY `addiction_last_login_time` DESC
-- limit 1000
-- group by addiction_type