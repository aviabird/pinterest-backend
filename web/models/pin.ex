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
    |> validate_required([:name, :image_url, :url, :tags, :description])
    |> validate_format(:image_url, ~r/(https?:\/\/.*\.(?:png|jpg|jpeg|gif|png|svg))/i)
    |> validate_format(:url, ~r/(https?:\/\/.*\.)/i)
    |> validate_length(:name, max: 250)
    |> validate_length(:description, max: 250)
    |> validate_length(:tags, max: 250)
    |> validate_length(:name, min: 5)
    |> validate_length(:description, min: 5)
  end

  def search(query, params, limit \\ 0.3) do
    search_query = Dict.get(params, "tags")

    if search_query  do 
      from(p in query,
        where: fragment(
          "similarity(?, ?) > ? or similarity(?,?) > 0.2 or similarity(?,?) > 0.1",
          p.tags, ^search_query, ^limit,
          p.name, ^search_query,
          p.description, ^search_query),
        order_by: fragment(
          "similarity(?, ?), similarity(?,?), similarity(?,?) DESC",
          p.tags, ^search_query,
          p.name, ^search_query,
          p.description, ^search_query)
      )
    else
      query
    end
  end

  def with_limit_offset(query, params) do
    from p in query,
      limit: ^Dict.get(params, "limit", 20),
      offset: ^Dict.get(params, "offset", 0),
      preload: [:user]
  end
end
