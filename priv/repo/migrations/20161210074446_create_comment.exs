defmodule PinterestBackend.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do

      timestamps()
    end

  end
end
