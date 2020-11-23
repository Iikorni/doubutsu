defmodule Doubutsu.Things.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    field :money, :integer
    belongs_to :user, Doubutsu.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [:money])
    |> validate_required([:money])
  end
end
