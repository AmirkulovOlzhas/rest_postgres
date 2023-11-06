CREATE TABLE data (
  time DATE,
  value FLOAT
);

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

-- select insert_data()

-- select * from data