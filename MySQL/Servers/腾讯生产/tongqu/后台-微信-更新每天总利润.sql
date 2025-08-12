-- 不能直接用这个，等号右边任一个为null，计算都会中断掉
-- UPDATE wx_game_analysis_data
-- SET profit = income * 1.0 / 100 + price * 0.91 - wx_cost * 0.91
-- WHERE wx_cost > 0 and date > '2023-07-15'

-- 用这个，null视作0
UPDATE wx_game_analysis_data
SET profit = IFNULL(income, 0) * 1.0 / 100 + IFNULL(price, 0) * 0.97 - IFNULL(wx_cost, 0) * 0.97
WHERE date >= '2025-01-01'