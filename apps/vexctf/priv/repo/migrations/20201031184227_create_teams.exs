defmodule VexCTF.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string, null: false
      add :points, :integer, null: false, default: 0

      timestamps()
    end

    create unique_index(:teams, :team_name)
  end
end
