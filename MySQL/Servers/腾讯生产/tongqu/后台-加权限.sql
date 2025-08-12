-- 96为原有权限，101为新权限，这句是给所有有原有权限的加上新权限


INSERT INTO user_permission (user_id, permission_id)
SELECT id, 101 from user where id in 
(SELECT user_id from user_permission where permission_id = 96)
and id not in 
(SELECT user_id from user_permission where permission_id = 101)
