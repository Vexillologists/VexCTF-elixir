defmodule VexCTF.Core.Util.Scripts do
  @moduledoc """
  Scripts for debugging or development
  """

  @doc """
  Generates a bunch of debug users and teams then returns one user who is an
  admin and the team they belong to

  This generates `n_teams` teams and `n_teams * n_users` users (`n_users` users
  per team)
  """
  @spec generate_debug_users_and_teams!(integer, integer) :: {Schema.User, Schema.Team}
  def generate_debug_users_and_teams!(n_teams, n_users) do
    require Ecto.Query
    alias VexCTF.Core.Schema
    alias VexCTF.Core.Repo

    for(
      team <- 1..n_teams,
      do: team
    )
    |> Enum.each(fn team ->
      Repo.insert!(%Schema.Team{
        team_name: "dbgteam_#{team}"
      })
    end)

    for(
      team <- 1..n_users,
      user <- 1..n_users,
      do: {team, user}
    )
    |> Enum.each(fn {team, user} ->
      Repo.insert!(%Schema.User{
        username: "dbguser_#{team}_#{user}",
        email: "dbguser_#{team}_#{user}@example.com",
        email_confirmed: true,
        admin: false,
        team_id: Repo.get_by!(Schema.Team, team_name: "dbgteam_#{team}").id
      })
    end)

    # Make the first one an admin
    user = Repo.get_by!(Schema.User, username: "dbguser_1_1")
    user = Ecto.Changeset.change(user, admin: true)
    user = Repo.update!(user)
    team = Repo.get!(Schema.Team, user.team_id)
    {user, team}
  end
end
