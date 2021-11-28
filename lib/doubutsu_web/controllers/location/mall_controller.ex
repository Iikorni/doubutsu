defmodule DoubutsuWeb.Location.MallController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Prizes
  alias Doubutsu.Things
  alias Doubutsu.Games

  def soup_get(conn, _) do
    render(conn, "soup.html", title: "Soup Kitchen")
  end

  def soup_request(conn, _) do
    current_user = conn.assigns[:current_user]
    if Games.game_locked?("soup_kitchen", current_user) do
      conn
      |> put_flash(:error, gettext "You can only use the soup kitchen once per day!")
      |> redirect(to: Routes.mall_path(conn, :soup_get))
    else
      owner = current_user.owner
      pets = Doubutsu.Pets.get_pets_for_owner(owner)
      if Enum.count(pets) == 0 do
        conn
        |> put_flash(:error, gettext "You need a pet to qualify for the soup kitchen!")
        |> redirect(to: Routes.mall_path(conn, :soup_get))
      else
        pairs = Enum.reduce(pets, [], fn pet, lst ->
          case Prizes.get_prize_from_prize_pool(Prizes.get_prize_pool_by_name!("soup_kitchen")) do
            {:ok, prize} ->
              case Things.create_instance_from_item_inventory(prize.item, current_user.inventory) do
                {:ok, _} ->
                  lst ++ [{pet, prize}]
                {:error, _} ->
                  lst
                end
            {:none, _} ->
              lst
          end
        end)
        if Enum.count(pairs) != 0 do
          Games.try_increment_lock("soup_kitchen", current_user)
          conn
          |> render("soup_result.html", title: "Soup Kitchen", pairs: pairs)
        else
          conn
          |> put_flash(:error, gettext "For some reason, the soup ran out!")
          |> redirect(to: Routes.mall_path(conn, :soup_get))
        end
      end
    end
  end

  def wheel(conn, _) do
    render(conn, "wheel.html", title: "Wheel")
  end

  def scratchcard_booth(conn, _) do
    scratch_types = Games.list_scratch_types()
    render(conn, "booth.html", title: "Scratchard Booth", scratch_types: scratch_types)
  end

  def scratchcard_purchase(conn, %{"request" => request}) do
    user = conn.assigns[:current_user]
    if Games.game_locked?("scratchcard", user) do
      conn
      |> put_flash(:error, gettext "You can only buy a scratchcard once every six hours!")
      |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
    else
      case Games.get_scratch_type_by_slug(request["scratch_id"]) do
        {:ok, scratch_type} ->
          if not Things.has_the_cash(user.inventory, scratch_type.item.price) do
            conn
            |> put_session(:purchase_token, nil)
            |> put_flash(:error, gettext "Whoops, it looks like you don't have enough money...")
            |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
          else
            token = get_session(conn, :purchase_token)
            if token && request["token"] == token do
              case Things.create_instance_from_item_inventory(scratch_type.item, user.inventory) do
                {:ok, _} ->
                  Games.try_increment_lock("scratchcard", user)
                  Things.subtract_cost(user.inventory, scratch_type.item.price)
                  conn
                  |> put_flash(:info, (gettext "Thank you very much for your purchase of a %{ticket} ticket!", ticket: scratch_type.name))
                  |> put_session(:purchase_token, nil)
                  |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
                {:error, _} ->
                  conn
                  |> put_flash(:error, gettext "Your purchase was unssuccesful, for whatever reason...")
                  |> put_session(:purchase_token, nil)
                  |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
              end
            else
              conn
              |> put_session(:purchase_token, nil)
              |> put_flash(:error, gettext "Hmm. We're not sure how you got here...")
              |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
            end
            conn
          end
        {:error, _} ->
          conn
          |> put_session(:purchase_token, nil)
          |> put_flash(:error, gettext "You didn't select a scratchcard!")
          |> redirect(to: Routes.mall_path(conn, :scratchcard_booth))
      end
    end
  end

  def index(conn, _) do
    render(conn, "mall.html", title: "Mall")
  end

  def vending_machine(conn, _) do
    render(conn, "vending.html", title: "Vending Machine")
  end

  def vending_machine_fallback(conn, _) do
    redirect(conn, to: Routes.mall_path(conn, :vending_machine))
  end

  def vending_machine_result(conn, %{"request" => request}) do
    user = conn.assigns[:current_user]
    if not Things.has_the_cash(user.inventory, 200) do
      conn
      |> put_flash(:error, gettext "Whoops, it looks like you don't have enough money...")
      |> redirect(to: Routes.mall_path(conn, :vending_machine))
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
                |> render("vending_result.html", title: "Vending Machine", prize: prize)
              {:error, _} ->
                conn
                |> put_session(:purchase_token, nil)
                |> render("vending_result.html", title: "Vending Machine", prize: nil)
            end
          {:none, nil} ->
            conn
            |> put_session(:purchase_token, nil)
            |> render("vending_result.html", title: "Vending Machine", prize: nil)
        end
      else
        conn
        |> put_flash(:error, gettext "Hmm. We're not sure how you got here...")
        |> redirect(to: Routes.mall_path(conn, :vending_machine))
      end
    end
  end
end
