defmodule BlogWeb.Router do
  use BlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", BlogWeb do
    pipe_through :api

    post "/login", AuthController, :create
    post "/logout", AuthController, :delete
    resources "/posts", PostController, except: [:new, :edit] do
      resources "/comments", CommentController, except: [:new, :edit]
    end
    resources "/users", UserController, except: [:new, :edit]

  end
end
