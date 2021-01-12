import Config

config :vexctf_web, :graphiql,
  interface: :playground,
  default_url: "http://localhost:8080/graphql"

import_config "#{config_env()}/config.exs"
