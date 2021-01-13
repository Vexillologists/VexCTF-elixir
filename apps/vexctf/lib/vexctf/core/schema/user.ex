defmodule VexCTF.Core.Schema.User do
  @moduledoc """
  Schema for VexCTF users
  """

  use Ecto.Schema

  schema "users" do
    field(:username, :string)
    field(:email, :string)
    field(:email_confirmed, :boolean, default: false)
    field(:admin, :boolean, default: false)

    timestamps()

    belongs_to(:team, VexCTF.Core.Schema.Team)
  end
end
