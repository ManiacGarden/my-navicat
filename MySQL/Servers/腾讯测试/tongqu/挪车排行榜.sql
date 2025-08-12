SELECT r.player_level, u.openid, u.head_url, u.nick_name
from (
    SELECT uid, MAX(player_level) AS player_level
    FROM tq_nuoche_rank_new
    WHERE date_at >= '2024-06-23' 
      AND date_at < '2024-10-25'
    GROUP BY uid
		order by player_level desc
		limit 50
) r 
left join tq_nuoche_user u ON r.uid = u.id;
