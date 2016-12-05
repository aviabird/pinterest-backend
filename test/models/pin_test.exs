defmodule PinterestBackend.PinTest do
  use PinterestBackend.ModelCase

  alias PinterestBackend.Pin

  @valid_attrs %{description: "some content", image_url: "some content", name: "some content", tags: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pin.changeset(%Pin{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pin.changeset(%Pin{}, @invalid_attrs)
    refute changeset.valid?
  end
end
