defmodule PinterestBackend.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :message, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :pin_id, references(:pins, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:user_id])
    create index(:comments, [:pin_id])

  end
end
