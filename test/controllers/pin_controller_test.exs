defmodule PinterestBackend.PinControllerTest do
  use PinterestBackend.ConnCase

  alias PinterestBackend.Pin

  @valid_attrs %{
    description: "some content",
    image_url: "some content",
    name: "some content",
    tags: "some content",
    url: "some content"
  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get(conn, pin_path(conn, :index))
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    pin = Repo.insert!(%Pin{})
    conn = get(conn, pin_path(conn, :show, pin))

    assert json_response(conn, 200)["data"] == %{
             "id" => pin.id,
             "name" => pin.name,
             "image_url" => pin.image_url,
             "url" => pin.url,
             "tags" => pin.tags,
             "user_id" => pin.user_id,
             "description" => pin.description
           }
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent(404, fn ->
      get(conn, pin_path(conn, :show, -1))
    end)
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post(conn, pin_path(conn, :create), pin: @valid_attrs)
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Pin, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post(conn, pin_path(conn, :create), pin: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    pin = Repo.insert!(%Pin{})
    conn = put(conn, pin_path(conn, :update, pin), pin: @valid_attrs)
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Pin, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pin = Repo.insert!(%Pin{})
    conn = put(conn, pin_path(conn, :update, pin), pin: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    pin = Repo.insert!(%Pin{})
    conn = delete(conn, pin_path(conn, :delete, pin))
    assert response(conn, 204)
    refute Repo.get(Pin, pin.id)
  end
end
