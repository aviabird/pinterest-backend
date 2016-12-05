defmodule PinterestBackend.Repo.Migrations.CreateUsersFollowing do
  use Ecto.Migration

  def change do
    create table(:users_followings) do
      add :user_id, references(:users, on_delete: :nothing)
      add :following_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:users_followings, [:user_id])
    create index(:users_followings, [:following_id])

  end
end
