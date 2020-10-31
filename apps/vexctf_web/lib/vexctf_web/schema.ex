defmodule VexCTFWeb.Schema do
  use Absinthe.Schema
  import_types(VexCTFWeb.Schema.ContentTypes)

  alias VexCTFWeb.Resolvers

  query do
    @desc "Get all teams"
    field :teams, list_of(:team) do
      resolve(&Resolvers.Content.list_teams/3)
    end

    @desc "get the current SemVer-compliant API version"
    field :api_version, :string do
      resolve(fn _, _ -> {:ok, "1.0.0"} end)
    end
  end
end
