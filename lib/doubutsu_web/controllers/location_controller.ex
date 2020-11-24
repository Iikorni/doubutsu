defmodule DoubutsuWeb.LocationController do
  use DoubutsuWeb, :controller


  def vending_get(conn, _) do
    token = Doubutsu.Util.gen_token()
    conn
    |> put_session(:vend_token, token)
    |> render("vending.html", title: "Vending Machine", token: token)
  end

  def vending_res_get(conn, _) do
    conn
    |> redirect(to: Routes.location_path(conn, :vending_get))
  end

  def vending_post(conn, %{"request" => request}) do
    user = conn.assigns[:current_user]
    if user.inventory.money < 200 do
      conn
      |> put_flash(:error, "Whoops, it looks like you don't have enough money...")
      |> redirect(to: Routes.location_path(conn, :vending_get))
    else
      token = get_session(conn, :vend_token)
      if token && request["token"] == token do
        conn
        |> put_session(:vend_token, nil)
        |> render("vending_result.html", title: "Vending Machine")
      else
        conn
        |> put_flash(:error, "Hmm. We're not sure how you got here...")
        |> redirect(to: Routes.location_path(conn, :vending_get))
      end
    end
  end
end
