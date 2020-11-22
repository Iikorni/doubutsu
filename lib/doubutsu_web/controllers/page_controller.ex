defmodule DoubutsuWeb.PageController do
  use DoubutsuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", title: "Home")
  end
end
