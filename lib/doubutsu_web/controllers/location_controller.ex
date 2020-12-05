defmodule DoubutsuWeb.LocationController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Prizes
  alias Doubutsu.Things
  alias Doubutsu.Games

  def soup_get(conn, _) do
    render(conn, "mall/soup.html", title: "Soup Kitchen")
  end

  def soup_request(conn, _) do
    current_user = conn.assigns[:current_user]
    owner = current_user.owner
    pets = Doubutsu.Pets.get_pets_for_owner(owner)
    if Enum.count(pets) == 0 do
      conn
      |> put_flash(:error, "You need a pet to qualify for the soup kitchen!")
      |> redirect(to: Routes.location_path(conn, :soup_get))
    else
      pairs = Enum.reduce(pets, [], fn pet, lst ->
        case Prizes.get_prize_from_prize_pool(Prizes.get_prize_pool_by_name!("soup_kitchen")) do
          {:ok, prize} ->
            lst ++ [{pet, prize}]
          {:none, _} ->
            lst ++ [{pet, nil}]
        end
      end)
      conn
      |> render("mall/soup_result.html", title: "Soup Kitchen", pairs: pairs)
    end
  end

  def wheel(conn, _) do
    render(conn, "mall/wheel.html", title: "Wheel")
  end

  def scratchcard_booth(conn, _) do
    scratch_types = Games.list_scratch_types()
    render(conn, "mall/booth.html", title: "Scratchard Booth", scratch_types: scratch_types)
  end

  def scratchcard_purchase(conn, %{"request" => request}) do
    user = conn.assigns[:current_user]
    if Games.game_locked?("scratchcard", user) do
      conn
      |> put_flash(:error, "You can only buy a scratchcard once every six hours!")
      |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
    else
      case Games.get_scratch_type_by_slug(request["scratch_id"]) do
        {:ok, scratch_type} ->
          if not Things.has_the_cash(user.inventory, scratch_type.item.price) do
            conn
            |> put_session(:purchase_token, nil)
            |> put_flash(:error, "Whoops, it looks like you don't have enough money...")
            |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
          else
            token = get_session(conn, :purchase_token)
            if token && request["token"] == token do
              case Things.create_instance_from_item_inventory(scratch_type.item, user.inventory) do
                {:ok, _} ->
                  Games.try_increment_lock("scratchcard", user)
                  Things.subtract_cost(user.inventory, scratch_type.item.price)
                  conn
                  |> put_flash(:info, "Thank you very much for your purchase of a #{scratch_type.name} ticket!")
                  |> put_session(:purchase_token, nil)
                  |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
                {:error, _} ->
                  conn
                  |> put_flash(:error, "Your purchase was unssuccesful, for whatever reason...")
                  |> put_session(:purchase_token, nil)
                  |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
              end
            else
              conn
              |> put_session(:purchase_token, nil)
              |> put_flash(:error, "Hmm. We're not sure how you got here...")
              |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
            end
            conn
          end
        {:error, _} ->
          conn
          |> put_session(:purchase_token, nil)
          |> put_flash(:error, "You didn't select a scratchcard!")
          |> redirect(to: Routes.location_path(conn, :scratchcard_booth))
      end
    end
  end

  def mall(conn, _) do
    render(conn, "mall/mall.html", title: "Mall")
  end

  def vending_machine(conn, _) do
    render(conn, "mall/vending.html", title: "Vending Machine")
  end

  def vending_machine_fallback(conn, _) do
    redirect(conn, to: Routes.location_path(conn, :vending_machine))
  end

  def vending_machine_result(conn, %{"request" => request}) do
    user = conn.assigns[:current_user]
    if not Things.has_the_cash(user.inventory, 200) do
      conn
      |> put_flash(:error, "Whoops, it looks like you don't have enough money...")
      |> redirect(to: Routes.location_path(conn, :vending_machine))
    else
      token = get_session(conn, :purchase_token)
      if token && request["token"] == token do
        case Prizes.get_prize_from_prize_pool(Prizes.get_prize_pool_by_name!("vending_machine")) do
          {:ok, prize} ->
            case Things.create_instance_from_item_inventory(prize.item, user.inventory) do
              {:ok, _} ->
                Things.subtract_cost(user.inventory, 200)
                conn
                |> put_session(:purchase_token, nil)
                |> render("mall/vending_result.html", title: "Vending Machine", prize: prize)
              {:error, _} ->
                conn
                |> put_session(:purchase_token, nil)
                |> render("mall/vending_result.html", title: "Vending Machine", prize: nil)
            end
          {:none, nil} ->
            conn
            |> put_session(:purchase_token, nil)
            |> render("mall/vending_result.html", title: "Vending Machine", prize: nil)
        end
      else
        conn
        |> put_flash(:error, "Hmm. We're not sure how you got here...")
        |> redirect(to: Routes.location_path(conn, :vending_machine))
      end
    end
  end
end
