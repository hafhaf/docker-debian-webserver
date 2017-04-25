#!/bin/bash

/etc/init.d/postgresql start
/etc/init.d/redis-server start
/usr/bin/mongod --quiet --config /etc/mongod.conf &
/etc/init.d/php5-fpm start

/tcp-port-wait.sh localhost 5432
/tcp-port-wait.sh localhost 27017
/tcp-port-wait.sh localhost 6379

nginx -g "daemon off;"
