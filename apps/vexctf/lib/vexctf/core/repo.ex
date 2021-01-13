defmodule VexCTF.Core.Repo do
  use Ecto.Repo,
    otp_app: :vexctf,
    adapter: Ecto.Adapters.Postgres
end
