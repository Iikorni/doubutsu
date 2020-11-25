defmodule DoubutsuWeb.LocationController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Prizes
  alias Doubutsu.Things


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
    if not Things.has_the_cash(user.inventory, 200) do
      conn
      |> put_flash(:error, "Whoops, it looks like you don't have enough money...")
      |> redirect(to: Routes.location_path(conn, :vending_get))
    else
      token = get_session(conn, :vend_token)
      if token && request["token"] == token do
        case Prizes.get_prize_from_prize_pool(Prizes.get_prize_pool_by_name!("vending_machine")) do
          {:ok, prize} ->
            case Things.create_instance_from_item_inventory(prize.item, user.inventory) do
              {:ok, _} ->
                Things.subtract_cost(user.inventory, 200)
                conn
                |> put_session(:vend_token, nil)
                |> render("vending_result.html", title: "Vending Machine", prize: prize)
              {:error, _} ->
                conn
                |> put_session(:vend_token, nil)
                |> render("vending_result.html", title: "Vending Machine", prize: nil)
            end
          {:none, nil} ->
            conn
            |> put_session(:vend_token, nil)
            |> render("vending_result.html", title: "Vending Machine", prize: nil)
        end
      else
        conn
        |> put_flash(:error, "Hmm. We're not sure how you got here...")
        |> redirect(to: Routes.location_path(conn, :vending_get))
      end
    end
  end
end
