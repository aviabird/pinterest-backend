defmodule PinterestBackend.UserView do
  use PinterestBackend.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PinterestBackend.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PinterestBackend.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
      provider: user.provider}
  end
end
