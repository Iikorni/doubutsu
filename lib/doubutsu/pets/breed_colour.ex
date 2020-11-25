defmodule Doubutsu.Pets.BreedColour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "breed_colours" do
    belongs_to :breed, Doubutsu.Pets.Breed
    belongs_to :colour, Doubutsu.Pets.Colour

    timestamps()
  end

  @doc false
  def changeset(breed_colour, attrs) do
    breed_colour
    |> cast(attrs, [])
    |> validate_required([])
  end
end
