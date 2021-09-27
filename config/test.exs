import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :great_scott, GreatScott.Repo,
  username: "postgres",
  password: "postgres",
  database: "great_scott_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :great_scott, GreatScottWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Cb/VSBQTl8M4Rlg4AIIO24csOkOLsjlG+qBi5Kx4PkTYKlySiRy+f9UjTn04SRgr",
  server: false

# In test we don't send emails.
config :great_scott, GreatScott.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
