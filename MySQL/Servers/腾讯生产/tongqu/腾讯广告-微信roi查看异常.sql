select date_at, t.* from tq_tcad_ad_data_all t

where 
1
-- and date_at < '2024-07-01'
and date_at = '2024-07-03'

-- and app_id='wxe81c4bd460b9a891'

and not
(
  (amount < amount2 or amount2 = 0 or amount2 is null) and
  (amount < amount3 or amount3 = 0 or amount3 is null) and
  (amount < amount4 or amount4 = 0 or amount4 is null) and
  (amount < amount5 or amount5 = 0 or amount5 is null) and
  (amount < amount6 or amount6 = 0 or amount6 is null) and
  (amount < amount7 or amount7 = 0 or amount7 is null)
)

-- and ad_id='42360616'

order by date_at desc, amount desc