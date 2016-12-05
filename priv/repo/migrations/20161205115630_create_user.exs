defmodule PinterestBackend.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :avatar, :string
      add :provider, :string

      timestamps()
    end

  end
end
