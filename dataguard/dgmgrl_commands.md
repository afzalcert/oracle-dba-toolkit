# Data Guard Broker quick checks

```text
dgmgrl /
SHOW CONFIGURATION;
SHOW CONFIGURATION VERBOSE;
SHOW DATABASE VERBOSE <primary_db_unique_name>;
SHOW DATABASE VERBOSE <standby_db_unique_name>;
VALIDATE DATABASE <primary_db_unique_name>;
VALIDATE DATABASE <standby_db_unique_name>;
VALIDATE NETWORK CONFIGURATION FOR ALL;
```

Useful during switchover preparation:

```text
SHOW DATABASE <primary_db_unique_name> 'SwitchoverStatus';
SHOW DATABASE <standby_db_unique_name> 'SwitchoverStatus';
```
