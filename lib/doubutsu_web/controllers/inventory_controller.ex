defmodule DoubutsuWeb.InventoryController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Things.Item

  def show_individual(conn, _params) do
    render(conn, "show.html", title: "Inventory")
  end


end
