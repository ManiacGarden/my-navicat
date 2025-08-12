SELECT app_id, date_at, source, source_value, user_num FROM (
	  SELECT app_id, date_at, source, source_value, user_num,
	         ROW_NUMBER() OVER (PARTITION BY date_at ORDER BY user_num DESC) AS rn
	  FROM tq_wx_user_source
	  WHERE app_id = 'wx70b077d647c1bc0a'
	    AND date_at >= '2025-07-21'
	    AND date_at <= '2025-07-27'
	) t
	WHERE rn <= 5
	ORDER BY date_at ASC, user_num DESC;
