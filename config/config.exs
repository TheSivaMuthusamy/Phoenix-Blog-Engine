# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phxblog,
  ecto_repos: [Phxblog.Repo]

# Configures the endpoint
config :phxblog, Phxblog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8E6qdiJ3ibXEaJI2HOpLOn+RjqQHwF0OR67OstNqG1CfGLmwaVP2Hn4I5K7ymEY0",
  render_errors: [view: Phxblog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phxblog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
