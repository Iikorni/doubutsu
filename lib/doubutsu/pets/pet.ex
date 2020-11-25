defmodule Doubutsu.Pets.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :agility, :integer
    field :defense, :integer
    field :gender, Ecto.Enum, values: [:male, :female, :non_binary]
    field :health, :integer
    field :max_health, :integer
    field :hunger, Ecto.Enum, values: [:dying, :starving, :famished, :very_hungry, :hungry, :not_hungry, :fine, :satiated, :full_up, :very_full, :bloated, :very_bloated]
    field :last_hunger_tick, :naive_datetime
    field :intellect, :integer
    field :level, :integer
    field :name, :string
    field :strength, :integer
    belongs_to :owner, Doubutsu.Pets.Owner
    belongs_to :breed, Doubutsu.Pets.Breed
    belongs_to :colour, Doubutsu.Pets.Colour

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :gender, :level, :health, :hunger, :strength, :defense, :agility, :intellect, :owner_id, :breed_id, :colour_id])
    |> validate_required([:name, :gender, :level, :health, :hunger, :strength, :defense, :agility, :intellect, :owner_id, :breed_id, :colour_id])
  end
end
