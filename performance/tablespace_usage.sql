set lines 220 pages 200
col tablespace_name format a30

with df as
(
  select tablespace_name,
         sum(bytes) bytes,
         sum(case when autoextensible='YES' then maxbytes else bytes end) maxbytes
  from   dba_data_files
  group  by tablespace_name
),
fs as
(
  select tablespace_name, sum(bytes) free_bytes
  from   dba_free_space
  group  by tablespace_name
)
select df.tablespace_name,
       round(df.bytes/1024/1024/1024,2) alloc_gb,
       round((df.bytes-nvl(fs.free_bytes,0))/1024/1024/1024,2) used_gb,
       round(nvl(fs.free_bytes,0)/1024/1024/1024,2) free_gb,
       round((df.bytes-nvl(fs.free_bytes,0))*100/nullif(df.bytes,0),2) pct_used,
       round(df.maxbytes/1024/1024/1024,2) max_gb
from   df
       left join fs on fs.tablespace_name=df.tablespace_name
order  by pct_used desc;
