defmodule Doubutsu.Things.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :name, :string
    field :no_trade, :boolean, default: false
    field :picture, :string
    field :price, :integer
    field :rarity, :integer
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :weight, :price, :rarity, :picture, :no_trade])
    |> validate_required([:name, :description, :weight, :price, :rarity, :picture, :no_trade])
  end
end
