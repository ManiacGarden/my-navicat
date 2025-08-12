-- 一锅乱炖
SELECT * from tq_bt_user_task ut 
left join tq_bt_task t on ut.task_id = t.id
left join tq_bt_upload up on ut.id = up.user_task_id
where ut.user_id = 2;

-- 可领取任务
SELECT * from tq_bt_task t
left join tq_bt_user_task ut on t.id = ut.task_id and ut.user_id = 2
where t.start_time <= '2024-11-27 16:23:45'
and t.end_time > '2024-11-27 16:24:12'=


-- 进行中/已完成任务
SELECT * from tq_bt_user_task ut 
left join tq_bt_task t on ut.task_id = t.id
where ut.user_id = 2 
and t.start_time <= '2024-11-27 16:23:45'
and t.upload_end_time > '2024-11-27 16:24:12';

-- 进行中/已完成任务（关联查询审核）
SELECT 
-- *
t.game_name, t.task_name, t.icon, t.task_type, up.user_task_id, up.review_type, count(*) 
from tq_bt_user_task ut 
left join tq_bt_task t on ut.task_id = t.id
left join tq_bt_upload up on ut.id = up.user_task_id
where ut.user_id = 2
and t.start_time <= '2024-11-27 16:23:45'
and t.upload_end_time > '2024-11-27 16:24:12'
group by ut.id, up.review_type;



-- 用户上传的
SELECT * from tq_bt_user_task ut
left join tq_bt_upload up on ut.id = up.user_task_id
where ut.user_id = 2;