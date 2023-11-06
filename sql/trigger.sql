CREATE TABLE log_table(
    time TIMESTAMP
)


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