defmodule Phxblog.Router do
  use Phxblog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Phxblog do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController do
      resources "/posts", PostController
    end
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController, only: [] do
      resources "/comments", CommentController, only: [:create, :delete, :update]
    end
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Phxblog do
  #   pipe_through :api
  # end
end
