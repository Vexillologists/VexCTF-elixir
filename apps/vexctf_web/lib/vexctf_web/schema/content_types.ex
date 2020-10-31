defmodule VexCTFWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :team do
    field(:id, :id)
    field(:team_name, :string)
    field(:points, :integer)
  end
end
