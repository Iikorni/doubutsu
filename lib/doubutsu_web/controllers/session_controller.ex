defmodule DoubutsuWeb.SessionController do
  use DoubutsuWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html", title: "Login")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case DoubutsuWeb.Auth.login_with_user_pass(conn, username, password, repo: Doubutsu.Repo) do
      {:ok, conn} ->
        conn
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, gettext "Invalid username/password")
        |> render("new.html", title: "Login")
    end
  end

  def delete(conn, _params) do
    conn
    |> DoubutsuWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
