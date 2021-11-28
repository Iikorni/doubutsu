defmodule DoubutsuWeb.PetController do
  use DoubutsuWeb, :controller

  alias Doubutsu.Pets

  def my_pets(conn, _params) do
    current_owner = conn.assigns[:current_user].owner
    render(conn, "pet_list.html", title: "My Pets", pets: current_owner.pets)
  end

  def show(conn, %{"id" => id}) do
    pet = Pets.get_pet!(id)
    render(conn, "show.html", title: "Viewing Pet", pet: pet)
  end

  def new(conn, _) do
    breeds = Pets.list_breeds()
    render(conn, "new.html", title: "Create a Pet", breeds: breeds)
  end

  def new_pet(conn, %{"breed" => breed}) do
      conn
      |> put_flash(:error, breed)
      |> redirect(to: Routes.pet_path(conn, :new))
  end

  def new_pet(conn, _) do
    conn
    |> put_flash(:error, gettext "You must select a pet breed before continuing!")
    |> redirect(to: Routes.pet_path(conn, :new))
  end
end
