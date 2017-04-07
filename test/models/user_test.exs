defmodule PinterestBackend.UserTest do
  use PinterestBackend.ModelCase
  alias PinterestBackend.User

  require IEx

  @valid_attrs PinterestBackend.JsonFactory.build(:user)
  @invalid_attrs %{email: "test.com"}

  test "changeset with valid attributes" do
    changeset = User.changeset(@valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
