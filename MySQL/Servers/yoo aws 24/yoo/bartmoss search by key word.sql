SELECT * from bartmoss_collective_quotes where quote_id in (
SELECT quote_id from bartmoss_collective_quotes where quote_text like '%数据%')