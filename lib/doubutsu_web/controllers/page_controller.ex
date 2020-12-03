defmodule DoubutsuWeb.PageController do
  use DoubutsuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", title: "Home")
  end

  def flash_test(conn, _params) do
    conn
    |> put_flash(:info, "This is a test!")
    |> put_flash(:error, "Did something go wrong?")
    |> render("index.html", title: "Home")
  end
end
