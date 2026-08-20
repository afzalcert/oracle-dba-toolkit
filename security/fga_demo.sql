-- run as a user with execute on dbms_fga and access to the target schema
-- change DEMO/CUSTOMERS before running

begin
  dbms_fga.add_policy(
    object_schema   => 'SCOTT',
    object_name     => 'EMPLOYEES',
    policy_name     => 'FGA_EMPLOYEES_SALARY',
    audit_column    => 'SALARY',
    statement_types => 'SELECT',
    enable          => true
  );
end;
/

-- test from another session, then check the audit trail
set lines 260 pages 100
col db_user format a20
col object_schema format a20
col object_name format a25
col policy_name format a25
col sql_text format a100

select timestamp,
       db_user,
       object_schema,
       object_name,
       policy_name,
       sql_text
from   dba_fga_audit_trail
where  policy_name='FGA_EMPLOYEES_SALARY'
order  by timestamp desc;