defmodule VexCTFWeb.Resolvers.Content do
  def list_teams(_parent, _args, _resolution) do
    {:ok, VexCTF.Content.list_teams()}
  end
end
