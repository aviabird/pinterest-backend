defmodule PinterestBackend.Plugs.Authenticate do
  import Plug.Conn
  require IEx
  alias PinterestBackend.Repo
  alias PinterestBackend.User

  def init(options), do: options

  def call(conn, _) do
   result = validate_token(conn, conn.params["token"])

   case result do
     :missing_token ->
       conn |> send_resp(401, "Missing valid Api token") |> halt
     :invalid_token ->
       conn |> send_resp(401, "Invalid Api token") |> halt
     { :authenticated, user } ->
       conn |> assign(:current_user, user)
   end
  end

  defp validate_token(conn, token) do
    case token do
      nil -> :missing_token
      _ -> assign_user(conn, token)
    end
  end

  defp assign_user(conn, token) do
    # Max age of 2 weeks (1209600 seconds)
    case Phoenix.Token.verify(conn, "user", token, max_age: 1209600) do
      {:ok, user_id} ->
        user = Repo.get!(User, user_id)
        { :authenticated, user }
      {:error, _} -> :invalid_token
    end
  end
end
