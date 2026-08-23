#Monitoring scripts

# Oracle Database Monitoring

SQL scripts used for regular Oracle database health checks and monitoring.

These are some of the scripts I use for basic database checks and troubleshooting.

## Scripts

### database_health.sql

Checks the general health and status of the Oracle database.

This script is used for quick database health verification during regular monitoring.

### alert_summary.sql

Checks recent messages from the Oracle database alert log.

The number of hours to check can be provided while running the script.

Example:

```sql
@alert_summary.sql
Enter value for hours: 48
```

### invalid_objects.sql

Checks for invalid objects in the database.

This is useful for identifying invalid packages, procedures, functions, views and other database objects that may require attention.

## Running the Scripts

Connect to the database:

```bash
sqlplus / as sysdba
```

Run the required script:

```sql
@database_health.sql
```

Output can be captured using SQL*Plus spool:

```sql
spool output/database_health_output.txt
@database_health.sql
spool off
```

## Files

```text
monitoring/
├── alert_summary.sql
├── database_health.sql
├── invalid_objects.sql
├── README.md
└── output/
```

The `output` directory contains sample results collected while running the monitoring scripts.

> Note: Database names, hostnames, usernames, IP addresses and other environment-specific information should be masked before uploading output to a public repository.

