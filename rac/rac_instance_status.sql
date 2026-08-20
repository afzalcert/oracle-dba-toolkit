set lines 220 pages 100
col instance_name format a14
col host_name format a35
col status format a10
col database_status format a18
col startup_time format a20

select inst_id,
       instance_name,
       host_name,
       status,
       database_status,
       to_char(startup_time,'dd-mon-yyyy hh24:mi:ss') startup_time,
       thread#,
       archiver
from   gv$instance
order  by inst_id;
