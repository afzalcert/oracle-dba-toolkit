set lines 260 pages 200
col username format a18
col event format a38
col machine format a28
col program format a35
col sql_id format a14

select s.inst_id,
       s.sid,
       s.serial#,
       s.username,
       s.status,
       s.sql_id,
       s.event,
       s.seconds_in_wait,
       s.blocking_instance blk_inst,
       s.blocking_session blk_sid,
       s.machine,
       s.program
from   gv$session s
where  s.blocking_session is not null
order  by s.seconds_in_wait desc;

prompt
prompt === blockers ===
select distinct b.inst_id,
       b.sid,
       b.serial#,
       b.username,
       b.status,
       b.sql_id,
       b.event,
       b.machine,
       b.program
from   gv$session b
where  (b.inst_id,b.sid) in
       (select blocking_instance,blocking_session
        from gv$session
        where blocking_session is not null)
order  by b.inst_id,b.sid;
