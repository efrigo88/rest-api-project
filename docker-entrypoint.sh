#!/bin/sh
until nc -z -v -w 5 db 5432; do
  echo "Waiting for database to be ready..."
  sleep 2
done

flask db upgrade
exec gunicorn --bind 0.0.0.0:80 "app:create_app()"