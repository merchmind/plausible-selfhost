#!/bin/sh
set -e

if [ "$1" = 'run' ]; then
-     exec /app/bin/plausible start
+     echo "🚀 Ensuring applications are started…"
+     # start Ecto and its Repo so we can migrate
+     /app/bin/plausible eval "\
+       Application.ensure_all_started(:postgrex); \
+       Application.ensure_all_started(:ecto_sql); \
+       Application.ensure_all_started(:plausible); \
+       Ecto.Migrator.run(\
+         Plausible.Repo, \
+         Application.app_dir(:plausible, \"priv/repo/migrations\"), \
+         :up, \
+         all: true\
+       )\
+     "
+     echo "✅ Migrations finished, starting web server…"
+     exec /app/bin/plausible start

elif [ "$1" = 'db' ]; then
     exec /app/"$2".sh
else
     exec "$@"
fi

exec "$@"
