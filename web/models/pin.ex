defmodule PinterestBackend.Pin do
  use PinterestBackend.Web, :model

  schema "pins" do
    field :name, :string
    field :image_url, :string
    field :url, :string
    field :tags, :string
    field :description, :string
    belongs_to :user, PinterestBackend.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :image_url, :url, :tags, :description])
    |> validate_required([:name, :image_url, :url, :tags, :description])
  end
end
