defmodule PinterestBackend.Comment do
  use PinterestBackend.Web, :model

  schema "comments" do
    field :message, :string
    belongs_to :user, PinterestBackend.User
    belongs_to :pin, PinterestBackend.Pin

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:message, :user_id, :pin_id])
    |> validate_required([:message, :user_id, :pin_id])
  end
end
