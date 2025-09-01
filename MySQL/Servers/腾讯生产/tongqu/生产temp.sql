CREATE TABLE `tq_tcad_budget_cron` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL DEFAULT '0' COMMENT '账户id',
  `scheduled_hour` int NOT NULL DEFAULT '0' COMMENT '几点开启',
  `scheduled_hour` int NOT NULL DEFAULT '0' COMMENT '星期几开启，0为星期天，其他123456正常',
  `daily_budget` int NOT NULL DEFAULT '0' COMMENT '日预算，单位为分',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `scheduled_hour` (`scheduled_hour`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='腾讯广告-账号定时修改预算时间';