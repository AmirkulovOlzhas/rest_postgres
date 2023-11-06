
select
  cron.schedule(
    'invoke-function-every-minute',
--     '*/30 * * * *', -- every minute
	'*/30 * * * * *',
    $$
    select insert_data()
    $$
  );

select cron.schedule('* * * * *', 'select insert_data()');

SELECT cron.schedule('5 sec', '5 seconds', 'select insert_data()');

-- select

select * from cron.job_run_details order by start_time desc limit 5;

select * from data


select * from cron.job

-- insert

select insert_data()

-- delete

delete from data
  
select cron.unschedule('invoke-function-every-minute');

SELECT cron.unschedule(jobid) FROM cron.job