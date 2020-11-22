# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :doubutsu,
  ecto_repos: [Doubutsu.Repo]

# Configures the endpoint
config :doubutsu, DoubutsuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BrSpd8ZOC3YSPxTD3mbTW+rGDKHNAj0Q5vwyMA2VbrxJO8uNZHm3H8tGU/qp8Pja",
  render_errors: [view: DoubutsuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Doubutsu.PubSub,
  live_view: [signing_salt: "J9/xnys4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
