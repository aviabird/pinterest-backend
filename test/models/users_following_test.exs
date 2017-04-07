defmodule PinterestBackend.UsersFollowingTest do
  use PinterestBackend.ModelCase

  alias PinterestBackend.UsersFollowing

  @valid_attrs %{user_id: 1, following_id: 2}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UsersFollowing.changeset(%UsersFollowing{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UsersFollowing.changeset(%UsersFollowing{}, @invalid_attrs)
    refute changeset.valid?
  end
end
