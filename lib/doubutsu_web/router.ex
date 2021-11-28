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

  pipeline :purchase_token_gen do
    plug DoubutsuWeb.PurchaseToken
  end

  scope "/", DoubutsuWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/test", PageController, :flash_test
    get "/register", UserController, :new
    post "/register", UserController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  scope "/mall", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    get "/", Location.MallController, :index
    post "/", Location.MallController, :index

    get "/wheel", Location.MallController, :wheel

    post "/booth", Location.MallController, :scratchcard_purchase

    get "/vending_result", Location.MallController, :vending_machine_fallback
    post "/vending_result", Location.MallController, :vending_machine_result

    get "/soup", Location.MallController, :soup_get
    post "/soup", Location.MallController, :soup_request

    pipe_through [:purchase_token_gen]
    get "/booth", Location.MallController, :scratchcard_booth
    get "/vending", Location.MallController, :vending_machine
  end

  scope "/users", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    get "/:id", UserController, :show
  end

  scope "/prizes", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    resources "/", PrizeController, except: [:index]

    get "/pool/new", PrizePoolController, :new
    post "/pool/create", PrizePoolController, :create
    get "/pool/:id", PrizePoolController, :show
  end

  scope "/pets", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    resources "/", PetController, only: [:show, :new]
    post "/new_pet", PetController, :new_pet
  end

  scope "/items", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]
    resources "/", ItemController
  end

  scope "/inventory", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]
    get "/", InventoryController, :show_individual
  end

  scope "/shop", DoubutsuWeb do
    pipe_through [:browser, :needs_auth]

    get "/:id", ShopController, :show
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
      live_dashboard "/dashboard", metrics: DoubutsuWeb.Telemetry, ecto_repos: [Doubutsu.Repo]
    end
  end
end
