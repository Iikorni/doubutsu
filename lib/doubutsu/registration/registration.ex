defmodule Doubutsu.Registration do
  alias Ecto.Multi
  alias Doubutsu.{Accounts, Things, Repo}

  def register_user(params) do
    Multi.new()
    |> Multi.run(:user, fn _repo, _changes -> Accounts.create_user(params) end)
    |> Multi.run(:inventory, fn _repo, %{user: user} -> Things.create_inventory(user) end)
    |> Repo.transaction()
  end
end
