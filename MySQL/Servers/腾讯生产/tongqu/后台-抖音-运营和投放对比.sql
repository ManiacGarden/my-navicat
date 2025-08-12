SELECT p.app_id,
       p.date,
       p.retention_active,
       p.tt_new_retention_active,
       t.active_secondary_retention_rate,
       t.new_secondary_retention_rate
FROM tq_admin_tt_promotion p
         join tt_game_analysis_data t ON
    p.app_id = t.app_id and p.date = t.date
where p.date = '2025-05-02'