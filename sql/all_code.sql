CREATE OR REPLACE FUNCTION insert_data()
RETURNS void
AS
$$
BEGIN
  INSERT INTO data ("time", "value")
  VALUES (CURRENT_TIMESTAMP, FLOOR(RANDOM() * 11));
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION copy_data_to_table_b()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_table ("time")
    VALUES (NEW."time");

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER value_trigger
AFTER INSERT ON "data"
FOR EACH ROW
WHEN (NEW."value">9)
EXECUTE PROCEDURE copy_data_to_table_b()


SELECT cron.schedule('5 sec', '5 seconds', 'select insert_data()');
select * from cron.job
SELECT cron.unschedule(jobid) FROM cron.job


CREATE VIEW data_sum_min AS
SELECT
  EXTRACT(MINUTE FROM "time"),
  SUM("value") AS total_value
FROM
  data
GROUP BY
  EXTRACT(MINUTE FROM "time")


Select * from data_sum_min
select * from data