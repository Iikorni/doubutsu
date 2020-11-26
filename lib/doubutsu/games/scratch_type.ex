defmodule Doubutsu.Games.ScratchType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scratch_types" do
    field :name, :string
    field :slug, :string

    belongs_to :item, Doubutsu.Things.Item
    has_many :scratch_prizes, Doubutsu.Games.ScratchPrizes

    timestamps()
  end

  @doc false
  def changeset(scratch_type, attrs) do
    scratch_type
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
