CREATE VIEW data_sum_min AS
SELECT
  EXTRACT(MINUTE FROM "time"),
  SUM("value") AS total_value
FROM
  data
GROUP BY
  EXTRACT(MINUTE FROM "time")

Select * from data_sum_min