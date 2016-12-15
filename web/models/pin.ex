defmodule PinterestBackend.Pin do
  use PinterestBackend.Web, :model

  schema "pins" do
    field :name, :string
    field :image_url, :string
    field :url, :string
    field :tags, :string
    field :description, :string
    
    belongs_to :user, PinterestBackend.User
    has_many :comments, PinterestBackend.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :image_url, :url, :tags, :description, :user_id])
    |> validate_required([:name, :image_url, :url, :tags, :description, :user_id])
  end

  def preloaded do
    [:comments, :user]
  end

  def search(query, params, limit \\ 0.3) do
    search_query = Dict.get(params, "tags")
    if search_query do
      from(p in query,
        where: fragment("similarity(?, ?) > ?", p.tags, ^Dict.get(params, "tags", ""), ^limit),
        order_by: fragment("similarity(?, ?) DESC", p.tags, ^Dict.get(params, "tags", "")),
        limit: ^Dict.get(params, "limit", 10),
        offset: ^Dict.get(params, "offset", 0),
        preload: [:user]
      )
    else
      from(p in query,
        limit: ^Dict.get(params, "limit", 10),
        offset: ^Dict.get(params, "offset", 0),
        preload: [:user]
      )
    end
  end
end
