defmodule BlogWeb.AuthView do
  use BlogWeb, :view
  alias BlogWeb.AuthView

  def render("show.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end

  def render("delete.json", _) do
    %{ok: true}
  end

  def render("forbidden.json", %{error: error}) do
    %{error: error}
  end

end
