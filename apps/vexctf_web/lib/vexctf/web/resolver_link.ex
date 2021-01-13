defmodule VexCTF.Web.ResolverLink do
  @moduledoc """
  A plug to create a VexCTF.Core.Resolver GenServer at the beginning of a
  request and stop it at the end, for usage in Absinthe resolvers.
  """

  @behaviour Plug

  alias VexCTF.Core.Resolver
  alias Plug.Conn

  @impl true
  def init(opts), do: opts

  @impl true
  def call(conn, _opts) do
    {:ok, resolver} = Resolver.start_link([])

    Conn.register_before_send(conn, fn conn ->
      GenServer.stop(resolver)
      conn
    end)
    |> Absinthe.Plug.assign_context(resolver: resolver)
  end
end
