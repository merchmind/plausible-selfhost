#!/bin/sh
set -e

if [ "$1" = 'run' ]; then
      echo "🚀 Running database migrations..."
      /app/bin/plausible eval "Plausible.Release.migrate"
      echo "✅ Starting Plausible..."
      exec /app/bin/plausible start


elif [ "$1" = 'db' ]; then
      exec /app/"$2".sh
 else
      exec "$@"

fi

exec "$@"
