defmodule PinterestBackend.PinView do
  use PinterestBackend.Web, :view

  def render("index.json", %{pins: pins}) do
    %{data: render_many(pins, PinterestBackend.PinView, "pin.json")}
  end

  def render("show.json", %{pin: pin}) do
    %{data: render_one(pin, PinterestBackend.PinView, "pin_w_comments.json")}
  end

  def render("pin.json", %{pin: pin}) do
    %{id: pin.id,
      name: pin.name,
      image_url: pin.image_url,
      url: pin.url,
      tags: pin.tags,
      description: pin.description,
      user: render_one(pin.user, PinterestBackend.UserView, "user.json", as: :user)}
  end

  def render("pin_w_comments.json", %{pin: pin}) do
    %{id: pin.id,
      name: pin.name,
      image_url: pin.image_url,
      url: pin.url,
      tags: pin.tags,
      description: pin.description,
      comments: render_many(pin.comments, PinterestBackend.CommentView, "comment.json"),
      user: render_one(pin.user, PinterestBackend.UserView, "user.json")}
  end
end
