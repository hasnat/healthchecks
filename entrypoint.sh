#!/usr/bin/env bash

./manage.py migrate

(./manage.py sendalerts > /dev/stdout 2>&1 &) && ./manage.py runserver 0.0.0.0:8000

