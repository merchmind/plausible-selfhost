#!/bin/sh
set -e

if [ "$1" = 'run' ]; then
      echo "🚀 Running database migrations..."
      /app/bin/plausible eval \
  "Application.ensure_all_started(:plausible); \
   Ecto.Migrator.run(Plausible.Repo, \
     Application.app_dir(:plausible, \"priv/repo/migrations\"), \
     :up, all: true)"
      echo "✅ Starting Plausible..."
      exec /app/bin/plausible start


elif [ "$1" = 'db' ]; then
      exec /app/"$2".sh
 else
      exec "$@"

fi

exec "$@"
