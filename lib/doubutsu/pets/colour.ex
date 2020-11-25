defmodule Doubutsu.Pets.Colour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colours" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(colour, attrs) do
    colour
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
