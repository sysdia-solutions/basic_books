defmodule BasicBooks.Router do
  use BasicBooks.Web, :router

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

  scope "/", BasicBooks do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/terms", TermController
    resources "/contacts", ContactController
    resources "/companies", CompanyController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicBooks do
  #   pipe_through :api
  # end
end
