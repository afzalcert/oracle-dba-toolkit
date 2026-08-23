# RAC Sample Outputs
# Oracle RAC Scripts

Scripts and commands used for basic Oracle RAC monitoring and cluster checks.

These are some of the checks I use during regular RAC administration and troubleshooting.

## Scripts

### rac_instance_status.sql

Checks the status of Oracle RAC database instances across the cluster.

```sql
@rac_instance_status.sql
```

This helps verify instance name, host, status and database instance state.

### rac_services.sql

Checks the database services running across the RAC instances.

```sql
@rac_services.sql
```

Useful for verifying service distribution between RAC nodes.

### cluster_commands.md

Contains commonly used Oracle Clusterware commands for checking cluster, node and resource status.

Some of the commands include:

```bash
crsctl check cluster -all
crsctl stat res -t
olsnodes -n -s -t
```

## Running the SQL Scripts

Connect to the RAC database:

```bash
sqlplus / as sysdba
```

Run the required script:

```sql
@rac_instance_status.sql
```

To capture the output:

```sql
spool output/rac_instance_status_output.txt
@rac_instance_status.sql
spool off
```

## Files

```text
rac/
├── cluster_commands.md
├── rac_instance_status.sql
├── rac_services.sql
├── README.md
└── output/
```

The `output` directory contains sample output collected while running the RAC checks.

> Note: Hostnames, database names, SCAN names, IP addresses and other environment-specific information should be masked before uploading output to a public repository.
