SELECT 
-- 	*
	u.id user_id, 
	u.openid openid,
	u.nick_name nick_name,
	b.card_num card_num,
	b.user_name bank_name,
	ut.id user_task_id,
	t.id task_id, t.task_name task_name,
-- 	up.payment_amount payment_amount
	sum(up.payment_amount) payment_amount_sum
from tq_bt_upload up 
left join tq_bt_user u on u.id = up.user_id
left join tq_bt_bank b on up.bank_id = b.id
left join tq_bt_task t on up.task_id = t.id
left join tq_bt_user_task ut on up.user_task_id = ut.id
where 
up.payment_type = 1
-- up.payment_type = 3
-- and up.task_id = 12
group by up.user_task_id