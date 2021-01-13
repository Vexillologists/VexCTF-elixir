defmodule VexCTF.Core.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :email_confirmed, :boolean, null: false, default: false
      add :admin, :boolean, null: false, default: false

      timestamps()
    end

    create unique_index(:users, :username)
    create unique_index(:users, :email)
  end
end
