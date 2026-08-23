
# Oracle Database Performance Scripts

SQL scripts used for basic Oracle database performance monitoring and troubleshooting.

These are some of the queries I use to check blocking sessions, long running operations, tablespace usage and SQL performance.

## Scripts

### blocking_sessions.sql

Checks for blocking sessions in the database.

Useful when investigating session waits, application slowness or database blocking issues.

```sql
@blocking_sessions.sql
```

### long_running_operations.sql

Checks long running database operations and their current progress.

Useful for monitoring operations such as large table scans, index operations, backups and other long running database activities.

```sql
@long_running_operations.sql
```

### tablespace_usage.sql

Checks current tablespace space utilization.

Useful for identifying tablespaces with high space usage before they run out of available space.

```sql
@tablespace_usage.sql
```

### top_sql.sql

Checks SQL statements consuming higher database resources.

This can be used as a starting point when investigating database performance issues.

```sql
@top_sql.sql
```

## Running the Scripts

Connect to the database:

```bash
sqlplus / as sysdba
```

Run the required script:

```sql
@top_sql.sql
```

Output can be captured using SQL*Plus spool:

```sql
spool output/top_sql_output.txt
@top_sql.sql
spool off
```

## Files

```text
performance/
├── blocking_sessions.sql
├── long_running_operations.sql
├── tablespace_usage.sql
├── top_sql.sql
├── README.md
└── output/
```

The `output` directory contains sample results collected while running the performance monitoring scripts.

> Note: Database names, hostnames, usernames, SQL text and other environment-specific information should be reviewed and masked before uploading output to a public repository.
