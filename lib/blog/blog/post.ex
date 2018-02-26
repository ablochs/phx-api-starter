defmodule Blog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Blog.Post


  schema "posts" do
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
