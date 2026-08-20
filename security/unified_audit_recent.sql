set lines 260 pages 200
col dbusername format a20
col action_name format a25
col object_schema format a20
col object_name format a30
col client_program_name format a35

select event_timestamp,
       dbusername,
       action_name,
       object_schema,
       object_name,
       return_code,
       client_program_name
from   unified_audit_trail
where  event_timestamp >= systimestamp - numtodsinterval(&hours,'HOUR')
order  by event_timestamp desc
fetch first 200 rows only;

-- usage: @unified_audit_recent 24
