# Oracle DBA Toolkit

A collection of reusable Oracle Database administration and monitoring scripts for learning, lab demonstrations, and day-to-day DBA diagnostics.

## Areas covered
- Oracle RAC
- Oracle Data Guard
- Oracle ASM
- RMAN
- Performance diagnostics
- TDE and auditing
- Database health monitoring

## Prerequisites
Oracle Database 19c or later is recommended. Some scripts require SYSDBA or catalog/dynamic performance view privileges. Test scripts in a lab or non-production environment first.

## Usage
Run SQL scripts with SQL*Plus, SQLcl, or another Oracle SQL client. Shell commands such as `srvctl` and `crsctl` must be run from an Oracle Grid Infrastructure environment with appropriate privileges.

## Repository structure
| Folder | Purpose |
|---|---|
| `rac/` | RAC instances, services and cluster status |
| `dataguard/` | Data Guard role, lag and archive-gap monitoring |
| `asm/` | ASM diskgroup, disk and rebalance monitoring |
| `rman/` | RMAN backup reporting and sample commands |
| `performance/` | Blocking sessions, long-running SQL and SQL performance |
| `security/` | TDE, Unified Auditing and FGA demonstrations |
| `monitoring/` | General database health and capacity checks |

## Oracle ACE product-usage demonstration
This repository can be used to demonstrate practical Oracle product usage. For each demonstration, capture only sanitized lab output and document:
1. Objective
2. Environment and Oracle version
3. Commands/scripts executed
4. Result
5. What was learned

Never publish production credentials, IP addresses, hostnames, wallet locations, customer information, internal database names, or other confidential information.

## Disclaimer
These scripts are provided for educational and administrative reference. Validate them in your own environment before production use.
