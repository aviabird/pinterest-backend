defmodule PinterestBackend.Repo.Migrations.CreateUsersFollower do
  use Ecto.Migration

  def change do
    create table(:users_followers) do
      add :user_id, references(:users, on_delete: :nothing)
      add :follower_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:users_followers, [:user_id])
    create index(:users_followers, [:follower_id])

  end
end
