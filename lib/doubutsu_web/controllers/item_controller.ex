defmodule DoubutsuWeb.ItemController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Things
  alias Doubutsu.Things.Item

  def index(conn, _params) do
    items = Things.list_items()
    render(conn, "index.html", items: items, title: "List of Items")
  end

  def new(conn, _params) do
    changeset = Things.change_item(%Item{})
    render(conn, "new.html", changeset: changeset, title: "New Item")
  end

  def create(conn, %{"item" => item_params}) do
    case Things.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: Routes.item_path(conn, :show, item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, title: "New Item")
    end
  end

  def show(conn, %{"id" => id}) do
    item = Things.get_item!(id)
    render(conn, "show.html", item: item, title: "Show Item")
  end

  def edit(conn, %{"id" => id}) do
    item = Things.get_item!(id)
    changeset = Things.change_item(item)
    render(conn, "edit.html", item: item, changeset: changeset, title: "Edit Item")
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Things.get_item!(id)

    case Things.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: Routes.item_path(conn, :show, item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset, title: "Edit Item")
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Things.get_item!(id)
    {:ok, _item} = Things.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: Routes.item_path(conn, :index))
  end
end
