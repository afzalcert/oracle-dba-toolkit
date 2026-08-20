set lines 220 pages 100
col wrl_parameter format a60
col wallet_type format a18
col status format a20
col keystore_mode format a18

prompt === wallet status ===
select con_id,
       wallet_type,
       status,
       keystore_mode,
       wrl_type,
       wrl_parameter
from   v$encryption_wallet
order  by con_id;

prompt
prompt === encrypted tablespaces ===
col tablespace_name format a30
select d.tablespace_name,
       d.encrypted,
       e.encryptionalg,
       e.status
from   dba_tablespaces d
       join v$tablespace t
         on t.name=d.tablespace_name
       left join v$encrypted_tablespaces e
         on e.ts#=t.ts#
where  d.encrypted='YES'
order  by d.tablespace_name;
