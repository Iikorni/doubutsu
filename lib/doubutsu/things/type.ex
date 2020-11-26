defmodule Doubutsu.Things.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :name, :string
    field :functional_type, Ecto.Enum, values: [:nothing, :food, :book, :potion, :paintbrush]
    has_many :items, Doubutsu.Things.Item

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
