defmodule VexCTF.Schema.User do
  use Ecto.Schema

  schema "users" do
    field :username, :string
    field :email, :string
    field :email_confirmed, :boolean, default: false
    field :admin, :boolean, default: false

    timestamps()

    belongs_to :team, VexCTF.Schema.Team
  end
end
