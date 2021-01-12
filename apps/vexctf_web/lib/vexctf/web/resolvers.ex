defmodule VexCTF.Web.Resolvers do
  def api_version(_parent, _args, _resolution) do
    {:ok, "1.0.0"}
  end
end
