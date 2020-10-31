# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :vexctf,
  namespace: VexCTF,
  ecto_repos: [VexCTF.Repo]

config :vexctf_web,
  namespace: VexCTFWeb,
  ecto_repos: [VexCTF.Repo],
  generators: [context_app: :vexctf]

# Configures the endpoint
config :vexctf_web, VexCTFWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FAKj6j2wfElqbm6DrqgrmwhDqAI9fCnn+MKniMC/AC5vq9/L/Iq3x0lZDzrV40eK",
  render_errors: [view: VexCTFWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: VexCTF.PubSub,
  live_view: [signing_salt: "EBXjEAHL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
