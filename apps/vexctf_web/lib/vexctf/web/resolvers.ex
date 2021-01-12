defmodule VexCTF.Web.Resolvers do
  @moduledoc """
  General GraphQL resolvers for VexCTF
  """

  def api_version(_parent, _args, _resolution) do
    {:ok, "1.0.0"}
  end
end
