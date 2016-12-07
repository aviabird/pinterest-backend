defmodule PinterestBackend.PinController do
  use PinterestBackend.Web, :controller
  require IEx

  alias PinterestBackend.Pin
    
  plug PinterestBackend.Plugs.Authenticate, "before all but index"  when not action in [:index]

  def index(conn, _params) do
    query = from pins in Pin, preload: [:user]
    pins = Repo.all(query)
    render(conn, "index.json", pins: pins)
  end

  def create(conn, %{"pin" => pin_params}) do
    changeset = Pin.changeset(%Pin{}, pin_params)

    case Repo.insert(changeset) do
      {:ok, pin} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", pin_path(conn, :show, pin))
        |> render("show.json", pin: pin)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PinterestBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pin = Repo.get!(Pin, id) |> Repo.preload([:user, {:comments, [:user]}])
    render(conn, "show.json", pin: pin)
  end

  def update(conn, %{"id" => id, "pin" => pin_params}) do
    pin = Repo.get!(Pin, id)
    changeset = Pin.changeset(pin, pin_params)

    case Repo.update(changeset) do
      {:ok, pin} ->
        render(conn, "show.json", pin: pin)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PinterestBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pin = Repo.get!(Pin, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pin)

    send_resp(conn, :no_content, "")
  end
end
