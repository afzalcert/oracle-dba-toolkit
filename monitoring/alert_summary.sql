set lines 260 pages 200
col msg_time format a22
col message_text format a180

select to_char(originating_timestamp,'dd-mon-yyyy hh24:mi:ss') msg_time,
       message_level,
       message_type,
       substr(message_text,1,180) message_text
from   v$diag_alert_ext
where  originating_timestamp >= systimestamp-numtodsinterval(&hours,'HOUR')
and    message_level <= 8
order  by originating_timestamp desc;

