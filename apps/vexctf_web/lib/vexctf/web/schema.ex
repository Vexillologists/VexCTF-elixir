defmodule VexCTF.Web.Schema do
  @moduledoc """
  The GraphQL Schema for VexCTF
  """

  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  query do
    @desc "Get the API version of this VexCTF implementation"
    field :api_version, :string do
      resolve(fn _, %{context: %{resolver: resolver}} ->
        GenServer.call(resolver, :api_version)
      end)
    end

    node field do
      resolve(fn
        %{type: :user}, _ ->
          {:ok, %{username: "TODO"}}

        %{type: :team, id: id}, %{context: %{resolver: resolver}} ->
          IO.puts(id)
          GenServer.call(resolver, {:get_team, id})
      end)
    end
  end

  node interface do
    resolve_type(fn
      %{username: _}, _ ->
        :user

      %{team_name: _}, _ ->
        :team

      _, _ ->
        nil
    end)
  end

  node object(:team) do
    field(:team_name, :string)

    connection field(:members, node_type: :user) do
      resolve(fn
        %{id: id}, args, %{context: %{resolver: resolver}} ->
          res = GenServer.call(resolver, {:get_team_members, id, args})

          case res do
            {:ok, conn} ->
              conn

            {:error, error} ->
              {:error, error}
          end
      end)
    end
  end

  node object(:user) do
    field(:username, :string)
    field(:team, :team)
  end

  connection(node_type: :user)
  connection(node_type: :team)
end
