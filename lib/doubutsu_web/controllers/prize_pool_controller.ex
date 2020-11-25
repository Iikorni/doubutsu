defmodule DoubutsuWeb.PrizePoolController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Prizes
  alias Doubutsu.Prizes.PrizePool

  def new(conn, _params) do
    changeset = Prizes.change_prize_pool(%PrizePool{})
    render(conn, "new.html", changeset: changeset, title: "New Prize Pool")
  end

  def create(conn, %{"prize_pool" => prize_pool_params}) do
    case Prizes.create_prize_pool(prize_pool_params) do
      {:ok, prize_pool} ->
        conn
        |> put_flash(:info, "Prize pool created successfully.")
        |> redirect(to: Routes.prize_pool_path(conn, :show, prize_pool))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, title: "New Prize Pool")
    end
  end

  def show(conn, %{"id" => id}) do
    prize_pool = Prizes.get_prize_pool!(id)
    render(conn, "show.html", prize_pool: prize_pool, title: "Prize Pool")
  end
end
