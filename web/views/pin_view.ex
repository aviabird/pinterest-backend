defmodule PinterestBackend.PinView do
  use PinterestBackend.Web, :view

  def render("index.json", %{pins: pins}) do
    %{data: render_many(pins, PinterestBackend.PinView, "pin.json")}
  end

  def render("show.json", %{pin: pin}) do
    %{data: render_one(pin, PinterestBackend.PinView, "pin.json")}
  end

  def render("pin.json", %{pin: pin}) do
    %{id: pin.id,
      name: pin.name,
      image_url: pin.image_url,
      url: pin.url,
      tags: pin.tags,
      user_id: pin.user_id,
      description: pin.description}
  end
end
