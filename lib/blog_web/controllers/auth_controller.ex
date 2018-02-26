defmodule BlogWeb.AuthController do
  use BlogWeb, :controller

  alias Blog.Accounts
  alias BlogWeb.AuthView

  action_fallback BlogWeb.FallbackController

  def delete(conn, _) do
    conn
    |> revoke_claims
    |> render("delete.json", data: %{})
  end

  defp revoke_claims(conn) do
    {:ok, claims} = Guardian.Plug.claims(conn)
    Guardian.Plug.current_token(conn)
    |> Guardian.revoke!(claims)
    conn
  end

  def create(conn, %{"email" => email, "password" => password}) do
    user = Accounts.get_user_by_email(email)
    user
    |> check_password(password)
    |> handle_check_password(conn, user)
  end

  defp check_password(nil, _password), do: false
  defp check_password(user, password) do
    Comeonin.Bcrypt.checkpw(password, user.password_hash)
  end

  defp handle_check_password(true, conn, user) do
    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)
    conn
    |> put_status(:created)
    |> render("show.json", jwt: jwt)
  end

  defp handle_check_password(false, conn, _user) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("error.json", error: "Unable to authenticate")
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(AuthView, "forbidden.json", error: "Not Authenticated")
  end

end
