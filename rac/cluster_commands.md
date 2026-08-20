# RAC  quick checks


crsctl check crs
crsctl stat res -t
olsnodes -n -s -t

srvctl status database -d database_name
srvctl status service  -d database_name
srvctl config database -d database_name
srvctl config service  -d database_name


Run Grid Infrastructure commands using the appropriate Grid/Oracle OS account for the environment.
