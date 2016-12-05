defmodule PinterestBackend.Repo.Migrations.CreatePin do
  use Ecto.Migration

  def change do
    create table(:pins) do
      add :name, :string
      add :image_url, :string
      add :url, :string
      add :tags, :string
      add :description, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:pins, [:user_id])

  end
end
