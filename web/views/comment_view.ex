defmodule PinterestBackend.CommentView do
  use PinterestBackend.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, PinterestBackend.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, PinterestBackend.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      user_id: comment.user_id,
      pin_id: comment.pin_id,
      user: render_one(comment.user, PinterestBackend.UserView, "user.json")}
  end
end
