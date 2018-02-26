defmodule Blog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Blog.Comment


  schema "comments" do
    field :body, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
