defmodule DoubutsuWeb.Router do
  use DoubutsuWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DoubutsuWeb.Auth, repo: Doubutsu.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :needs_auth do
    import DoubutsuWeb.UserController
    plug :authenticate
  end

  pipeline :needs_admin do
    import DoubutsuWeb.UserController
    plug :auth_admin
  end

  scope "/", DoubutsuWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/register", UserController, :new
    post "/register", UserController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  scope "/mall", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    get "/vending", LocationController, :vending_get
    get "/vending_result", LocationController, :vending_res_get
    post "/vending_result", LocationController, :vending_post
  end

  scope "/users", DoubutsuWeb do
    pipe_through :browser

    get "/:id", UserController, :show
  end

  scope "/prizes", DoubutsuWeb do
    pipe_through :browser

    resources "/", PrizeController, except: [:index]

    get "/pool/new", PrizePoolController, :new
    post "/pool/create", PrizePoolController, :create
    get "/pool/:id", PrizePoolController, :show
  end

  scope "/items", DoubutsuWeb do
    pipe_through [:browser]
    resources "/", ItemController
  end

  scope "/inventory", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]
    get "/", InventoryController, :show_individual
  end

  # Other scopes may use custom stacks.
  # scope "/api", DoubutsuWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DoubutsuWeb.Telemetry
    end
  end
end
