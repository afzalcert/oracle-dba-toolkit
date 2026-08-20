set lines 200 pages 100
col name format a24
col value format a30
col unit format a12
col time_computed format a22
col datum_time format a22

select name,
       value,
       unit,
       time_computed,
       datum_time
from   v$dataguard_stats
where  name in ('transport lag','apply lag','apply finish time')
order  by name;

prompt
prompt === managed recovery processes ===
col process format a8
col status format a20
select process,
       status,
       thread#,
       sequence#,
       block#,
       blocks
from   v$managed_standby
order  by process, thread#;
