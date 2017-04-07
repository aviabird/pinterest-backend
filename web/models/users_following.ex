defmodule PinterestBackend.UsersFollowing do
  use PinterestBackend.Web, :model

  schema "users_followings" do
    belongs_to :user, PinterestBackend.User
    belongs_to :following, PinterestBackend.Following

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :following_id])
    |> validate_required([:user_id, :following_id])
  end
end
