defmodule DoubutsuWeb.PrizeController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Prizes.Prize
  alias Doubutsu.Prizes
  alias Doubutsu.Things

  def new(conn, _params) do
    changeset = Prizes.change_prize(%Prize{})
    items = Things.list_items
    prize_pools = Prizes.list_prize_pools
    render(conn, "new.html", changeset: changeset, title: "New Prize", items: items, prize_pools: prize_pools)
  end

  def create(conn, %{"prize" => prize_params}) do
    case Prizes.create_prize(prize_params) do
      {:ok, prize} ->
        prize = Doubutsu.Repo.preload(prize, :prize_pool)
        conn
        |> put_flash(:info, "Prize created successfully.")
        |> redirect(to: Routes.prize_pool_path(conn, :show, prize.prize_pool))
      {:error, %Ecto.Changeset{} = changeset} ->
        items = Things.list_items
        prize_pools = Prizes.list_prize_pools
        render(conn, "new.html", changeset: changeset, title: "New Prize", items: items, prize_pools: prize_pools)
      end
  end

  def edit(conn, %{"id" => id}) do
    prize = Prizes.get_prize!(id)
    changeset = Prizes.change_prize(prize)
    items = Things.list_items
    prize_pools = Prizes.list_prize_pools
    render(conn, "edit.html", prize: prize, changeset: changeset, title: "Edit Prize", items: items, prize_pools: prize_pools)
  end

  def update(conn, %{"id" => id, "prize" => prize_params}) do
    prize = Prizes.get_prize!(id)

    case Prizes.update_prize(prize, prize_params) do
      {:ok, prize} ->
        conn
        |> put_flash(:info, "Prize updated successfully.")
        |> redirect(to: Routes.prize_pool_path(conn, :show, prize.prize_pool))

      {:error, %Ecto.Changeset{} = changeset} ->
        items = Things.list_items
        prize_pools = Prizes.list_prize_pools
        render(conn, "edit.html", prize: prize, changeset: changeset, title: "Edit Prize", items: items, prize_pools: prize_pools)
      end
  end

end
