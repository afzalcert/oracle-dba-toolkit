set lines 180 pages 100
col operation format a12
col state format a12

select group_number,
       operation,
       state,
       power,
       actual,
       sofar,
       est_work,
       est_rate,
       est_minutes
from   v$asm_operation
order  by group_number;
