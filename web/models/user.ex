defmodule PinterestBackend.User do
  use PinterestBackend.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :avatar, :string
    field :provider, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :avatar, :provider])
    |> validate_required([:name, :email, :avatar, :provider])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
