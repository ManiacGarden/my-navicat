SELECT
    CASE
        WHEN date >= '2025-01-01' THEN income / 100 + price * 0.97 - wx_cost * 0.97
        WHEN date >= '2024-01-01' THEN income / 100 + price * 0.96 - wx_cost * 0.96
        ELSE income / 100 + price * 0.91 - wx_cost * 0.91
    END AS profit_cal, profit
FROM wx_game_analysis_data where date='2025-03-25'