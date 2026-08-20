set lines 220 pages 100
col name format a12
col db_unique_name format a18
col database_role format a18
col open_mode format a20

prompt === database ===
select name,
       db_unique_name,
       database_role,
       open_mode,
       log_mode,
       force_logging,
       flashback_on
from   v$database;

prompt
prompt === instances ===
col instance_name format a14
col host_name format a35
select inst_id,
       instance_name,
       host_name,
       status,
       database_status,
       to_char(startup_time,'dd-mon-yyyy hh24:mi:ss') startup_time
from   gv$instance
order  by inst_id;

prompt
prompt === sessions ===
select inst_id,
       count(*) total_sessions,
       sum(case when status='ACTIVE' then 1 else 0 end) active_sessions
from   gv$session
where  type='USER'
group  by inst_id
order  by inst_id;
