UPDATE `tq_admin_tt_promotion`
SET new_pv_req_cnt = CASE 
                        WHEN ecpm_new != 0 AND new_user_flow != 0 
                        THEN new_ad_income * 1000 / ecpm_new / new_user_flow 
                        ELSE new_pv_req_cnt 
                     END
WHERE date <= '2024-05-20';
