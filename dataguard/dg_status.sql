set lines 220 pages 100
col name format a12
col db_unique_name format a18
col database_role format a18
col open_mode format a20
col protection_mode format a22
col protection_level format a22
col switchover_status format a25

select name,
       db_unique_name,
       database_role,
       open_mode,
       protection_mode,
       protection_level,
       switchover_status,
       force_logging,
       flashback_on
from   v$database;

prompt
prompt === archive destinations ===
col destination format a45
col error format a55
select dest_id,
       status,
       target,
       destination,
       db_unique_name,
       error
from   v$archive_dest_status
where  status <> 'INACTIVE'
order  by dest_id;
