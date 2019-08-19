# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

config :phxapp, PhxappWeb.Endpoint,
  url: [host: "localhost"],
  http: [port: 4000],
  secret_key_base: "tRqrIC3rGPa5/N/4akkTjNoXfbzNbmem8ME665QH3dsavCS9fbWm3HS6i6Mo3Ifv",
  render_errors: [view: PhxappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phxapp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason
