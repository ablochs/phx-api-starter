defmodule Blog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :password_hash, :string, null: false
      add :is_admin, :boolean, default: false, null: false
      add :email_verified, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])

  end
end
