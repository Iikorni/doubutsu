defmodule Doubutsu.Prizes.Prize do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prizes" do
    field :weight, :integer
    belongs_to :prize_pool, Doubutsu.Prizes.PrizePool
    belongs_to :item, Doubutsu.Things.Item

    timestamps()
  end

  @doc false
  def changeset(prize, attrs) do
    prize
    |> cast(attrs, [:weight, :prize_pool_id, :item_id])
    |> validate_required([:weight, :prize_pool_id, :item_id])
  end
end
