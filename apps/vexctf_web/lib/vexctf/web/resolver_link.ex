defmodule VexCTF.Web.ResolverLink do
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
