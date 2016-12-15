defmodule PinterestBackend.Repo.Migrations.AddPgTrgm do
  use Ecto.Migration

  def change do
  	execute "CREATE EXTENSION pg_trgm;"
  	execute "CREATE INDEX pins_tags_trgm_index ON pins USING gin (tags gin_trgm_ops);"
  end
end
