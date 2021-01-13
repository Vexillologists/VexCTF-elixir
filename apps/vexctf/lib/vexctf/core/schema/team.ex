defmodule VexCTF.Core.Schema.Team do
  @moduledoc """
  Schema for VexCTF teams
  """

  use Ecto.Schema

  schema "teams" do
    field(:team_name, :string)

    timestamps()

    has_many(:members, VexCTF.Core.Schema.User)
  end
end
