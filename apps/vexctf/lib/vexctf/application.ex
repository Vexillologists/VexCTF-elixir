defmodule VexCTF.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      VexCTF.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VexCTF.PubSub}
      # Start a worker by calling: VexCTF.Worker.start_link(arg)
      # {VexCTF.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: VexCTF.Supervisor)
  end
end
