defmodule VexCTF.Web.Schema do
  @moduledoc """
  The GraphQL Schema for VexCTF
  """

  use Absinthe.Schema

  alias VexCTF.Web.Resolvers

  query do
    @desc "Get the API version of this VexCTF implementation"
    field :api_version, :string do
      resolve(&Resolvers.api_version/3)
    end
  end
end
