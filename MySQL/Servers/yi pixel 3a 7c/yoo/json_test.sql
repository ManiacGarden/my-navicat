insert into json_table VALUES (null, JSON_ARRAY(22,34))
UPDATE json_table SET json_column = json_array_append(json_column, '$', 5) where id = 1
UPDATE json_table SET json_column = JSON_ARRAY_INSERT(json_column, '$[2]', 11) where id = 1


insert into json_table VALUES (null, JSON_OBJECT('num', 22, 'my_id', 33))
update json_table set json_column = JSON_INSERT(json_column, '$.uuu', 'sss') where id=4


select * from json_table where 22 member of (json_column->"$")
