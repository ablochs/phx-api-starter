defmodule Blog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Accounts.User


  schema "users" do
    field :email, :string
    field :email_verified, :boolean, default: false
    field :first_name, :string
    field :is_admin, :boolean, default: false
    field :last_name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :password_hash, :is_admin, :email_verified])
    |> validate_required([:email, :first_name, :last_name, :password_hash, :is_admin, :email_verified])
  end
end
