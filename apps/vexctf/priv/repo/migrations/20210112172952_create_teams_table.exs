defmodule VexCTF.Core.Repo.Migrations.CreateTeamsTable do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string, null: false

      timestamps()
    end

    create unique_index(:teams, :team_name)
  end
end
