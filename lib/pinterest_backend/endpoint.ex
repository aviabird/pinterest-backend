defmodule PinterestBackend.Endpoint do
  use Phoenix.Endpoint, otp_app: :pinterest_backend

  socket "/socket", PinterestBackend.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  # plug Plug.Static,
  #  at: "/", from: :pinterest_backend, gzip: false,
  #  only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_pinterest_backend_key",
    signing_salt: "P0fLiR3o"

  plug Corsica,
    origins: ["https://aviabird.github.io", "http://localhost:4200"],
    allow_headers: ["access-control-allow-origin", "authorization", "content-type", "x-auth-token"]

  plug PinterestBackend.Router
end

