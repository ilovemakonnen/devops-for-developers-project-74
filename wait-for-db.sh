#!/usr/bin/env bash

host="$1"

until nc -z ${host%:*} ${host#*:}; do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

echo "PostgreSQL started"
shift
exec "$@"