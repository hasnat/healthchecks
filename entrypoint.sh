#!/usr/bin/env bash

touch /opt/healthchecks/hc.sqlite

./manage.py migrate

# run notification alerts (use while to mock as supervisor)
(while sleep 3
do
echo "(re)starting alerts"
./manage.py sendalerts > /dev/stdout
done) 2>&1 &

./manage.py runserver 0.0.0.0:8000
