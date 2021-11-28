defmodule DoubutsuWeb.ShopController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Shops

  def show(conn, %{"id" => id}) do
    shop = Shops.get_shop(id)
    if !shop do
      conn
      |> put_status(:not_found)
      |> put_view(DoubutsuWeb.ErrorView)
      |> render("404.html", title: "Not found")
      |> halt()
    else
      render(conn, "show.html", title: "Browsing #{shop.name}", shop: shop)
    end
  end
end
