import Config

config :plausible, PlausibleWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: false,
  server: true,
  code_reloader: false

config :plausible, Plausible.Repo,
  pool_size: 20,
  queue_target: 10000,
  queue_interval: 1000
