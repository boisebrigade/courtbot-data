use Mix.Config

config :courtbot, CourtbotWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :courtbot, CourtbotWeb.Endpoint,
  secret_key_base: "/8AeXJW/lKAEb2eZeXaKTqvv6HhPW7XBTMXZqsHJbCmZv5tRjsWm36yNBG3NpR/2"

