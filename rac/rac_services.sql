set lines 220 pages 100
col service_name format a35
col network_name format a45

select inst_id,
       name service_name,
       network_name
from   gv$active_services
where  name not like 'SYS$%'
order  by name, inst_id;

prompt
prompt === configured services ===

select name,
       network_name,
       goal,
       clb_goal,
       failover_method,
       failover_type
from   dba_services
where  name not like 'SYS$%'
order  by name;
