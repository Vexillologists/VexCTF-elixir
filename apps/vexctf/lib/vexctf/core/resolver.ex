defmodule VexCTF.Core.Resolver do
  @moduledoc """
  A GenServer that resolves GraphQL queries and mutations
  """

  use GenServer

  alias VexCTF.Core.Schema
  alias VexCTF.Core.Repo

  alias Absinthe.Relay.Connection

  require Ecto.Query

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
    {:reply, {:ok, "1.0.0"}, state}
  end

  @impl true
  def handle_call({:get_team_members, team_id, connargs}, _from, state) do
    query =
      Repo.get!(Schema.Team, team_id)
      |> Ecto.assoc(:members)
      |> Ecto.Query.order_by(asc: :username)

    conn =
      query
      |> Connection.from_query(&Repo.all/1, connargs)

    {:reply, {:ok, conn}, state}
  end

  @impl true
  def handle_call({:get_team, team_id}, _from, state) do
    team = Repo.get(Schema.Team, team_id)

    case team do
      nil -> {:reply, {:error, "Team not found"}, state}
      _ -> {:reply, {:ok, team}, state}
    end
  end
end
