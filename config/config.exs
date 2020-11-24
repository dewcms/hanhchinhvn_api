# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hanhchinhvn_api, HanhchinhvnApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/NvP0+20HCsopkvgND3f0ZMzdK7VVt2eN7tNCXUlezDeDqDLtM8c2aRgmMmFEDHk",
  render_errors: [view: HanhchinhvnApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HanhchinhvnApi.PubSub,
  live_view: [signing_salt: "ugdrBewz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, :logger, false

config :tesla, :adapter, Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
