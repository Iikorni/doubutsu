defmodule Doubutsu.Games.ScratchPrize do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scratch_prizes" do
    field :data, :string
    field :slug, :string
    field :type, Ecto.Enum, values: [:money, :item_prize, :jackpot]

    belongs_to :scratch_type, Doubutsu.Games.ScratchType

    timestamps()
  end

  @doc false
  def changeset(scratch_prize, attrs) do
    scratch_prize
    |> cast(attrs, [:slug, :type, :data])
    |> validate_required([:slug, :type, :data])
  end
end
