defmodule VexCTF.Repo.Migrations.UserTeamId do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :team_id, references(:teams, on_delete: :delete_all, validate: true)
    end
  end
end
