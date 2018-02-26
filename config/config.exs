# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog,
  ecto_repos: [Blog.Repo]

# Configures the endpoint
config :blog, BlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "momsOiS+goeCPZ1cUzQ3MED+oxBJxp9IPmcT26jvtdmqX3qtpRMtuk/JQ18ekiMK",
  render_errors: [view: BlogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Blog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Todo",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "j5W70LFYiL2e8YKL9zKnxJkqYlInvtwy/Cf+crTlKtdTRZUSPMKXtQw/AF9ULONv",
  serializer: Todo.GuardianSerializer


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
