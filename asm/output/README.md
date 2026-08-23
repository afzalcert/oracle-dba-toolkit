# ASM disk status
# Oracle ASM Scripts

SQL scripts used for checking Oracle ASM disk groups, disks and rebalance operations.

These are some of the scripts I use for regular ASM checks and troubleshooting.

## Scripts

### diskgroup_usage.sql

Checks ASM disk group space usage including total, free and usable space.

```sql
@diskgroup_usage.sql
```

### disk_status.sql

Checks the current status of ASM disks including disk name, path, mount status and header status.

```sql
@disk_status.sql
```

### rebalance_status.sql

Checks whether an ASM rebalance operation is running and its current progress.

```sql
@rebalance_status.sql
```

## Running the scripts

Connect to the ASM instance:

```bash
sqlplus / as sysasm
```

Run the required script:

```sql
@diskgroup_usage.sql
```

Output can be captured using spool:

```sql
spool output/diskgroup_usage_output.txt
@diskgroup_usage.sql
spool off
```

## Files

```text
asm/
├── diskgroup_usage.sql
├── disk_status.sql
├── rebalance_status.sql
├── README.md
└── output/
```

The `output` directory contains sample output collected while testing the scripts.

> Note: Server names, disk paths and other environment-specific information should be masked before uploading output to a public repository.
