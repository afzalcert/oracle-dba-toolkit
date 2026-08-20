set lines 240 pages 100
col opname format a40
col target format a35
col units format a12

select inst_id,
       sid,
       serial#,
       opname,
       target,
       sofar,
       totalwork,
       units,
       round(sofar*100/nullif(totalwork,0),2) pct,
       elapsed_seconds elapsed_sec,
       time_remaining remaining_sec
from   gv$session_longops
where  totalwork > 0
and    sofar <> totalwork
and    time_remaining > 0
order  by time_remaining desc;
