defmodule PinterestBackend.PinTest do
  use PinterestBackend.ModelCase
  import PinterestBackend.JsonFactory
  alias PinterestBackend.Pin

  @valid_attrs build(:pin)
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pin.changeset(@valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pin.changeset(%Pin{}, @invalid_attrs)
    refute changeset.valid?
  end
end
