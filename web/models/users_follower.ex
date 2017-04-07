defmodule PinterestBackend.UsersFollower do
  use PinterestBackend.Web, :model

  schema "users_followers" do
    belongs_to :user, PinterestBackend.User
    belongs_to :follower, PinterestBackend.Follower

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :follower_id])
    |> validate_required([:user_id, :follower_id])
  end
end
