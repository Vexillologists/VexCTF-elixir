import Config

# Do not change! Used for dev tool integration
config :vexctf,
  ecto_repos: [VexCTF.Core.Repo]

# Do not change! Used for the database
config :vexctf, VexCTF.Core.Repo, migration_timestamps: [type: :utc_datetime]

config :vexctf_web, :graphiql,
  interface: :playground,
  default_url: "http://localhost:8080/graphql"

import_config "#{config_env()}/config.exs"
