defmodule VexCTF.Schema.Team do
  use Ecto.Schema

  schema "teams" do
    field :team_name, :string
    field :points, :integer, default: 0

    timestamps()

    has_many :members, VexCTF.Schema.User
  end
end
