import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elixir_kanban_websocket, ElixirKanbanWebsocket.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "elixir_kanban_websocket_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_kanban_websocket, ElixirKanbanWebsocketWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "r17aovz1gwZ7qOB7wpJA/7869tJi3VwTta7wKC7dFn0/UFDFAHgToh/C5Gn0r8FX",
  server: false

# In test we don't send emails.
config :elixir_kanban_websocket, ElixirKanbanWebsocket.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
