defmodule VexCTF.Web.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: VexCTF.Web.Router,
       options: Application.get_env(:vexctf_web, :http, ip: {0, 0, 0, 0}, port: 8080)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VexCTF.Web.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
