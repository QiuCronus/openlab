#! /bin/bash

dbuser=$1
dbpass=$2
dbname=$3

mysql -u${dbuser} -p'${dbpass}' -D ${dbname} -e'update im_self_account set is_gathered = 0;'
mysql -u${dbuser} -p'${dbpass}' -D ${dbname} -e'update im_task set is_gathered = 0;'
