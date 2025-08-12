 SELECT * from permission 
 where 
 id in (SELECT permission_id pid from user_permission where user_id = 82)
 and 
 parent_id not in (SELECT permission_id pid from user_permission where user_id = 82);
 
 
 SELECT * from user_permission where user_id = 82 order by permission_id asc;