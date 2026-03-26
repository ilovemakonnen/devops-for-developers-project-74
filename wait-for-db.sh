#!/usr/bin/env bash

set -e

host="$1"
shift

host_part="${host%:*}"
port_part="${host#*:}"

echo "Waiting for PostgreSQL at $host_part:$port_part..."

timeout=30
counter=0

until nc -z "$host_part" "$port_part"; do
  echo "PostgreSQL is not ready yet..."
  sleep 1
  counter=$((counter + 1))

  if [ "$counter" -ge "$timeout" ]; then
    echo "Timeout waiting for PostgreSQL"
    exit 1
  fi
done

echo "PostgreSQL port is open"
exec "$@"