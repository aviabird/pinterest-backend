defmodule PinterestBackend.Repo.Migrations.AddIndexToPinsNameDescription do
  use Ecto.Migration

  def change do
  	execute "CREATE INDEX pins_name_trgm_index ON pins USING gin (name gin_trgm_ops);"
  	execute "CREATE INDEX pins_description_trgm_index ON pins USING gin (description gin_trgm_ops);"
  end
end
