#!/bin/sh
set -e

if [ "$1" = 'run' ]; then
      echo "🚀 Running database migrations..."
      /app/bin/plausible eval "Plausible.Repo.__adapter__.storage_up(Plausible.Repo.config); Ecto.Migrator.run(Plausible.Repo, 'priv/repo/migrations', :up, all: true)"
      echo "✅ Starting Plausible..."
      exec /app/bin/plausible start


elif [ "$1" = 'db' ]; then
      exec /app/"$2".sh
 else
      exec "$@"

fi

exec "$@"
