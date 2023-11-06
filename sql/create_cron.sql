	
CREATE EXTENSION pg_cron;

-- -- optionally, grant usage to regular users:
-- GRANT USAGE ON SCHEMA cron TO postgres;

INSERT INTO crom.job()

SELECT cron.schedule('0 22 * * *', 'VACUUM')

SELECT cron.unschedule(jobid) FROM cron.job