defmodule DoubutsuWeb.PetController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Pets

  def show(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    render(conn, "show.html", pet: pet, title: "Viewing Pet")
  end
end
