select `name`, app_id, tt_version from game where platform='tt' order by tt_version desc;

select `name`, app_id, tt_version from game where `name`='箭头消消消' and platform='tt';

SELECT tt_version, COUNT(*) from game where platform='tt' GROUP BY tt_version; 