defmodule Doubutsu.Pets.Breed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "breeds" do
    field :description, :string
    field :name, :string
    field :plural, :string
    field :slug, :string

    belongs_to :display_colour, Doubutsu.Pets.Colour
    has_many :breed_colours, Doubutsu.Pets.BreedColour

    timestamps()
  end

  @doc false
  def changeset(breed, attrs) do
    breed
    |> cast(attrs, [:slug, :name, :plural, :description])
    |> validate_required([:slug, :name, :plural, :description])
  end
end
