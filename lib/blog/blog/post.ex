defmodule Blog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Blog.Post


  schema "posts" do
    field :title, :string
    field :body, :text
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
