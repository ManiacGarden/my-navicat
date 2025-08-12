-- SELECT * FROM `tq_ecpm_wx_user` where appid='wxe81c4bd460b9a891' order by id desc;
SELECT ipu, player_value, player_value / ipu avg_value
FROM `tq_ecpm_wx_user` where appid='wxe81c4bd460b9a891' and addiction_type != 4  order by avg_value asc;


SELECT * from tq_ecpm_wx_user where openid='oF2z_450f_jlpTc0FZxJL_pFSNU4';
SELECT * from tq_ecpm_wx_user where openid='oF2z_45X5q_ZZS5HHClvdOvu4NUw';


SELECT * from tq_luosi_user where openid='oF2z_450f_jlpTc0FZxJL_pFSNU4';
SELECT * from tq_luosi_invite where openid='oF2z_450f_jlpTc0FZxJL_pFSNU4';