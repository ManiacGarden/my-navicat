SELECT 
			max(up.id) max_upload_id,
			u.id user_id, 
			u.openid open_id,
			u.nick_name nickname,
			b.card_num card_num,
			b.user_name bank_user_name,
			b.mobile mobile,
			up.user_task_id user_task_id,
			t.id task_id, t.task_name task_name,
			sum(up.payment_amount) payment_amount_sum
FROM tq_bt_upload up 
left join tq_bt_user u on up.user_id = u.id 
left join tq_bt_bank b on up.bank_id = b.id 
left join tq_bt_task t on up.task_id = t.id 
WHERE up.payment_type = 1 and up.task_id = 41
GROUP BY `up`.`user_task_id` ORDER BY max_upload_id desc;