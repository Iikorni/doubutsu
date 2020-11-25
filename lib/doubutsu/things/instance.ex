defmodule Doubutsu.Things.Instance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "instances" do
    belongs_to :item, Doubutsu.Things.Item
    belongs_to :inventory, Doubutsu.Things.Inventory

    timestamps()
  end

  @doc false
  def changeset(instance, attrs) do
    instance
    |> cast(attrs, [])
    |> validate_required([])
  end

  def invitem_changeset(instance, item, inventory) do
    instance
    |> cast(%{}, [])
    |> put_change(:item_id, item.id)
    |> put_change(:inventory_id, inventory.id)
  end
end
