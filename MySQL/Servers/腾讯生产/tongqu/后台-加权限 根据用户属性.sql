

INSERT INTO user_permission (user_id, permission_id)
SELECT id as user_id, 95 AS permission_id
FROM user 