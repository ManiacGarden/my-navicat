SELECT account_id, GROUP_CONCAT(scheduled_weekday ORDER BY scheduled_weekday asc) weekdays, hours, budgets
from (SELECT account_id,
             scheduled_weekday,
             GROUP_CONCAT(scheduled_hour ORDER BY scheduled_hour ASC) hours, GROUP_CONCAT(daily_budget ORDER BY scheduled_hour ASC) budgets
      from tq_tcad_budget_cron
      GROUP BY account_id, scheduled_weekday) a
GROUP BY account_id, hours, budgets