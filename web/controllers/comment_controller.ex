defmodule PinterestBackend.CommentController do
  use PinterestBackend.Web, :controller

  alias PinterestBackend.Comment
  plug PinterestBackend.Plugs.Authenticate, "before all but index, show"  when not action in [:index, :show]

  def index(conn, _params) do
    comments = Repo.all(Comment) |> Repo.preload(:user)
    render(conn, "index.json", comments: comments)
  end

  def create(conn, %{"comment" => comment_params}) do
    changeset = Comment.changeset(%Comment{}, comment_params)

    case Repo.insert(changeset) do
      {:ok, comment} ->
        comment = comment |> Repo.preload(:user)

        PinterestBackend.CommentsChannel.broadcast_create(comment)

        conn
        |> put_status(:created)
        |> put_resp_header("location", comment_path(conn, :show, comment))
        |> render("show.json", comment: comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PinterestBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id) |> Repo.preload(:user)
    render(conn, "show.json", comment: comment)
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Repo.get!(Comment, id)
    changeset = Comment.changeset(comment, comment_params)

    case Repo.update(changeset) do
      {:ok, comment} ->
        render(conn, "show.json", comment: comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PinterestBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(comment)

    PinterestBackend.CommentsChannel.broadcast_delete(id, comment.user_id)

    send_resp(conn, :no_content, "")
  end
end
