#!/bin/sh
until pg_isready -h db -U user; do
  echo "Waiting for database to be ready..."
  sleep 2
done

flask db upgrade
exec gunicorn --bind 0.0.0.0:80 "app:create_app()"