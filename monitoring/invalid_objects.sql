set lines 180 pages 200
col owner format a25
col object_type format a28

select owner,
       object_type,
       count(*) invalid_count
from   dba_objects
where  status='INVALID'
and    owner not in ('SYS','SYSTEM')
group  by owner,object_type
order  by invalid_count desc,owner,object_type;
