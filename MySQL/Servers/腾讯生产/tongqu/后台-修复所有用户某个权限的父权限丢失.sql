INSERT INTO user_permission (user_id, permission_id)
SELECT user_id, 27
FROM user_permission p1
WHERE permission_id = 96
  AND NOT EXISTS (
    SELECT 1
    FROM user_permission p2
    WHERE p2.user_id = 49
    AND p2.permission_id = 27
  );
