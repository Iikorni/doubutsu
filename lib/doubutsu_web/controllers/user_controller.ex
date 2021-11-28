defmodule DoubutsuWeb.UserController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Accounts
  alias Doubutsu.Accounts.User
  alias Doubutsu.Registration

  plug :authenticate when action in [:show]

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset, title: "Register")
  end

  def create(conn, %{"user" => user_params}) do
    case Registration.register_user(user_params) do
      {:ok, %{user: user}} ->
        conn
        |> DoubutsuWeb.Auth.login(user)
        |> put_flash(:info, gettext("User created successfully."))
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, title: "Register")
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user, title: "Profile")
  end

  def authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, gettext("You're not logged in!"))
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def auth_admin(conn, _opts) do
    if conn.assigns.current_user && conn.assigns.current_user.role == 1 do
      conn
    else
      conn
      |> put_status(:not_found)
      |> put_view(DoubutsuWeb.ErrorView)
      |> render("404.html", title: "Not found")
      |> halt()
    end
  end
end
