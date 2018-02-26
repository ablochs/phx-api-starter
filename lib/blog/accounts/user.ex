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
    field :password, :string, virtual: true

    timestamps()
  end

  # @doc false
  # def changeset(%User{} = user, attrs) do
  #   user
  #   |> cast(attrs, [:email, :first_name, :last_name, :password_hash, :is_admin, :email_verified])
  #   |> validate_required([:email, :first_name, :last_name, :password_hash, :is_admin, :email_verified])
  # end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :password, :password_hash, :is_admin, :email_verified])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> generate_encrypted_password
  end

  defp generate_encrypted_password(current_changeset) do
    case current_changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(current_changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        current_changeset
    end
  end

end
