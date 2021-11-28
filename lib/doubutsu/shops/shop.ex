defmodule Doubutsu.Shops.Shop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shops" do
    field :description, :string
    field :keeper_image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:name, :keeper_image, :description])
    |> validate_required([:name, :keeper_image, :description])
  end
end
