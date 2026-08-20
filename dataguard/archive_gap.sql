set lines 180 pages 100

prompt === archive gap ===
select thread#,
       low_sequence#,
       high_sequence#
from   v$archive_gap
order  by thread#;

prompt
prompt === last received / applied archive ===
select thread#,
       max(sequence#) last_received,
       max(case when applied='YES' then sequence# end) last_applied
from   v$archived_log
where  resetlogs_change# = (select resetlogs_change# from v$database)
group  by thread#
order  by thread#;
