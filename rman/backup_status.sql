set lines 220 pages 100
col input_type format a18
col status format a24
col start_time format a18
col end_time format a18

select session_key,
       input_type,
       status,
       to_char(start_time,'dd-mon-yy hh24:mi') start_time,
       to_char(end_time,'dd-mon-yy hh24:mi') end_time,
       round(elapsed_seconds/60) mins,
       input_bytes_display,
       output_bytes_display,
       output_device_type
from   v$rman_backup_job_details
where  start_time >= sysdate-&days
order  by start_time desc;

-- usage: @backup_status 7
