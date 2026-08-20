set lines 240 pages 200
col diskgroup format a18
col disk_name format a18
col path format a45
col header_status format a12
col mount_status format a10
col state format a10

select g.name diskgroup,
       d.disk_number,
       d.name disk_name,
       d.path,
       d.header_status,
       d.mount_status,
       d.state,
       round(d.total_mb/1024,1) total_gb,
       round(d.free_mb/1024,1) free_gb
from   v$asm_disk d
       left join v$asm_diskgroup g on g.group_number=d.group_number
order  by g.name, d.disk_number;
