set lines 260 pages 100
col sql_text format a90
col sql_id format a14

select *
from (
  select inst_id,
         sql_id,
         plan_hash_value,
         executions,
         round(elapsed_time/1000000,1) elapsed_sec,
         round(case when executions > 0 then elapsed_time/executions/1000000 end,3) avg_sec,
         round(cpu_time/1000000,1) cpu_sec,
         buffer_gets,
         disk_reads,
         rows_processed,
         substr(replace(sql_text,chr(10),' '),1,90) sql_text
  from   gv$sql
  where  executions > 0
  and    command_type not in (3,47)
  order  by elapsed_time desc
)
where rownum <= &topn;

-- usage: @top_sql 20
