set lines 180 pages 100
col name format a20
col state format a12
col type format a8

select name,
       state,
       type,
       round(total_mb/1024) total_gb,
       round(free_mb/1024) free_gb,
       round(usable_file_mb/1024) usable_gb,
       round((total_mb-free_mb)*100/nullif(total_mb,0),2) pct_used,
       offline_disks
from   v$asm_diskgroup
order  by pct_used desc;
