defmodule DoubutsuWeb.InventoryController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Things

  def show_individual(conn, _params) do
    inventory = Things.get_full_inventory!(conn.assigns[:current_user].id)
    render(conn, "show.html", title: "Inventory", inventory: inventory)
  end


end
