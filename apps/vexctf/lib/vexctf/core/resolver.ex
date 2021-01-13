defmodule VexCTF.Core.Resolver do
  @moduledoc """
  A GenServer that resolves GraphQL queries and mutations
  """

  use GenServer

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  # Server (callbacks)

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:api_version, _from, state) do
    {:reply, "1.0.0", state}
  end
end
